# Chuck Meyer's Resume 👋
# 
Welcome to the home repo for my resume. I'm not a visual person and really hate futzing with layout/formatting. I found this excellent (thought a bit dated pipeline) using pandoc and context to generate consistent resumes in various file formats and never looked back.

I am a bit obsessed with writing in Markdown. I feel like it's less distracting than WYSIWYG tools and is fairly easily converted over to things like Word docs or HTML for publishing to a blog (or submitting a resume!)

You can build this yourself using the included dockerfile, but the latest versions are also available in the `output` directory.

Thanks for stopping bye!

The Markdown Resume
===================

### Instructions

```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
vim markdown/resume.md   # insert your own resume info
```

#### Local

Make everything

```bash
make
```

Make specifics

```bash
make pdf
make html
```

#### Dockerized

Make everything

```bash
docker-compose up -d
```

### Requirements

If not using `docker` then you will need the following dependencies.

* ConTeXt 0.6x
* pandoc 2.x
    * 1.x is deprecated

Last tested on the above versions and that's not to say the later versions won't work. Please try to use the latest versions when possible.

#### Debian / Ubuntu

```bash
sudo apt install pandoc context
```

#### Fedora
```bash
sudo dnf install pandoc texlive-collection-context
```

#### Arch
```bash
sudo pacman -S pandoc texlive-core
```

#### OSX
```bash
brew install pandoc
brew cask install mactex
```

Make sure to add the directory `/Library/TeX/texbin/` to your path or `context` and `mtxrun` will not be found.

```
export PATH=$PATH:/Library/TeX/texbin/
```

### Troubleshooting

#### Get versions

Check if the dependencies are up to date.

```
context --version
pandoc --version
```

#### Cannot process lua
Currently pandoc 1.x may be within your distro's repos and the latest version should be used. See the
[pandoc releases](https://github.com/jgm/pandoc/releases) for your distro.

e.g. for Debian / Ubuntu
```
wget https://github.com/jgm/pandoc/releases/download/2.2.1/pandoc-2.2.1-1-amd64.deb
sudo dpkg -i pandoc-2.2.1-1-amd64.deb
```

#### Context executable cannot be found
Some users have reported problems where their system does not properly find the ConTeXt
executable, leading to errors like `Cannot find context.lua` or similar. It has been found
that running `mtxrun --generate`, ([suggested on texlive-2011-context-problem](
https://tex.stackexchange.com/questions/53892/texlive-2011-context-problem)), can fix the
issue.
