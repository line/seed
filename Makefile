CONFIG_FILES=\
	LINESeedJP/sources/config.yaml
METADATA_FILES=\
	LINESeedJP/sources/METADATA.pb
SOURCES=\
	LINESeedJP/sources/LINESeedJP-Thin.glyphs \
	LINESeedJP/sources/LINESeedJP-Regular.glyphs \
	LINESeedJP/sources/LINESeedJP-Bold.glyphs \
	LINESeedJP/sources/LINESeedJP-ExtraBold.glyphs
TTF_OUTPUTS=\
	LINESeedJP/fonts/ttf

help:
	@echo "  make build:  Builds the fonts and places them in the fonts/ directory"
	@echo "  make test:   Tests the fonts with fontbakery"
	@echo "  make proof:  Creates HTML proof documents in the proof/ directory"
	@echo

build: build.stamp

venv: venv/touchfile

build.stamp: venv $(CONFIG_FILES) $(SOURCES)
	rm -rf LINESeedJP/fonts
	(for config in $(CONFIG_FILES); do . venv/bin/activate; gftools builder $$config; done)  && touch build.stamp

venv/touchfile: requirements.txt
	test -d venv || python3 -m venv venv
	. venv/bin/activate; pip install -Ur requirements.txt
	touch venv/touchfile

test: venv build.stamp
	. venv/bin/activate; mkdir -p out/fontbakery; cp $(METADATA_FILES) $(TTF_OUTPUTS); fontbakery check-googlefonts -l WARN --full-lists --succinct --badges out/badges --html out/fontbakery/fontbakery-report.html --ghmarkdown out/fontbakery/fontbakery-report.md $(shell find ${TTF_OUTPUTS} -type f)  || echo '::warning title=Fontbakery failures::The fontbakery QA check reported errors in your font. Please check the generated report.'

proof: venv build.stamp
	. venv/bin/activate; mkdir -p out/proof; diffenator2 proof $(shell find ${TTF_OUTPUTS} -type f) -o out/proof

clean:
	rm -rf venv
	find . -name "*.pyc" -delete

update:
	pip install --upgrade $(dependency); pip freeze > requirements.txt
