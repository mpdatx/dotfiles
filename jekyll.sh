#!/bin/bash

function j() { 
    if [ $1"" == "publish" ]; then 
        J_CMD="b"
    elif [ $1"" == "watch" ]; then 
        J_CMD="b --watch"
    else 
        echo "j [publish|watch] [live|draft]"
        return
    fi 
    if [ $2"" == "live" ]; then 
        J_OPT=""
    elif [ $2"" == "draft" ]; then 
        J_OPT="--draft -d _draft-site"
    else 
        echo "j [publish|watch] [live|draft]"
        return
    fi 
        cd /home/mpd/blog && \
        docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it jekyll/jekyll \
        jekyll $J_CMD $J_OPT && \
        cd -
}

