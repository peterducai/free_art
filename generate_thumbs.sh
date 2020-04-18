#!/bin/bash

readme="# Thumbnails and info\n\n"

## 4K

#![Image](thumbs/thumbnail-bench_town.jpg)

rm -rf docs/thumbs
mkdir docs/thumbs

for f in 4k 1080 other
do
	echo "[Processing folder $f] ----------------------"
    readme=$readme"# $f\n\n"
        for pic in $(ls $f)
    do
        echo "CONVERT -thumbnail 200 $f$pic docs/thumbs/thumb_$pic"
        convert -thumbnail 200 $f/$pic docs/thumbs/thumb_$pic
        readme=$readme"[$pic](../$f/$pic)\n![Image](thumbs/thumb_$pic)\n\n"
    done
done



echo -e $readme > docs/readme.md