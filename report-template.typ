#import "./lib.typ"

#let report(
  author: none,
  title: none,
  subtitle: none,
  venue: none,
  date: none,
  affiliation: "大阪大学 大学院人文学研究科 言語文化学専攻",
  status: none,
  supervisors: none,
  font-size: 10.5pt,
  bibliography-file: none,
  bibliography-style: "apa",
  bibliography-size: 10pt,
  language: "ja",
  body
) = {
  // Settings

  let title-block(body) = {
    let title-font-size = font-size * 1.4
    lib.non-cjk-style(text(title-font-size, weight: "bold", body), title-font-size)
    v(font-size*1.2, weak: true)
  }
  let subtitle-block(body) = {
    let subtitle-font-size = font-size * 1.2
    lib.non-cjk-style(text(subtitle-font-size, weight: "medium", sym.dash.em.two + body + sym.dash.em.two), subtitle-font-size)
    v(font-size*1.2, weak: true)
  }

  set document(title: title, author: author)

  let header-string = text(font-size, venue + h(1fr) + date)

  set page(
    paper: "iso-b5",
    margin: (x: 1.5cm, y: 1.5cm),
    header: align(center, header-string),
    numbering: "1"
  )

  set text(
    lang: language,
    size: font-size,
    font: lib.default_serif + lib.japanese_serif,
  )

  show raw: it => {
    set text(font: lib.default_mono + lib.japanese_mono, size: font-size)
    it
  }

  show raw.where(block: true): block.with(
    stroke: luma(200),
    inset: 8pt,
    radius: 4pt,
    width: 100%,
  )

  // show math.equation: set text(font: "IBM Plex Math")
  // show math.equation: set text(font: "New Computer Modern Math")



  // For Japanese:
  let fli = if language == "ja" {1em} else {0em}
  let par-spacing = if language == "ja" {0.68em} else {1.2em}
  set par(justify: true, first-line-indent: fli, spacing: par-spacing)

  set heading(numbering: "1. ")
  set math.equation(numbering: "(1)")

  // Fix for issue affecting Japanese: https://github.com/typst/typst/issues/311
  let fakepar = context {
    box()
    v(-0.5 * measure(block() + block()).height)
  }
  show heading: it => {
    let heading-font-size = font-size * 1.2
    set text(size: heading-font-size)
    lib.non-cjk-style(it, heading-font-size)
    fakepar
  }
  show figure: it => it + fakepar

  // Ensure captions are placed top for tables and bottom for figures
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  show figure.where(
    kind: image
  ): set figure.caption(position: bottom)


  // Document start

  set align(center)
  // set block(spacing: 1.5em)

  title-block(title)

  if subtitle != "" {
    subtitle-block(subtitle)
  }

  status + h(1em) + author

  v(font-size, weak: true)

  text()[指導教員：]
  supervisors.join(", ")
  v(font-size * 1.2, weak: true)

  set align(left)

  // Apply CJK font ratio scaling to the body after setting in title.
  // FIXME how to only set in par or make the size depend on the context?
  // show regex("[a-zA-Z0-9.,&*? ]+"): set text(
  // show regex("[^\p{Han}\p{Hiragana}\p{Katakana}]+"): set text(
  show regex(lib.non-cjk-range): set text(
    // font: default_serif,
    // number-type: "lining",
    size: font-size*1.2,
    // weight: 400,
  )
  //
  body

  // TODO: Need to adjust non-CJK text size here as well
  if bibliography-file != none {
    let bib-title = if language == "ja" [参考文献] else [References]
    // Remove first-line-indent from the bibliography
    set par(first-line-indent: 0em, hanging-indent: 1em)
    set text(size: bibliography-size)
    // bibliography-list(title: bib-title, ..bib-file(read(bibliography-file)))
    bibliography(bibliography-file, style: bibliography-style)
  }
}
