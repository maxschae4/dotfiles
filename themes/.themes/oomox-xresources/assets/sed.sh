#!/bin/sh
sed -i \
         -e 's/#a89984/rgb(0%,0%,0%)/g' \
         -e 's/#282828/rgb(100%,100%,100%)/g' \
    -e 's/#282828/rgb(50%,0%,0%)/g' \
     -e 's/#458588/rgb(0%,50%,0%)/g' \
     -e 's/#ebdbb2/rgb(50%,0%,50%)/g' \
     -e 's/#282828/rgb(0%,0%,50%)/g' \
	$@
