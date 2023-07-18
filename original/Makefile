.PHONY : all clean commands database settings

CONFIG=_bookdown.yml _output.yml
FIXED=CODE_OF_CONDUCT.md LICENSE.md
TEMP=$(patsubst %.Rmd,%.md,$(wildcard *.Rmd))
SRC=${CONFIG} ${FIXED} $(wildcard *.Rmd)

DATABASE=data/example.db

all : commands

#-------------------------------------------------------------------------------

## commands     : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g'

## book         : build Bookdown PDF version (and main.tex as a side effect).
book : ${SRC} Makefile
	@rm -f main.md
	-Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', output_dir='.'); warnings()"

#-------------------------------------------------------------------------------

## clean        : clean up generated files.
clean :
	@rm -f *.aux *.bbl *.blg *.idx *.ilg *.ind *.log *.maf *.mtc *.mtc0 *.out *.rds *.tbc *.toc
	@rm -rf ${TEMP} *.utf8.md *.knit.md _book main.tex main.pdf
	@find . -name '*~' -exec rm {} \;

## reset        : reset auto-generated figures.
reset :
	git checkout -- debt_files practice_files tidyverse_files

## database     : make example database for advanced topics chapter.
database :
	@rm -f ${DATABASE}
	@sqlite3 ${DATABASE} < data/create_db.sql

## settings     : echo all variable values.
settings :
	@echo STEM ${STEM}
	@echo CONFIG ${CONFIG}
	@echo FIXED ${FIXED}
	@echo SRC ${SRC}
	@echo TEMP ${TEMP}
	@echo BOOKDOWN ${BOOKDOWN}
	@echo TEX ${TEX}
