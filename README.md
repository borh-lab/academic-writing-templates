# 言語文化学専攻用Typstテンプレート集（論文／ハンドアウト、JA/EN）

大阪大学 大学院人文学研究科 言語文化学専攻向けに、[Typst](https://typst.app/)で論文（thesis）とハンドアウト（handout）を作成するためのテンプレートとサンプルを提供します。
発表スライド（presentation）用テンプレートは将来追加予定（現時点では未実装）です。

## 一覧（テンプレート／サンプルと対応言語）

| 種別 | ファイル | 言語対応 | 補足 |
|---|---|---|---|
| ハンドアウト テンプレート | report-template.typ | ja / en | B5版 |
| ハンドアウト サンプル | my-handout.typ / [my-handout.pdf](./my-handout.pdf) | ja / en | 上記テンプレートの使い方例（参考文献付き） |
| 論文 テンプレート | thesis-template.typ | ja / en | A4版、章節番号・式/図番号、奇偶パリティ対応 |
| 論文 サンプル | my-thesis.typ / [my-thesis.pdf](./my-thesis.pdf) | ja / en | 上記テンプレートの使い方例（付録・参考文献） |
| 共通ライブラリ | lib.typ | － | フォントスタック、CJK/非CJKのサイズ調整、見出しサイズ定義 |
| 参考文献データ | bibliography.bib | － | BibTeX形式のサンプル文献 |
| プレゼン テンプレート | －（未実装） | － | 将来追加予定 |

- `latex/`以下は古いLaTeX版の資料やスクリプト（Typst利用には不要）

## 前提条件（Prerequisites）

最低限:

- Typst（最新版を推奨）: <https://typst.app> または各種パッケージマネージャから導入
- フォント（各カテゴリで1系統あれば十分。混在による警告が出ても基本的にレンダリングは問題ありません）
  - 日本語 Sans: Source Han Sans / ヒラギノ角ゴ ProN（macOS）/ 游ゴシック（Windows）
  - 日本語 Serif: Source Han Serif / ヒラギノ明朝 ProN（macOS）/ 游明朝（Windows）
  - 日本語 Mono: Source Han Mono など（等幅）
  - ラテン Serif: Libertinus Serif（Typst既定）
  - 数学: DejaVu Math TeX Gyre
  - 任意（発表向け欧文Sans）: IBM Plex Sans

再現可能な開発環境（任意）:

- Nix + devenv（devenv.nix / devenv.yaml / devenv.lock）
  - TypstとCJKフォント（Source Han系）を自動導入
  - ウォッチャ（watch.sh）やビルドスクリプトの実行を簡略化
  - 環境変数TYPST_FONT_PATHSを設定済（Source Han Sans/Serif）

## 取得方法（ダウンロード／クローン）

推奨（Git を使う）:

```bash
# Git がある場合はこちら（更新の取得が簡単）
git clone https://github.com/borh-lab/academic-writing-templates.git
cd academic-writing-templates
```

代替（ZIP を使う）:

- ブラウザでGitHubのリポジトリページを開く
- Codeボタン → Download ZIP（もしくは以下の直リンク）
  <https://github.com/borh-lab/academic-writing-templates/archive/refs/heads/main.zip>
- 展開してフォルダに入り、以降の手順（ビルド等）を実行

## ビルド手順

Typst単体:

```bash
typst compile my-handout.typ
# あるいは
typst compile my-thesis.typ
```

`watch`コマンドではファイル更新するたびにコンパイルを実施することもできます:

```bash
typst watch my-handout.typ
# あるいは
typst watch my-thesis.typ
```

Nix + devenvを使う場合:

```bash
devenv shell
# 上記と同じコマンド
```

出力:

- my-handout.pdf
- my-thesis.pdf

## 使い方（概要）

言語設定:

- `language: "ja"`または`"en"`をエントリファイル（my-handout.typ / my-thesis.typ）上部の呼び出し引数で指定。

- エントリファイルの使い分け:
  - そのまま使う場合: `my-handout.typ` / `my-thesis.typ`を直接編集してビルドします。
  - 自分用に複製する場合: それぞれをコピーして新規ファイル（例:
    `handout-<yourname>.typ`, `thesis-<yourname>.typ`）を作成し、その中の
    `report(...)` / `thesis(...)` 呼び出しの引数（`author`, `title`, `subtitle`,
    `venue`, `date`, `status`, `supervisors`, `affiliation`, `language`,
    `bibliography-*`, `font-size` など）を自分用の既定値に変更してください。
  - テンプレート本体（`report-template.typ` / `thesis-template.typ`）は原則編集不要です。
    自分の原稿は「エントリファイル」を増やして管理してください。

推奨ワークフロー: プロジェクトごとに `my-handout.typ` / `my-thesis.typ` をコピーして新規ファイルを作成し、
`report(...)` / `thesis(...)` の引数を自分の既定値を一度だけ設定してから本文を書き始めるのが安全です。
テンプレート本体（`report-template.typ` / `thesis-template.typ`）は更新しやすいよう編集しないのがおすすめです。

ハンドアウト（report）:

- エントリ: `my-handout.typ`
  - 新規原稿を始める際は`my-handout.typ`をコピーしてファイル名を変え、
    `report(...)`の引数に自分の既定値を設定してから執筆を開始するのが安全です。
- `report-template.typ` をラップして以下を指定:
  - `author`, `title`, `subtitle`, `venue`, `date`, `status`, `supervisors`, `affiliation`（既定は専攻名）
  - 参考文献: `bibliography-file`, `bibliography-style`（既定 "apa"）, `bibliography-size`
- 備考（オプションのプレビューパッケージ）: `my-handout.typ` /
  `my-thesis.typ` の冒頭にある `@preview/...` の import は例示用です。
  オフラインや不要な場合は該当行を削除して構いません。

論文（thesis）:

- エントリ: `my-thesis.typ`
  - 新規原稿を始める際は`my-thesis.typ`をコピーしてファイル名を変え、
    `thesis(...)`の引数に自分の既定値を設定してから執筆を開始するのが安全です。
- `thesis-template.typ` をラップして以下を提供:
  - 前付: `dedication`, `publishing-info`（任意）、本文後に `appendix`（任意）
  - 参考文献は本文末に `bibliography(...)` で出力（サイズ・スタイル可変）
- 備考（オプションのプレビューパッケージ）: `my-handout.typ` /
  `my-thesis.typ` の冒頭にある `@preview/...` の import は例示用です。
  オフラインや不要な場合は該当行を削除して構いません。

参考文献:

- `bibliography.bib`を用意し、各エントリファイルで`bibliography-file: "./bibliography.bib"`を指定。
- 既定スタイルはAPA。必要に応じて`bibliography-style`を変更。
- 参考文献データ形式は Bib(La)TeX（.bib）に加えて
  [Hayagriva](https://github.com/typst/hayagriva)
  YAML（.yaml/.yml）にも対応しています。例:
  `bibliography-file: "./references.yaml"` のように指定可能です.

## 各ファイルの役割

- lib.typ
  - 日本語/欧文のフォントスタック（Serif/Sans/Mono、Math）
  - 非CJK（英数字・記号など）を検出する正規表現とサイズ微調整ヘルパ
  - 見出しサイズ（title1〜5 など）の共通定義
- report-template.typ
  - B5 向けハンドアウトの版面・段落設定、ヘッダ（venue / date）
  - 図表のキャプション位置、見出し表示の和文最適化
  - 参考文献の字下げ・サイズ制御
- thesis-template.typ
  - A4 書籍レイアウト、章ごとの番号付け（見出し／式／図）
  - 奇偶パリティを保つページブレイク、目次、フッター配置
  - 前付・付録の出力ロジック
- my-handout.typ / my-thesis.typ
  - 上記テンプレートの具体的な使用例（プレビューパッケージの活用例を含む）
- bibliography.bib
  - サンプルの BibTeX エントリ（日本語・英語の混在例）

## 最小サンプル（エントリファイルの呼び出し例）

ハンドアウト（抜粋）:

```typst
#import "./report-template.typ": report
#show: (doc) => report(
  author: "言文 花子",
  title: "発表タイトル",
  date: "2025-08-XX",
  language: "ja",
  bibliography-file: "./bibliography.bib",
  bibliography-style: "apa",
  doc
)
```

論文（抜粋）:

```typst
#import "./thesis-template.typ": thesis
#show: (doc) => thesis(
  author: "言文 花子",
  title: "論文タイトル",
  date: "2025-08-XX",
  language: "ja",
  bibliography-file: "./bibliography.bib",
  bibliography-style: "apa",
  doc
)
```

詳しくはmy-handout.typ / my-thesis.typを参照してください。

## 注意・既知の制限

- 論文テンプレートのヘッダ（章タイトル自動表示など）は今後調整予定。
- ラテン文字と和文の相対サイズが気になる場合は、lib.typの`non-cjk-range` / `non-cjk-style`の倍率を調整してください。
