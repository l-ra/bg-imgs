#!/bin/sh

BINGIMGDIR=$(dirname $0)/bing-img
mkdir -p  $BINGIMGDIR
IMGINFO=$(dirname $0)/bing-imginfo.json
curl -s "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US" -o $IMGINFO -z $IMGINFO

export IMGURL="https://www.bing.com$(cat $IMGINFO  | jq -r .images[0].url)"
export IMGTITLE="$(cat $IMGINFO  | jq -r .images[0].title)"
export IMGCOPY="$(cat $IMGINFO  | jq -r .images[0].copyright)"

export IMGFILE=$(realpath $BINGIMGDIR/bing-image.jpg)

curl -s "$IMGURL" -o $IMGFILE

cat $(dirname $0)/bing-template.svg | envsubst  > $(dirname $0)/bing-image.svg

convert $(dirname $0)/bing-image.svg $(dirname $0)/bing-image.jpg


