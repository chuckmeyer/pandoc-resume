#!/bin/sh
# Build HTML (compact style) and DOCX/RTF in Docker, then render PDFs from the HTML with Chrome.
set -e
cd "$(dirname "$0")"
docker compose run --rm resume-make make html docx rtf STYLE=compact
make pdf-chrome
