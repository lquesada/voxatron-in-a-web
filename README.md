# voxatron-in-a-web

Copyright (c) 2021, Luis Quesada Torres - https://github.com/lquesada | www.luisquesada.com

This is a script that uses the existing widget deployment at lexaloffle.com bbs to generate a self-contained deployment of voxatron that runs in a web.

**The example/ subdirectory contains a working example output, the script may not work anymore.** Test it [here](https://lquesada.github.io/voxatron-in-a-web/example/).

**DISCLAIMER**: This is a proof of concept for educational or local testing purposes and is very hacky, it will likely not run fine. It is not to be actually used. It is a bad idea to run this and, if you do, you are the only person to be held responsible for it if anything goes wrong.

Note:
- This requires opening the html file through a web server (remote or local). It doesn't work by opening the local file directly with the browser.
- Most of the (hacky) logic below is to alter the html file to run locally (and to hide e.g. name of the game cartridge).
- This script doesn't use any data from the registered version of voxatron, nor does any sort of decompiling or reverse engineering of Voxatron. The script downloads the files used to play cartridges in lexaloffle.com bbs, which seem to be a player-only version of voxatron that anyone (registered or not) can use by visiting the forums in that web.

Run sh generate.sh and it will generate the voxatron_player directory. Place it in a web server (e.g. start a local server) and open index.html from there.
You can replace cartridge.png and thumbnail.png with any cartridge and thumbnail you want.

If this doesn't work, perhaps the cartridge was removed or the web changed. Find a new cartridge ID from voxatron bbs that works. Look for widget.php. An example of valid ID is 7705.

I only wrote this script. All credit on Voxatron goes to lexaloffle.com.
