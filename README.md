### Description

Basic sorting and searching routines for vectors.

Supports integer & real vectors, and vectors extended from the abstract `item` class.

Includes the routines:

 * `function unique(vec)`
 * `function binary_search(val,vec)`
 * `subroutine sort_ascending(vec)`
 * `subroutine sort_descending(vec)`

### Compiling

The library and test program will build with any modern Fortran compiler. A [Fortran Package Manager](https://github.com/fortran-lang/fpm) manifest file (`fmp.toml`) is included, so that the library and tests cases can be compiled with FPM. For example:

```text
fpm build --profile release
fpm test --profile release
```

To generate the documentation using [ford](https://github.com/Fortran-FOSS-Programmers/ford), run:

```text
ford sorting.md
```

### See also

 * [stringsort](https://github.com/jacobwilliams/stringsort) -- Sorting routines for strings.
