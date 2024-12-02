#let title-block(body) = {
  text(14pt, weight: "bold", body)
  v(12pt, weak: true)
}
#let subtitle-block(body) = {
  text(12pt, weight: "medium", "― " + body + " ―")
  v(12pt, weak: true)
}

#let report(
  author: none,
  title: none,
  subtitle: none,
  venue: none,
  date: none,
  affiliation: "大阪大学 大学院人文学研究科 言語文化学専攻",
  status: none,
  supervisors: none,
  bibliography-file: none,
  bibliography-style: "apa",
  bibliography-size: 9pt,
  body
) = {
  set document(
    title: title,
    author: author,
  )
  let header-string = text(10pt, venue + h(1fr) + date)
  set page(
    paper: "iso-b5",
    margin: (x: 2cm, y: 2cm),
    header: align(center, header-string),
    numbering: "1"
  )
  set text(
    lang: "ja",
    size: 10pt,
    font: ("Libertinus Serif", "Source Han Serif")
  )
  set par(justify: true, first-line-indent: 1em, spacing: 0.68em)
  set heading(numbering: "1. ")
  set math.equation(numbering: "(1)")
  // Fix for issue: https://github.com/typst/typst/issues/311
  let fakepar = context {
    box()
    v(-0.5 * measure(block() + block()).height)
  }
  show heading: it => it + fakepar
  show figure: it => it + fakepar


  set align(center)
  // set block(spacing: 1.5em)

  title-block(title)

  subtitle-block(subtitle)

  status + h(1em) + author

  v(10pt, weak: true)

  text()[指導教員：]
  supervisors.join(", ")
  linebreak()

  set align(left)
  body

  // Remove first-line-indent from the bibliography
  set par(first-line-indent: 0em, hanging-indent: 1em)
  set text(size: bibliography-size)
  bibliography(bibliography-file, style: bibliography-style)
}
