#!/bin/bash

function j() { 
    # BLOG_HOME=/home/mpd/blog
    BLOG_HOME=/Users/mdaniels/Dropbox/blog
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
        cd $BLOG_HOME && 
        docker run --volume=$(pwd):/srv/jekyll -it localjekyll \
        jekyll $J_CMD $J_OPT && \
        cd -
}

