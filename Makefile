TARGET_PDF = main.pdf

TARGET_TEX = $(TARGET_PDF:.pdf=.tex)

PROJECT_PATH = $(realpath .)/

PDF_FLAG = -shell-escape -output-directory=$(OUTDATA)

OUTDATA = $(PROJECT_PATH)outdir

all:$(TARGET_PDF)


$(TARGET_PDF):
	mkdir ./outdir
	pdflatex $(PDF_FLAG) $(TARGET_TEX)
	cd $(OUTDATA) && set BIBINPUTS="$(PROJECT_PATH);%BIBINPUTS%" && set BSTINPUTS="$(PROJECT_PATH);%BSTINPUTS%" && bibtex $(TARGET_TEX:.tex=) && cd ..
	pdflatex $(PDF_FLAG) $(TARGET_TEX)
	pdflatex $(PDF_FLAG) $(TARGET_TEX)
	mv $(OUTDATA)/main.pdf $(PROJECT_PATH)

clean:
	rm -f main.pdf
	rm -rf $(OUTDATA)