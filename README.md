This repository contains the DECODE architecture whitepaper

Rendering to DOCX and Markdown is handled by Writedown, included as submodule

Writedown should be then downloaded as `git submodule`:

```
git submodule foreach --recursive git submodule init
git submodule foreach --recursive git submodule update
```

Rendering to DOCX is activated by running
```
./writedown/render
```
