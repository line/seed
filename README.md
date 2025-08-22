# LINE Seed

[![][Fontspector]](https://line.github.io/seed/fontspector/fontspector-report.html)
[![][OpenType]](https://line.github.io/seed/fontspector/fontspector-report.html)
[![][Universal]](https://line.github.io/seed/fontspector/fontspector-report.html)
[![][Google Fonts]](https://line.github.io/seed/fontspector/fontspector-report.html)
[![][Glyphset]](https://line.github.io/seed/fontspector/fontspector-report.html)

[Fontspector]: https://img.shields.io/endpoint?url=https%3A%2F%2Fline.github.io%2Fseed%2Fbadges%2FFontspectorQA.json
[OpenType]: https://img.shields.io/endpoint?url=https%3A%2F%2Fline.github.io%2Fseed%2Fbadges%2FOpentypeSpecificationChecks.json
[Universal]: https://img.shields.io/endpoint?url=https%3A%2F%2Fline.github.io%2Fseed%2Fbadges%2FUniversalProfileChecks.json
[Google Fonts]: https://img.shields.io/endpoint?url=https%3A%2F%2Fline.github.io%2Fseed%2Fbadges%2FFontFileChecks.json
[Glyphset]: https://img.shields.io/endpoint?url=https%3A%2F%2Fline.github.io%2Fseed%2Fbadges%2FGlyphsetChecks.json

Seed, a word containing the meaning of growth, is LINE’s first custom typeface. The geometry-based LINE Seed is unique yet universal.

[![][LINE Seed]](https://seed.line.me/)

[LINE Seed]: documentation/banner.svg

LINE Seed is LINE’s new font that was created based on the brand’s identity of convenience and friendliness. 
The word "Seed" represents the idea of growing together with our users, expressing the hope that the seeds planted firmly in LINE’s services will sprout and bear fruit.
The Japanese typeface, LINE Seed JP, has the same DNA as the LINE Seed fonts in other languages. We adjusted the typeface’s weight and center of gravity based on its balance with the English font so that both give the same impression when used together in one sentence.
As a result, no extra adjustment is required as the Japanese and English typefaces are already well-balanced with each other.

Learn more about the LINE Seed typeface philosophy from https://seed.line.me/

## Building the fonts from source

Fonts are built automatically by GitHub Actions - take a look in the "Actions" tab for the latest build.

If you want to build fonts manually on your own computer:

* `make build` will produce font files.
* `make test` will run [FontBakery](https://github.com/googlefonts/fontbakery)'s quality assurance tests.
* `make proof` will generate HTML proof files.

The proof files and QA tests are also available automatically via GitHub Actions - look at https://line.github.io/seed.

## License

This Font Software is licensed under the SIL Open Font License, Version 1.1.
This license is available with a FAQ at
https://scripts.sil.org/OFL

## Repository Layout

This font repository structure is inspired by [Unified Font Repository v0.3](https://github.com/unified-font-repository/Unified-Font-Repository), modified for the Google Fonts workflow.
