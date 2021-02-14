# voxatron-in-a-web

Copyright (c) 2021, Luis Quesada Torres - https://github.com/lquesada | www.luisquesada.com

This is a script that uses the existing widget deployment at lexaloffle.com bbs to generate a self-contained deployment of voxatron that runs in a web.

DISCLAIMER: This is a proof of concept and is very hacky, it will likely not run well. It is not to be actually used. If you run this, you are the only person to be held responsible for it.

Note:
- This requires opening the html file through a web server (remote or local). It doesn't work by opening the local file directly with the browser.
- Most of the (hacky) logic below is to alter the html file to run locally (and to hide e.g. name of the game cartridge).

Run sh generate.sh and it will generate the voxatron_player directory. Place it in a web server (e.g. start a local server) and open index.html from there.
You can replace cartridge.png and thumbnail.png with any cartridge and thumbnail you want.

If this doesn't work, perhaps the cartridge was removed. Find a new cartridge ID from voxatron bbs that works. Look for widget.php. An example of valid ID is 7705.
