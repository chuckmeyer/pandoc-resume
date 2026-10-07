# Chuck Meyer's Resume 👋

Welcome to the home repo for my resume. I'm not a visual person and really hate futzing with layout/formatting. I found this excellent pipeline using pandoc to generate consistent resumes in various file formats and never looked back.

I am a bit obsessed with writing in Markdown. I feel like it's less distracting than WYSIWYG tools and is fairly easily converted over to things like Word docs or HTML for publishing to a blog (or submitting a resume!)

You can build this yourself using the included Dockerfile, but the latest versions are also available in the `output` directory.

Thanks for stopping by!

The Markdown Resume
===================

Based on [mszep/pandoc_resume](https://github.com/mszep/pandoc_resume). The resume lives in `markdown/chuck_meyer_resume.md`; `make` turns it into HTML, PDF, DOCX and RTF in `output/`.

### Instructions

```bash
git clone https://github.com/chuckmeyer/pandoc-resume
cd pandoc-resume
vim markdown/chuck_meyer_resume.md   # edit the resume
```

#### Dockerized (recommended)

Make everything. This builds the image with pandoc, WeasyPrint and the fonts, then writes the results to `output/`.

```bash
docker compose up --build
```

#### Local

Make everything

```bash
make
```

Make specifics

```bash
make html
make pdf     # builds the HTML first, then renders it with WeasyPrint
make docx
make rtf
```

### How it works

* The Markdown is converted to HTML with pandoc, using the stylesheet in `styles/compact.css` (set by `STYLE` in the `Makefile`).
* The PDF is rendered from that HTML with [WeasyPrint](https://weasyprint.org/), so the page layout is plain CSS (`@page` sets Letter size and margins).
* DOCX and RTF come straight from pandoc and use its default styling.
* The fonts are bundled in `styles/fonts/` (Geist and Geist Mono, SIL Open Font License). Inter is installed in the Docker image as a fallback.

The old ConTeXt template (`styles/chmduquesne.tex`) and its CSS are still in the repo but no longer used by the build.

### Requirements

If not using Docker, you will need:

* pandoc 2.x or later (the Docker image uses 2.12; other versions are untested here)
* WeasyPrint (the Docker image uses 67.0; other versions are untested here)
* The fonts in `styles/fonts/` (bundled, nothing to install)

#### macOS

```bash
brew install pandoc weasyprint
```

#### Debian / Ubuntu

```bash
sudo apt install pandoc weasyprint fonts-liberation
```

#### Fedora

```bash
sudo dnf install pandoc weasyprint
```

#### Arch

```bash
sudo pacman -S pandoc python-weasyprint
```

#### Any platform with Python

```bash
pip install weasyprint
```

### Troubleshooting

#### Get versions

Check if the dependencies are up to date.

```
pandoc --version
weasyprint --version
```

#### `weasyprint: command not found`

`make pdf` calls the `weasyprint` command. Install it with one of the commands above and check that it is on your `PATH`. The HTML, DOCX and RTF targets don't need it.

#### The PDF looks different from the HTML or uses the wrong font

The PDF is built from the HTML in `output/`, so run `make html` (or `make pdf`, which does it for you) after editing the Markdown or the stylesheet. Fonts are loaded from `styles/fonts/` using relative paths; if they are missing, WeasyPrint falls back to a system sans-serif and prints a warning.

#### Docker build fails downloading pandoc

The Dockerfile downloads the **arm64** pandoc 2.12 `.deb` (for Apple Silicon). On an x86 machine, change `pandoc-2.12-1-arm64.deb` in `.docker/resume.dockerfile` to `pandoc-2.12-1-amd64.deb`.

#### Cannot process lua

Currently pandoc 1.x may be within your distro's repos and the latest version should be used. See the
[pandoc releases](https://github.com/jgm/pandoc/releases) for your distro.

e.g. for Debian / Ubuntu
```
wget https://github.com/jgm/pandoc/releases/download/2.12/pandoc-2.12-1-amd64.deb
sudo dpkg -i pandoc-2.12-1-amd64.deb
```
