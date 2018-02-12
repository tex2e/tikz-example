
TEX_FILE := $(shell find . -type f -name '*.tex')
PNG_FILE := $(patsubst %.tex, %.png, $(TEX_FILE))
TMP := tmp

all: $(PNG_FILE)

%.png: %.tex
	mkdir -p $(TMP)/$$$$ && \
	platex -shell-escape -halt-on-error -output-directory=$(TMP)/$$$$ $< && \
	dvipdfmx -d5 -o $(TMP)/$$$$/$(basename $(notdir $<)).pdf $(TMP)/$$$$/$(basename $(notdir $<)).dvi && \
	convert -density 200 $(TMP)/$$$$/$(basename $(notdir $<)).pdf -quality 90 $@ && \
	touch $@ \
	&& rm -r $(TMP)/$$$$ \
	|| rm -r $(TMP)/$$$$

purge:
	$(RM) -r $(TMP)

clean: purge
	$(RM) $(PNG_FILE)
