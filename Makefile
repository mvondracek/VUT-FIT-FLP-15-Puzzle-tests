## 15 Puzzle (Patnáctka) tests
## xvondr20, Martin Vondráček
## 2017
##
## FLP - Functional and Logic Programming
## FIT - Faculty of Information Technology
## BUT - Brno University of Technology
##

# Can be overridden, see https://www.gnu.org/software/make/manual/html_node/Overriding.html
PROGRAM=../flp17-log

## `make`
## `make test`     Run all tests available in directory `tests/`.
test: $(PROGRAM) test_warn \
$(basename $(wildcard ./tests/*.in)) $(basename $(wildcard ./tests/*/*.in))
	@echo -e "[\e[32m OK \e[0m] All tests passed."

## `make help`     Print this help screen.
help : Makefile
	@sed -n 's/^## \?//p' $<

.PHONY: test help FORCE test_warn clean
FORCE:

## `make clean`    Remove test results.
clean:
	rm -r -f ./results/

test_warn:
	@echo -e "[\e[33mWARN\e[0m] Tests use \`diff --strip-trailing-cr\`."

tests/%: FORCE
	@mkdir -p ./results/$(dir $(@))
	@./$(PROGRAM) < $(@).in 1> ./results/$(@).out 2> ./results/$(@).err; \
	echo -n $$? > ./results/$(@).esc
# stdout
	@diff -q --strip-trailing-cr $(@).out ./results/$(@).out >/dev/null || \
	(echo -e "[\e[31mFAIL\e[0m] $(@): Stdout doesn't match." >&2 && exit 1) && \
	(echo -e "[\e[32m OK \e[0m] $(@): Stdout matches.")
# stderr
	@diff -q --strip-trailing-cr $(@).err ./results/$(@).err >/dev/null || \
	(echo -e "[\e[31mFAIL\e[0m] $(@): Stderr doesn't match." >&2 && exit 1) && \
	(echo -e "[\e[32m OK \e[0m] $(@): Stderr matches.")
# exit status code
	@diff -q --strip-trailing-cr $(@).esc ./results/$(@).esc >/dev/null || \
	(echo -e "[\e[31mFAIL\e[0m] $@: Return codes don't match." >&2 && exit 1) && \
	(echo -e "[\e[32m OK \e[0m] $@: Return codes match.")
