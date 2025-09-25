#!/bin/zsh

cd $(dirname $0)/svg

svgo -f ./
mkdir ../.pdf

for file in ./*.svg; do
    rsvg-convert --format=pdf $file > ../.pdf/$file.pdf
done

"/System/Library/Automator/Combine PDF Pages.action/Contents/MacOS/join" -o ../Airlines.pdf ../.pdf/*.pdf

rm -rf ../.pdf