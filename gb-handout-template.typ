#let non-cjk-range = "[^\p{scx:Han}\p{scx:Hira}\p{scx:Kana}。．，、！？０１２３４５６７８９（）]+"

#let report(
  author: none,
  title: none,
  subtitle: none,
  venue: none,
  date: none,
  affiliation: "大阪大学 大学院人文学研究科 言語文化学専攻",
  status: none,
  supervisors: none,
  font-size: 10pt,
  bibliography-file: none,
  bibliography-style: "apa",
  bibliography-size: 10pt,
  language: "ja",
  body
) = {

  let title-block(body) = {
    text(font-size*1.4, weight: "bold", body)
    v(font-size*1.2, weak: true)
  }
  let subtitle-block(body) = {
    text(font-size*1.2, weight: "medium", "― " + body + " ―")
    v(font-size*1.2, weak: true)
  }

  set document(
    title: title,
    author: author,
  )
  let header-string = text(font-size, venue + h(1fr) + date)
  set page(
    paper: "iso-b5",
    margin: (x: 1.5cm, y: 1.5cm),
    header: align(center, header-string),
    numbering: "1"
  )

  let japanese_serif = (
    "Source Han Serif", // Preffered font for Japanese
    "Hiragino Mincho ProN", // Native macOS
    "Yu Mincho", // Native Windows
  )
  let default_serif = (
    // "EB Garamond",
    "Libertinus Serif", // Default Typst font
  )
  let japanese_mono = (
    "Source Han Mono", // Preffered font for Japanese
    "Hiragino Kaku Gothic ProN", // Native macOS
    "Yu Gothic", // Native Windows
  )
  let default_mono = (
    "Sarasa Mono J",
  )

  set text(
    lang: language,
    size: font-size,
    font: default_serif + japanese_serif,
  )
  show raw: set text(font: default_mono + japanese_mono)

  show math.equation: set text(font: "IBM Plex Math")

  // FIXME how to only set in par or make the size depend on the context?
  // show regex("[a-zA-Z0-9.,&*? ]+"): set text(
  // show regex("[^\p{Han}\p{Hiragana}\p{Katakana}]+"): set text(
  show regex(non-cjk-range): set text(
    font: default_serif,
    number-type: "lining",
    size: font-size*1.2,
    weight: 400,
  )

  // For Japanese:
  let fli = if language == "ja" {1em} else {0em}
  let par-spacing = if language == "ja" {0.68em} else {1.2em}
  set par(justify: true, first-line-indent: fli, spacing: par-spacing)

  set heading(numbering: "1. ")
  set math.equation(numbering: "(1)")
  // Fix for issue: https://github.com/typst/typst/issues/311
  let fakepar = context {
    box()
    v(-0.5 * measure(block() + block()).height)
  }
  show heading: it => it + fakepar
  show figure: it => it + fakepar

  // Ensure captions are placed top for tables and bottom for figures
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  show figure.where(
    kind: image
  ): set figure.caption(position: bottom)

  set align(center)
  // set block(spacing: 1.5em)

  title-block(title)

  subtitle-block(subtitle)

  status + h(1em) + author

  v(font-size, weak: true)

  text()[指導教員：]
  supervisors.join(", ")
  v(font-size * 1.2, weak: true)

  set align(left)
  body

  // TODO: Need to adjust non-CJK text size here as well
  if bibliography-file != none {
    // Remove first-line-indent from the bibliography
    set par(first-line-indent: 0em, hanging-indent: 1em)
    set text(size: bibliography-size)
    bibliography(bibliography-file, style: bibliography-style)
  }
}
