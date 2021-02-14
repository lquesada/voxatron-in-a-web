# voxatron-in-a-web
#
# Copyright (c) 2021, Luis Quesada Torres - https://github.com/lquesada | www.luisquesada.com
#
# This is a script that uses the existing widget deployment at lexaloffle.com bbs to generate a self-contained deployment of voxatron that runs in a web.
#
# DISCLAIMER: This is a proof of concept for educational purposes and is very hacky, it will likely not run well. It is not to be actually used. If you run this, you are the only person to be held responsible for it.
#
# Note:
# - This requires opening the html file through a web server (remote or local). It doesn't work by opening the local file directly with the browser.
# - Most of the (hacky) logic below is to alter the html file to run locally (and to hide e.g. name of the game cartridge).
# - This script doesn't use any data from the registered version of voxatron, nor does any sort of decompiling or reverse engineering of Voxatron. The script downloads the files used to play cartridges in lexaloffle.com bbs, which seem to be a player-only version of voxatron that anyone (registered or not) can use by visiting the forums in that web.
#
# Run sh generate.sh and it will generate the voxatron_player directory. Place it in a web server (e.g. start a local server) and open index.html from there. You can replace cartridge.png and thumbnail.png with any cartridge and thumbnail you want.
#
# If this doesn't work, perhaps the cartridge was removed. Find a new cartridge ID from voxatron bbs that works. Look for widget.php. An example of valid ID is 7705.
#
# I only wrote this script. All credit on Voxatron goes to lexaloffle.com.

id=7705 # Cartridge ID




host='https://www.lexaloffle.com'

rm -rf voxatron_player
mkdir -p voxatron_player
(
cd voxatron_player
wget $host/play/vox_035b.js $host/bbs/vox.data $host/gfx/play80.png $host/bbs/cart_tools.js $host/bbs/cart_tools.wasm
wget "$host/bbs/thumbs/vox$id.png" -O thumbnail.png
wget "$host/bbs/cposts/0/cpost$id.png" -O cartridge.png
wget "$host/bbs/widget.php?pid=$id" -O widget.php
sed -e s/"'\/play\/vox_035b"/"'vox_035b"/g \
    -e s/$id/0000/g \
    -e s/'\/bbs\/cposts\/0\/cpost0000.png'/'cartridge.png'/g \
    -e s/'\/bbs\/thumbs\/vox0000.png'/'thumbnail.png'/g \
    -e s/'\/gfx\/play80.png'/'play80.png'/g \
    -e s/'cursor: none'/'cursor: default'/g \
    -e s/'UA-367250-1'/''/g \
    -e s/'s.parentNode.insertBefore\(ga, s\);'/''/g \
    -e s/'position:absolute; z-index:20; padding:8px; max-width:820px'/'display: none;'/g \
    -e s/'function microAjax(B,A){'/'function microAjax(B,A){return;'/g \
    -e s/'<body style="background-color:#111">'/'<body style="background-color:#111"><div id='banner'>This only runs in a web server \(local or remote\), not by opening the html with a browser<\/div><script type="text\/javascript">if (location.hostname) { document.getElementById("banner").innerHTML = "" }<\/script>'/g \
    widget.php | \
  grep -v 'href=https://www.lexaloffle.com/bbs/' | \
  grep -v 'so_rss.png' | \
  grep -v '<iframe' \
    > index.html
rm widget.php
)
