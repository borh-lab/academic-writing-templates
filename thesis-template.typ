#import "./lib.typ"

#let thesis(
  author: none,
  title: none,
  subtitle: none,
  venue: none,
  date: none,
  affiliation: "大阪大学 大学院人文学研究科 言語文化学専攻",
  status: none,
  supervisors: none,
  font-size: 11pt,
  bibliography-file: none,
  bibliography-style: "apa",
  bibliography-size: 11pt,
  language: "ja",
  abstract: none,
  dedication: none,
  publishing-info: none,
  body
) = {
  // Settings

  // Creates a pagebreak to the given parity where empty pages
  // can be detected via `is-page-empty`.
  let detectable-pagebreak(to: "odd") = {
    [#metadata(none) <empty-page-start>]
    pagebreak(to: to)
    [#metadata(none) <empty-page-end>]
  }

  // Workaround for https://github.com/typst/typst/issues/2722
  let is-page-empty() = {
    let page-num = here().page()
    query(<empty-page-start>)
      .zip(query(<empty-page-end>))
      .any(((start, end)) => {
        (start.location().page() < page-num
          and page-num < end.location().page())
      })
  }

  set document(title: title, author: author)

  set text(
    lang: language,
    size: font-size,
    font: lib.default_serif + lib.japanese_serif
  )

  set page(
    paper: "a4",
    margin: (left: 3cm, right: 3cm, bottom: 3cm, top: 3cm),
  )

  set heading(numbering: "1. ")
  set math.equation(numbering: "(1)")

  // The first page.
  page(align(center + horizon)[
    #text(2em)[*#title*]
    #v(2em, weak: true)
    #text(1.6em, author)
  ])

  // Display publisher info at the bottom of the second page.
  if publishing-info != none {
    align(center + bottom, text(0.8em, publishing-info))
  }

  pagebreak()

  // Display the dedication at the top of the third page.
  if dedication != none {
    v(15%)
    align(center, strong(dedication))
  }

  // Books like their empty pages.
  pagebreak(to: "odd")

  // Configure paragraph properties.
  //
  // For Japanese:
  let fli = if language == "ja" {1em} else {0em}
  let par-spacing = if language == "ja" {0.68em} else {1.2em}
  set par(justify: true, first-line-indent: fli, spacing: par-spacing)
  // set par(spacing: 0.78em, leading: 0.78em, first-line-indent: 1em, justify: true)

  outline()
  pagebreak(to: "odd", weak: true)

  // Configure page properties.
  set page(
    // The header always contains the book title on odd pages and
    // the author on even pages, unless
    // - we are on an empty page
    // - we are on a page that starts a chapter
    header: context {
      // Is this an empty page inserted to keep page parity?
      if is-page-empty() {
        return
      }

      // Are we on a page that starts a chapter?
      let i = here().page()
      if query(heading).any(it => it.location().page() == i) {
        return
      }

      // Find the heading of the section we are currently in.
      let before = query(selector(heading).before(here()))
      if before != () {
        set text(0.95em)
        let header = smallcaps(before.last().body)
        let title = smallcaps(title)
        let author = text(style: "italic", author)
        grid(
          columns: (1fr, 10fr, 1fr),
          align: (left, center, right),
          if calc.even(i) [#i],
          // Swap `author` and `title` around, or possibly with `heading`
          // to change what is displayed on each side.
          if calc.even(i) { header } else { title },
          if calc.odd(i) [#i],
        )
      }
    },
  )

  // Configure chapter headings.
  show heading.where(level: 1): it => {
    // Always start on odd pages.
    detectable-pagebreak(to: "odd")

    // Create the heading numbering.
    let number = if it.numbering != none {
      counter(heading).display(it.numbering)
      h(7pt, weak: true)
    }

    v(5%)
    text(2em, weight: 700, block([#number #it.body]))
    v(1.25em)
  }
  show heading: set text(font-size * 1.2, weight: 400)

  body


  // TODO: Need to adjust non-CJK text size here as well
  if bibliography-file != none {
    // Remove first-line-indent from the bibliography
    set par(first-line-indent: 0em, hanging-indent: 1em)
    set text(size: bibliography-size)
    bibliography(bibliography-file, style: bibliography-style)
  }

}
