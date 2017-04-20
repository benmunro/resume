SOURCE := resume.md

OUTPUT=$(SOURCE:.md=.html)

RM=/bin/rm

PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=--smart --standalone

PANDOC_HTML_OPTIONS=--to html5 -c style.css

%.html : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $@ $<

.PHONY: all clean

all : $(OUTPUT)

clean:
	- $(RM) $(OUTPUT)
