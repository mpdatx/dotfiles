#!/bin/bash

echo -n "Checking dotfiles..."
FETCH=$(git -C ~/dotfiles fetch)
LOCAL=$(git -C ~/dotfiles rev-parse @)
REMOTE=$(git -C ~/dotfiles  rev-parse @{u})
BASE=$(git -C ~/dotfiles merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "up to date."
elif [ $LOCAL = $BASE ]; then
    echo "Dotfiles out of date"
elif [ $REMOTE = $BASE ]; then
    echo "Need to push dotfiles"
else
    echo "Dotfiles diverged"
fi
