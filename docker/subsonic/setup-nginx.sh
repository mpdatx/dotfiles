#!/bin/bash -xe

docker run -v /var/run/docker.sock:/tmp/docker.sock:ro -v `pwd`:/etc/docker-gen/templates jwilder/docker-gen -only-exposed /etc/docker-gen/templates/nginx-template /etc/docker-gen/templates/subsonic.nginx
sudo cp subsonic.nginx /etc/nginx/sites-enabled/
sudo service nginx restart
