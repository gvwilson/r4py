.PHONY : all clean commands

LATEX=xelatex
MAKEINDEX=makeindex
BIBTEX=bibtex

all : commands

#-------------------------------------------------------------------------------

## commands     : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g'

## pdf          : make PDF.
pdf :
	${LATEX} book
	${BIBTEX} book
	${MAKEINDEX} book
	${LATEX} book
	${LATEX} book

## once         : run LaTeX once for a quick preview of changes.
once :
	${LATEX} book

#-------------------------------------------------------------------------------

## clean        : clean up generated files.
clean :
	@rm -f *~ *.aux *.bbl *.blg *.idx *.ilg *.ind *.log *.maf *.mst *.mtc *.mtc0 *.out *.rds *.tbc *.toc
