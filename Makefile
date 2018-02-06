
TEX_FILE := $(shell find . -type f -name '*.tex')
PNG_FILE := $(patsubst %.tex, %.png, $(TEX_FILE))
TMP := tmp

all: $(PNG_FILE)

%.png: %.tex
	mkdir -p $(TMP)/$$$$ && \
	platex -halt-on-error -output-directory=$(TMP)/$$$$ $< && \
	dvipdfmx -d5 -o $(TMP)/$$$$/$(basename $(notdir $<)).pdf $(TMP)/$$$$/$(basename $(notdir $<)).dvi && \
	convert -density 300 $(TMP)/$$$$/$(basename $(notdir $<)).pdf -quality 90 $@ && \
	rm -r $(TMP)/$$$$ && \
	touch $@

purge:
	$(RM) -r $(TMP)

clean: purge
	$(RM) $(PNG_FILE)