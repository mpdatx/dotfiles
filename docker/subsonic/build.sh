#!/bin/bash -xe

docker rmi -f subsonic || true
docker pull java:7
# wget http://sourceforge.net/projects/subsonic/files/subsonic/5.2.1/subsonic-5.2.1.deb/download -O subsonic-5.2.1.deb
docker create -v /var/subsonic -v /var/music -v /var/playlists --name subsonic_data java:7 /bin/true
docker build -t subsonic . 
# docker run -p 4040:4040 -d subsonic service subsonic start; tail -F /var/log/subsonic_sh.log
# docker run -p 4040:4040 -d subsonic /bin/bash
