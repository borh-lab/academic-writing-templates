#import "./report-template.typ": report
#show: (doc) => report(
  author: "言文 花子",
  title: "2年かけた素晴らしい論文のTitle",
  subtitle: "詳細な論文のサブタイトル",
  venue: "令和7年度　博士前期課程2年次中間発表　ハンドアウト",
  date: "2025月8月X日",
  status: "博士前期課程X年次",
  supervisors: ([A准教授], [B教授]),
  bibliography-file: "./bibliography.bib",
  bibliography-style: "apa",
  language: "ja", // "ja" or "en"
  font-size: 10.5pt,
  bibliography-size: 10pt,
  doc
)

// Optional packages (delete if unused)
#import "@preview/unify:0.7.1": num,qty,numrange,qtyrange
#import "@preview/syntree:0.2.1": syntree
#import "@preview/ascii-ipa:2.0.0": *
#import "@preview/roremu:0.1.0": roremu
#import "@preview/zh-kit:0.1.0": zhnumber-lower, zhnumber-upper, pinyin, zhlorem
#import "@preview/cjk-unbreak:0.1.1": remove-cjk-break-space
#import "@preview/leipzig-glossing:0.5.0": gloss, example, abbreviations
#import abbreviations: pred, dem

#let numbered-example = example.with(numbering: true)

// Table of Contents

#align(center)[
  #figure(
    caption: figure.caption(position: top, [修士論文の構成（*ボルド*は今回言及する分）]),
    numbering: none,
  table(columns: 2, align: (left, left),
    [1. Introduction
    2. 先行研究],
    [*3. New section*
    4. Results],
  ))]

// Introduction section
= 初めに/Introduction

カナ漢字Romaji混じり文ABCDEF123456１２３４５６あいうえお，、。．.,！？!?・／
#branner("'XUX:i,Xae)S:tlI")

$ P_"ei" Delta = sum_(j=1, j!=k, i) E_i E_j B_"ij" cos(delta_"ij") delta_"ij" Delta + V_k E_i B_"ik" cos(delta_"iko") delta_"ik" Delta $

$ vec(a, b, c) dot vec(1, 2, 3)
    = a + 2b + 3c $

$ product_(n=1)^infinity (sqrt(sqrt(sqrt(sqrt(sqrt(sqrt(sqrt(sqrt(sqrt(sqrt(sqrt(sqrt(n))))))))))))) $

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $


#lorem(120)

#lorem(150)

#lorem(15)

#align(center)[
  #figure(
    caption: [What is a wug?],
    syntree(
      // nonterminal: (font: "Linux Biolinum"),
      terminal: (fill: blue),
      child-spacing: 3em, // default 1em
      layer-spacing: 2em, // default 2.3em
      "[S [NP This] [VP [V is] [^NP a wug]]]"
    )
  )
]

#lorem(50)

// Example from leipzig-glossing documentation:
// https://code.everydayimshuflin.com/greg/typst-lepizig-glossing/src/branch/master/documentation.pdf
#numbered-example(
  header: [Hausa; from _Toward a functional typology of adpositions_ (2022) by Zygmunt Frajzyngier (§~3.2)],
  label: "hausa",
  (
    source: ([àkwai], [mutvā̀nè ], [dà], [yawvā̀], [a], [kanyā̀]),
    morphemes: ([exist], [People], [#smallcaps[assc]], [many], [#pred], [Kano]),
    translation: [There are a lot of people in Kano.],
    label: "people",
  ),
  (
    source: ([àkwai], [makarr̃antv ], [a], [nan], [gàrin]),
    morphemes: ([exist], [school], [#pred], [#dem], [town]),
    translation: [There is a school in this town.],
    label: "school",
  ),
)
In @hausa there are two sub-examples: @people deals with people and @school with a school.

#lorem(80)


// Equation example
$ lim_(n arrow infinity) a_n = cal(L) $ <measure>

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


// Japanese text section
日本語で論文を書く。*日本語で論文を書きたい。*
#roremu(33)

#set par(first-line-indent: 0em)
// #let jtext = "０１２３４５６７８９"
#let jtext = "日本語で論文を書く。"
#let i = 0
#while i < 280 {
  i += 1
  jtext
}
#set par(first-line-indent: 1em)

// Chinese text section
我想用日语写一篇论文。*我想用日语写一篇论文。*
#zhlorem(200)

#pinyin("ni3 hao3, shi4 jie4 !") // 你好，世界！
#pinyin("Typst de zhong1 wen2 pai2 ban3 fei1 chang2 ku4 !") // Typst 的中文排版非常酷！

// Previous research section
= 先行研究 <previous_research>
#lorem(100)

// References example
@benjamin_reconstructing_2012, @hodoscek_readability_2012, @dubay_smart_2007, @pitler_revisiting_2008, @sato_automatic_2008, @Sato2008

// #cite(<shibasaki_japanese_2010>, form: "prose")によれば，…

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
#lorem(100)

#for x in range(250, step: 50) {
box(square(fill: luma(x)))
}

== データの詳細

#figure(
  caption: [表の説明],
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
#lorem(150)

```python
import spacy

nlp = spacy.load("ja_ginza_electra")

with open("corpus.txt") as f:
  text = f.read()

lemmas = [token.lemma_ for token in nlp.pipe(text)]

nlp("これは例文です。")
```

// Results section
= 結果
#lorem(300)

// Discussion section
= 考察
#lorem(250)

// Conclusion section
= 終わりに
#lorem(80)

