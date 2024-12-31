---
title: 論文タイトル
subtitle: 論文サブタイトル
author: 言文 花子
abstract: |
  論文の要旨…論文の要旨…論文の要旨…論文の要旨…
  論文の要旨…論文の要旨…論文の要旨…論文の要旨…
  論文の要旨…論文の要旨…論文の要旨…論文の要旨…
  論文の要旨…論文の要旨…論文の要旨…論文の要旨…
  論文の要旨…論文の要旨…論文の要旨…論文の要旨…
  論文の要旨…論文の要旨…論文の要旨…論文の要旨…
  論文の要旨…論文の要旨…論文の要旨…論文の要旨…
reference-section-title: 参考文献
link-citations: true
link-bibliography: true
# lang: ja-JP # 日本語と英語の参考文献が混ざると別途処理が必要　
header-includes:
  # Set fonts
  - \usepackage{luatexja}
  - \usepackage[haranoaji]{luatexja-preset}
  - \usepackage{pagella-otf} 
  # TODO References
  # \printbibheading
  # \printbibliography[heading=subbibliography,keyword=english,title={References}]
  # \printbibliography[heading=subbibliography,notkeyword=english,title={参考文献}]
  - \usepackage{csquotes}
  # Fancy tables
  - \usepackage{booktabs,siunitx,array,threeparttable}
  # Graphs/diagrams
  - \usepackage{tikz}
  # Dummy text (remove)
  - \usepackage{lipsum}
documentclass: ltjsarticle
classoption:
  - 12pt
  - titlepage
  # - mainmatter
  - draft
top-level-division: chapter
lof: true
lot: true
toc: true
pdf-engine: lualatex
bilatex: yes
# https://ftp.kddilabs.jp/CTAN/macros/latex/contrib/biblatex-contrib/biblatex-apa/biblatex-apa-test.pdf
# biblio-style: apa
biblio-style: gb7714-2015ay
biblatexoptions: gbnamefmt=familyahead,gbtype=false,gbmedium=false,gbpunctin=false,maxbibnames=10
bibliography:
  - bibliography.bib
---
<!-- markdownlint-disable-file MD025 MD013 -->

\newpage

# 初めに

\lipsum[1-2]

$$x = \lim_{inf}\alpha$${#eq:some_measure}

As can be seen in @eq:some_measure, there is...

Hello
Hello
Hello
Hello
Hello
Hello
Hello
Hello
Hello

日本語で論文を書く。**日本語で論文を書きたい。**
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。
日本語で論文を書く。日本語で論文を書く。

我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。
我想用日语写一篇论文。我想用日语写一篇论文。

<!-- https://www.overleaf.com/learn/latex/TikZ_package -->
\begin{figure}
\centering
\begin{tikzpicture}
\filldraw[color=red!60, fill=red!5, very thick](-1,0) circle (1.5);
\fill[blue!50] (2.5,0) ellipse (1.5 and 0.5);
\draw[ultra thick, ->] (6.5,0) arc (0:220:1);
\end{tikzpicture}
\caption{図の例}
\end{figure}

# 先行研究 {#sec:previous_research}

\lipsum[1-4]

[@benjamin_reconstructing_2012; @hodoscek_readability_2012; @dubay_smart_2007; @pitler_revisiting_2008; @sato_automatic_2008; @Sato2008]

@shibasaki_japanese_2010 によれば，…

| **column1** | **column2** |
|---------|---------|
| 1       | 2       |
| 3       | 4       |

: Demonstration of simple table syntax. {#tbl:my_table}

As we can see in @tbl:my_table, this is ...

# データ

@sec:previous_research に書いたように…

\lipsum[1-4]

## データの詳細

<!-- https://tex.stackexchange.com/questions/604496/how-to-generate-beautiful-tables-in-latex -->
\begin{table}[!h]
\centering
\begin{threeparttable}
\caption{Valores de afinidad obtenidos para los ocho fármacos en \textit{Autodock Vina}}
\begin{tabular}{@{} l S[table-format=6.0] l S[table-format=5.0] cc @{}}
\toprule
{nº} & {CID Ligando} & {Nombre Ligando} & {Afinidad} & \multicolumn{2}{c@{}}{RMSD} \\
\cmidrule(l){5-6}
& & & {(Kcal/mol)\textsuperscript{2}} & {l.b.} & {u.b.}\\
\midrule
  1 & 234523 & LoremIpsum & 234   & 0 & 0 \\
  2 & 2345   & LoremIpsum & 2365  & 0 & 0 \\
  3 & 3453   & LoremIpsum & 45634 & 0 & 0 \\
  4 & 83452  & LoremIpsum & 2456  & 0 & 0 \\
\addlinespace
  5 & 210    & LoremIpsum & 245   & 0 & 0 \\
  6 & 3417   & LoremIpsum & 45634 & 0 & 0 \\
  7 & 4345   & LoremIpsum & 3456  & 0 & 0 \\
  8 & 4334   & LoremIpsum & 3456  & 0 & 0 \\
\bottomrule
\end{tabular}
\label{tab:version2}
\end{threeparttable}
\end{table}

# 方法

\lipsum[1-4]

```python
import spacy

nlp = spacy.load("ja_ginza_electra")

with open("corpus.txt") as f:
    text = f.read()

lemmas = [token.lemma_ for token in nlp.pipe(text)]
```

# 結果

\lipsum[1-4]

# 考察

\lipsum[1-4]

# 終わりに

\lipsum[5-5]
