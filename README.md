# DECODE whitepaper

This whitepaper describes the overall architecture of the [DECODE
project](decodeproject.eu). This document comprises contents from
various deliverables and is a comprehensive introduction to the
project aims and solutions provided.

This document will be updated in the course of the project to reflect
choices and changes made to the plan, leading to a final version by
the end of 2019; However no major changes are predicted until then.

## Building

Rendering to DOCX and Markdown is handled by Writedown, included as submodule.

You will need texlive-latex and [pandoc](http://pandoc.org/installing.html) installed

```
On Debian based distros

apt-get install -y zsh texlive-latex-base texlive-fonts-recommended texlive-latex-extra pandoc 

-----------

On OSX

brew install pandoc
brew install pandoc-citeproc
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

# Licensing

This work is licensed under the Creative Commons
Attribution-ShareAlike 4.0 International License. To view a copy of
this license, visit http://creativecommons.org/licenses/by-sa/4.0/ or
send a letter to Creative Commons, PO Box 1866, Mountain View, CA
94042, USA.
