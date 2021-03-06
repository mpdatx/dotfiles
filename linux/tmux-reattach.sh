#!/bin/sh

# auto-reattach to tmux

if [[ "$TERM" != "screen" ]] ; then
    # Attempt to discover a detached session and attach 
    # it, else create a new session

    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
       tmux -2 attach-session -t $WHOAMI
    else
        tmux -2 new-session -s $WHOAMI
    fi
fi
