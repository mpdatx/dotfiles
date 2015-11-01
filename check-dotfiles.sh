#!/bin/sh


if [ -f ~/.check-dotfiles-flag ]; then
    LOCAL=$(git -C ~/dotfiles rev-parse @)
    REMOTE=$(git -C ~/dotfiles  rev-parse @{u})
    BASE=$(git -C ~/dotfiles merge-base @ @{u})

    if [ $LOCAL = $REMOTE ]; then
        :
    elif [ $LOCAL = $BASE ]; then
        echo "Dotfiles out of date"
    elif [ $REMOTE = $BASE ]; then
        echo "Need to push dotfiles"
    else
        echo "Dotfiles diverged"
    fi
    rm ~/.check-dotfiles-flag
else
    :
fi
