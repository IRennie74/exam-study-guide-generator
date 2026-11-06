#!/bin/sh
# Installs the exam-study-guide-generator skill for Claude Code (user level).
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
DEST="$HOME/.claude/skills/exam-study-guide-generator"
mkdir -p "$HOME/.claude/skills"
rm -rf "$DEST"
cp -R "$DIR/exam-study-guide-generator" "$DEST"
cp -R "$DIR/examples" "$DEST/examples"
chmod +x "$DEST"/scripts/*.sh
echo "Installed to $DEST"
for t in pdftotext pdftoppm ffmpeg python3; do
  command -v "$t" >/dev/null || echo "  missing: $t (brew install poppler ffmpeg)"
done
