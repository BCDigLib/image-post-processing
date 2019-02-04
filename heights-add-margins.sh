#!/bin/bash
# This script adds small white margins around tightly cropped Heights files 
# Use it after you convert Heights PDFs to individual TIFs and rename the files
# All TIFs should be in the same directory, which should be spelled out in 'list='
# Dependencies: ImageMagick

cd
list=`find /Volumes/Digital-Library/current-projects/born-digital_BC-pubs/heights-working/tifs -type d`
echo "list=$list"
for directory in $list; do
echo "directory=$directory"
cd $directory
mogrify -format tif -gravity center -background white -extent 110x104% *.tif*
cd
done
