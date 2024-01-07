### Status

[![GitHub release](https://img.shields.io/github/release/jacobwilliams/fortran-search-and-sort.svg?style=plastic)](https://github.com/jacobwilliams/fortran-search-and-sort/releases/latest)
[![CI Status](https://github.com/jacobwilliams/fortran-search-and-sort/actions/workflows/CI.yml/badge.svg)](https://github.com/jacobwilliams/fortran-search-and-sort/actions)
[![codecov](https://codecov.io/gh/jacobwilliams/fortran-search-and-sort/branch/master/graph/badge.svg?token=43HK33CSMY)](https://codecov.io/gh/jacobwilliams/fortran-search-and-sort)

### Description

Basic sorting and searching routines for vectors.

Supports integer & real vectors, and vectors extended from the abstract `item` class.

Includes the routines:

 * `function unique(vec)`
 * `function binary_search(val,vec)`
 * `subroutine sort_ascending(vec)`
 * `subroutine sort_descending(vec)`

### Compiling

The library and test program will build with any modern Fortran compiler. A [Fortran Package Manager](https://github.com/fortran-lang/fpm) manifest file (`fpm.toml`) is included, so that the library and tests cases can be compiled with FPM. For example:

```text
fpm build --profile release
fpm test --profile release
```

To use `fortran-search-and-sort` within your FPM project, add the following to your `fpm.toml` file:
```toml
[dependencies]
fortran-search-and-sort = { git="https://github.com/jacobwilliams/fortran-search-and-sort.git" }
```

To generate the documentation using [ford](https://github.com/Fortran-FOSS-Programmers/ford), run:

```text
ford ford.md
```

### Documentation

The latest API documentation can be found [here](https://jacobwilliams.github.io/fortran-search-and-sort/). This was generated from the source code using [FORD](https://github.com/Fortran-FOSS-Programmers/ford).


### See also

 * [stringsort](https://github.com/jacobwilliams/stringsort) -- Sorting routines for strings.
