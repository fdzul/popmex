# Changelog

## popmex 0.2.0

### Bug fixes

- [`extract_pop()`](https://fdzul.github.io/popmex/reference/extract_pop.md)
  failed when popmex was installed alone: it uses rgeomex and sf, which
  were not declared. Both are now in `Imports` (rgeomex from
  `fdzul/rgeomex`).
- [`extract_pop()`](https://fdzul.github.io/popmex/reference/extract_pop.md)
  returned `NULL` silently for `year = 2020` or any other year. It now
  stops with a clear message; the available years are 2021, 2022
  and 2023. It also stops when the locality is not found.
- In `pop2000`, `pop2010` and `pop2020` the population columns were
  stored as text. They are now numeric, so
  [`sum()`](https://rdrr.io/r/base/sum.html) and rates work directly.
  Totals were checked against INEGI (97,483,412; 112,336,538 and
  126,014,024).
- The vignette drew the 2023 map twice instead of 2023 and 2022.

### Other changes

- Data recompressed with xz: the package is 27 % smaller (106 MB to 78
  MB).
- Documentation of every dataset rewritten to match the real columns
  (e.g. `conapop` uses `cvegeo` and `sexo`; `hdx_pop2021` has no `h3`).
- Only
  [`extract_pop()`](https://fdzul.github.io/popmex/reference/extract_pop.md)
  is exported.
- First unit tests (testthat), including census totals.
- Fixed ORCID identifiers of the authors.
