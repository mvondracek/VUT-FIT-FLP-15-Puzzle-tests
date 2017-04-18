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
.
├─ VUT-FIT-FLP-15-Puzzle-tests
|   ├─ tests/
|   ├─ Makefile
|   └─ README.md
└─ flp17-log
~~~

~~~bash
$ ls
tests Makefile README.md other
$ make
...
[ OK ] All tests passed.
~~~


~~~bash
$ make help
15 Puzzle (Patnáctka) tests
xvondr20, Martin Vondráček
2017

FLP - Functional and Logic Programming
FIT - Faculty of Information Technology
BUT - Brno University of Technology

`make`
`make test`     Run all tests available in directory `tests/`.
`make help`     Print this help screen.
`make clean`    Remove test results.
~~~