<!--
15 Puzzle (Patnáctka) tests
xvondr20, Martin Vondráček
2017
FLP - Functional and Logic Programming
FIT - Faculty of Information Technology
BUT - Brno University of Technology
-->

# VUT FIT FLP 15 Puzzle tests

Tests for the 15 puzzle solver. Program should read puzzle from stdin and
write steps of found solution to stdout. This repository can be used as a git
submodule in your project.

# Usage
**Tests use `diff --strip-trailing-cr`.** Tested program must be placed in a
directory *one level above* the `Makefile` or you can override `Makefile`'s
variable `PROGRAM`. 
~~~
├─ VUT-FIT-FLP-15-Puzzle-tests
|    ├─ tests/
|    ├─ Makefile
|    └─ README.md
└─ flp17-log
~~~

~~~
$ ls
tests Makefile README.md other
$ make --keep-going
...
[ OK ] All tests passed.
$ make clean
~~~

~~~
$ make help
~~~

# Expected behavior
| Event              | stdout     | stderr                         | esc |
| ------------------ | ---------- | ------------------------------ | --: |
| success            | *solution* | *empty*                        |   0 |
| invalid input      | *empty*    | `Error: Invalid input.\n`      |  65 |
| solution not found | *empty*    | `Error: Solution not found.\n` |  79 |
