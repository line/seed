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
	@echo "  make test:   Tests the fonts with fontspector"
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

test: build.stamp
	which fontspector || (echo "fontspector not found. Please install it with 'cargo install fontspector'." && exit 1)
	TOCHECK=$$(find $(TTF_OUTPUTS) -type f 2>/dev/null); mkdir -p out/ out/fontspector; fontspector --profile googlefonts -l warn --full-lists --succinct --html out/fontspector/fontspector-report.html --ghmarkdown out/fontspector/fontspector-report.md --badges out/badges $$TOCHECK  || echo '::warning file=sources/config.yaml,title=fontspector failures::The fontspector QA check reported errors in your font. Please check the generated report.'

proof: venv build.stamp
	TOCHECK=$$(find $(TTF_OUTPUTS) -type f 2>/dev/null); . venv/bin/activate; mkdir -p out/ out/proof; diffenator2 proof $$TOCHECK -o out/proof

clean:
	rm -rf venv
	find . -name "*.pyc" -delete

update: venv
	venv/bin/pip install --upgrade pip-tools
	# See https://pip-tools.readthedocs.io/en/latest/#a-note-on-resolvers for
	# the `--resolver` flag below.
	venv/bin/pip-compile --upgrade --verbose --resolver=backtracking requirements.in
	venv/bin/pip-sync requirements.txt

	git commit -m "Update requirements" requirements.txt
	git push
