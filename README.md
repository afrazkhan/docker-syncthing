Easy set up of [Syncthing](https://syncthing.net/) for Docker.

## Quick Start

The commands are to be run on _both_ machines you wish to connect:

1. `docker run -d --name st -p 22000:22000 -p 21027/udp -v [DIRECTORY YOU WANT TO SHARE]:/home/syncuser/Sync afrazkhan/syncthing`
2. `docker exec st stcli-actions.sh id` -- make note of ID
3. `docker exec st stcli-actions.sh join [ID FROM OTHER MACHINE]`
