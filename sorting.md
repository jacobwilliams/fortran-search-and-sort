project: sorting
project_dir: ./src
output_dir: ./doc
project_github: https://github.com/jacobwilliams/sorting
summary: Sorting and Searching with Modern Fortran
author: Jacob Williams
github: https://github.com/jacobwilliams
predocmark_alt: >
predocmark: <
docmark_alt:
docmark: !
display: public
source: true
graph: false
exclude_dir: src/tests

### Description

Basic sorting and searching routines for vectors.

Supports integer & real vectors, and vectors extended from the abstract `item` class.

Includes the routines:

 * `function unique(vec)`
 * `function binary_search(val,vec)`
 * `subroutine sort_ascending(vec)`
 * `subroutine sort_descending(vec)`

### See also

 * [stringsort](https://github.com/jacobwilliams/stringsort) -- Sorting routines for strings.
