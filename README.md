# DECODE whitepaper

This repository contains the DECODE architecture whitepaper

## Timelines

<img src="https://gogs.dyne.org/DECODE/decode-whitepaper/raw/master/whitepaper-timeline.png"  />


| Date    | Milestone                    |
|---------|------------------------------|
| 28-Sept | Structure / Narrative Agreed |
|         | Authors asigned              |
| 13-Oct  | First draft for circulation  |
| 20-Oct  | Final draft deadline         |
| 31-Oct  | Publish first version        |


## Curators

Here a list of sections and people busy curating them

| Section                   | curators |
|---------------------------|----------|
| Conceptual framework      |          |
| Architectural principles  |          |
| OS architecture           | jaromil  |
| Hardware architecture     |          |
| Distributed ledger        |          |
| Smart rules engine        | jaromil  |
| DECODE applications       |          |

## Building

Rendering to DOCX and Markdown is handled by Writedown, included as submodule.

You will need [pandoc](http://pandoc.org/installing.html) installed

```
brew install pandoc
```

You will also need a LaTeX installation. You should be able to install the basic tex package from [here](http://www.tug.org/mactex/morepackages.html).

If this doesnt work, try [here](https://tug.org/mactex/mactex-download.html)

You then have to find `pdflatex` it should be in `/Library/TeX/texbin` so you can add that to your `$PATH`.

Writedown should be then downloaded as `git submodule`:

```
git submodule update --init --recursive
```

Rendering to DOCX is activated by running
```
./writedown/render
```

## Contributors

- Jim B / Priya (TW)
- Bano / George (UCL)
- Tom D (WAAG)
- Jaap-Henk / Paulus (RU)
- Mark (Thingful)
- Jaromil (Dyne)


