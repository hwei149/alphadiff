TARGET=alphadiff
OS = $(shell uname)

ifeq ($(OS),Darwin)
    VIEW = open
else
	VIEW = evince
endif

default: pdf
	$(VIEW) $(TARGET).pdf

pdf: ${TARGET}.tex
	pdflatex --file-line-error --synctex=1 ${TARGET}.tex
	bibtex ${TARGET}
	pdflatex --file-line-error --synctex=1 ${TARGET}.tex
	pdflatex --file-line-error --synctex=1 ${TARGET}.tex

clean:
	rm -f ${TARGET}.aux ${TARGET}.synctex.gz ${TARGET}.pdf ${TARGET}.bbl ${TARGET}.log ${TARGET}.blg *~ ${TARGET}.synctex.gz ${TARGET}.out ${TARGET}.fdb_latexmk ${TARGET}.fls
