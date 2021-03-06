VERSION := EA-SNAPSHOT
INPUT_FILE := decode-whitepaper.md

all: generate-pdf open-pdf

# Seems writedown is hardcoded to output to `./pub`

create-target-dir:
	mkdir -p pub

clean:
	rm -r pub

generate-docx: create-target-dir
	./writedown/render docx

generate-latex: create-target-dir
	./writedown/render latex


generate-pdf: create-target-dir
	./writedown/render pdf

open-pdf:
	open pub/DECODE_Whitepaper_v${VERSION}.pdf


