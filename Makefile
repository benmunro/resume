SOURCE := resume.md

OUTPUT=$(SOURCE:.md=.pdf)

RM=/bin/rm

PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=--standalone --from markdown+smart

PANDOC_HTML_OPTIONS=--to html5 -c style.css

%.html : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $@ $<

%.pdf : %.html
	npx chrome-headless-render-pdf --url file://$(CURDIR)/$< --pdf $@

.PHONY: all clean

all : $(OUTPUT)

clean:
	- $(RM) -f $(OUTPUT) $(SOURCE:.md=.html)
