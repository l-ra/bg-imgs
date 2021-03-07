#!/bin/sh
DELAY=10
echo "rotate images started at $(date -Isec)" > $(dirname $0)/start-notice.txt
while true; do
	for i in $(ls $(dirname $0)/*.jpg); do 
		img=$(realpath $i)
		pcmanfm --set-wallpaper="$img"
		sleep $DELAY
	done
done
