#import "./gb-handout-template.typ": report
#show: (doc) => report(
  author: "言文 花子",
  title: "2年かけた素晴らしい論文のTitle",
  subtitle: "詳細な論文のサブタイトル",
  venue: "令和6年度　博士前期課程2年次中間発表　ハンドアウト",
  date: "2024月8月X日",
  status: "博士前期課程X年次",
  supervisors: ([A准教授], [B教授]),
  doc
)

#import "@preview/metro:0.3.0": *
#metro-setup(group-separator: ",", group-minimum-digits: 4)
#import "@preview/syntree:0.2.0": syntree
#import "@preview/ascii-ipa:2.0.0": *

// Table of Contents

#align(center)[
  #figure(
    caption: figure.caption(position: top, [目次]),
    numbering: none,
  table(columns: 2, align: (left, left),
    [1. Introduction
    2. Previous research],
    [*3. New section*
    4. Results],
  ))]

// Introduction section
= 初めに
#lorem(120)

#lorem(400)

#align(center)[
  #figure(
    caption: [What is a wug?],
    syntree(
      nonterminal: (font: "Linux Biolinum"),
      terminal: (fill: blue),
      child-spacing: 3em, // default 1em
      layer-spacing: 2em, // default 2.3em
      "[S [NP This] [VP [V is] [^NP a wug]]]"
    )
  )
]

#lorem(50)

#lorem(100)

// Equation example
$ x = lim_{inf}alpha $ <measure>

// Reference to equation
As can be seen in @measure, there is...

Hello
Hello
Hello
Hello
Hello
Hello
Hello
Hello
Hello

#branner("'XUX:i,Xae)S:tlI")

// Japanese text section
日本語で論文を書く。*日本語で論文を書きたい。*
日本語で論文を書く。日本語で論文を書く。

#let jtext = "日本語で論文を書く。"
#let i = 0
#while i < 250 {
  i += 1
  jtext
}

// Chinese text section
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。


// Previous research section
= 先行研究 <previous_research>
#lorem(400)

// References example
@benjamin_reconstructing_2012, @hodoscek_readability_2012, @dubay_smart_2007, @pitler_revisiting_2008, @sato_automatic_2008, @Sato2008

#cite(<shibasaki_japanese_2010>, form: "prose")によれば，…

// Table example (add caption like below)
#table(
  columns: (auto, auto, 1fr),
  table.header[Date][°No][Description],
  [24/01/03], [813], [Filtered participant pool],
  [24/01/03], [477], [Transitioned to sec. regimen],
  [24/01/11], [051], [Cycled treatment substrate],
)

// Data section
= データ
@previous_research に書いたように…
#lorem(400)

#for x in range(250, step: 50) {
box(square(fill: luma(x)))
}

== データの詳細

#figure(
  caption: figure.caption(position: top, [表の説明]),
  table(
    columns: 6,
    stroke: (x: none),
    align: (center, right, center, right, right, right),
    table.header[nº][CID Ligando][Nombre Ligando][Afinidad][RMSD (l.b.)][RMSD (u.b.)],
    [1], [#num(234523)], [LoremIpsum], [#num(234)],   [0], [0],
    [2], [#num(2345)],   [LoremIpsum], [#num(2365)],  [0], [0],
    [3], [#num(3453)],   [LoremIpsum], [#num(45634)], [0], [0],
    [4], [#num(83452)],  [LoremIpsum], [#num(2456)],  [0], [0],
    [5], [#num(210)],    [LoremIpsum], [#num(245)],   [0], [0],
    [6], [#num(3417)],   [LoremIpsum], [#num(45634)], [0], [0],
    [7], [#num(4345)],   [LoremIpsum], [#num(3456)],  [0], [0],
    [8], [#num(4334)],   [LoremIpsum], [#num(3456)],  [0], [0]
  )
)

// Method section
= 方法
#lorem(350)

```python
import spacy

nlp = spacy.load("ja_ginza_electra")

with open("corpus.txt") as f:
  text = f.read()

lemmas = [token.lemma_ for token in nlp.pipe(text)]
```

// Results section
= 結果
#lorem(600)

// Discussion section
= 考察
#lorem(300)

// Conclusion section
= 終わりに
#lorem(150)

#bibliography("./bibliography.bib", style: "apa")
