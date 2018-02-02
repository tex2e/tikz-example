
TEX_FILE := $(wildcard *.tex)
PNG_FILE := $(patsubst %.tex, %.png, $(TEX_FILE))

all: $(PNG_FILE)

%.png: %.tex
	pdflatex -halt-on-error -output-directory=/tmp $<
	convert -density 300 /tmp/$(basename $<).pdf -quality 90 $@

clean:
	$(RM) *.png
