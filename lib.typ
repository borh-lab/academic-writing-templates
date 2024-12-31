#let non-cjk-range = {
  let basic-cjk-range = "\p{scx:Han}\p{scx:Hira}\p{scx:Kana}"
  let punctuation = "。．、，！？（）／"
  let numbers = "０-９"
  "[^" + basic-cjk-range + punctuation + numbers + "]+"
}

#let non-cjk-style(body, el-font-size, size-multiplier: 1.2) = {
  show regex(non-cjk-range): set text(
    size: el-font-size * size-multiplier,
  )
  body
}

#let japanese_serif = (
  "Source Han Serif", // Preffered font for Japanese
  "Hiragino Mincho ProN", // Native macOS
  "Yu Mincho", // Native Windows
)

#let default_serif = (
  // "EB Garamond",
  "Libertinus Serif", // Default Typst font
)

#let japanese_mono = (
  "Source Han Mono", // Preffered font for Japanese
  "Hiragino Kaku Gothic ProN", // Native macOS
  "Yu Gothic", // Native Windows
)

#let default_mono = (
  "Sarasa Mono J",
)

#let normal-text = 1em
#let large-text = 3em
#let huge-text = 16em
#let title-main-1 = 2.5em
#let title-main-2 = 2.2em
#let title-main-3 = 1.8em
#let title1 = 2.2em
#let title2 = 1.5em
#let title3 = 1.3em
#let title4 = 1.2em
#let title5 = 1em
