# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


touch ~/.check-dotfiles-flag

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# for timing app
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "

# show bash help via ctrl-h
bind '"\C-h"':"\"cat ~/dotfiles/bashhelp.txt\C-m\""

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PYTHONSTARTUP=$HOME/.pythonrc.py


alias pull-dots='git -C ~/dotfiles pull origin master'
alias push-dots='git -C ~/dotfiles commit -a -m "autocommit"; git -C ~/dotfiles push origin master'
alias dots='pull-dots; push-dots; source ~/.profile'
alias vim-bundle="docker run -ti --rm -v $(pwd):/home/developer/workspace jare/vim-bundle"
alias lazygit="git add .; git commit -a -m 'lazygit'; git push;"
alias jekyll-publish='cd /home/mpd/blog && docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll   -it -p 127.0.0.1:4000:4000 jekyll/jekyll jekyll b && cd -'
alias jekyll-publish-drafts='cd /home/mpd/blog && docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll   -it -p 127.0.0.1:4000:4000 jekyll/jekyll jekyll b --draft && cd -'

source ~/dotfiles/git_prompt
source ~/dotfiles/mac-aliases
source ~/dotfiles/complete_hosts.sh

export NVM_DIR="/Users/mdaniels/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [[ "$TERM" != "screen" ]] ; then
    # Attempt to discover a detached session and attach 
    # it, else create a new session

    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
        tmux -2 attach-session -t $WHOAMI
    else
        tmux -2 new-session -s $WHOAMI
    fi
else

    # One might want to do other things in this case, 
    # here I print my motd, but only on servers where 
    # one exists

    # If inside tmux session then print MOTD
    MOTD=/etc/motd.tcl
    if [ -f $MOTD ]; then
        $MOTD
    fi
fi
