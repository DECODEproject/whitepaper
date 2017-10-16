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
| Introduction              | priya    |
| Conceptual framework      | jimb     |
| Architectural principles  | priya    |
| OS architecture           | jaromil  |
| The DECODE network        | jimb     |
| Distributed ledger        | alberto  |
| Smart rules engine        | jaromil  |
| DECODE applications       | jimb     |

## Lead Contributors

**Introduction**
- What is DECODE and why is it important - Priya
- History and current "state of the art" - Priya

**Conceptual Framework**
- Privacy By Design - Paulus
- Attributes - Tom D
  - Identity - Tom D
  - Attribute Provenance - Tom D
  - Attribute Verification with ABC - Paulus
- Entitlements - Mark
  - Entitlement Policies - Mark
  - Implementation (Access Control)
  - Attribute based Encryption - Paulus
  - Transparency and integrity - JimB
- Authentication - Jim - Move to Wallet Nodes?
- Distributed Ledger - Alberto

**Architectural Principles**
- Priya

**Operating system Architecture**

- Jaromil

**The DECODE Network**
- Intro - Jim
- Relay Nodes (validating nodes) - Jim 
- Wallet Nodes - Jim
- Hardware hubs - Kristoffer + Ernesto
- Keys and smart cards - Kristoffer + Ernesto
- IOT connectivity - Mark
- P2P Networking - Jaromil? - do we need this section?


**Distributed ledger**
- Alberto

**smart rules engine**
- Jaromil

**DECODE Applications**
- what is a decode applciation - Jim 
- application ecosystem - Jim / Priya
- example of petitions - Jim / Priya
- example of IOT - Jim / Priya


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

## Contributors

- Jim B / Priya (TW)
- Bano / George (UCL)
- Tom D (WAAG)
- Jaap-Henk / Paulus (RU)
- Mark (Thingful)
- Jaromil (Dyne)


