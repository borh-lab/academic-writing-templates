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
