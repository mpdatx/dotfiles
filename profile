# dotfile-specific setup
touch ~/.check-dotfiles-flag

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# stuff for all platforms

shopt -s autocd


# dotfile management aliases
alias pull-dots='git -C ~/dotfiles pull origin master'
alias push-dots='git -C ~/dotfiles commit -a -m "autocommit"; git -C ~/dotfiles push origin master'
alias dots='pull-dots; push-dots; . ~/.profile'
alias lazygit="git add .; git commit -a -m 'lazygit'; git push;"


# some docker aliases
alias vim-bundle="docker run -ti --rm -v $(pwd):/home/developer/workspace jare/vim-bundle"
alias weechat='docker run -it -e "TERM=screen-256color" jess/weechat'


# show bash help via ctrl-h
bind '"\C-h"':"\"cat ~/dotfiles/bashhelp.txt\C-m\""


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

. ~/dotfiles/git_prompt
. ~/dotfiles/complete_hosts.sh


# mac-specific stuff
if [ $(uname) == "Darwin" ]; then
    . dotfiles/mac/timing.sh
    . dotfiles/mac/iterm_shell_integration.sh
fi

if [ $(uname) == "Linux" ]; then
    . dotfiles/linux/tmux-reattach.sh
    . ~/dotfiles/jekyll.sh  # not strictly linux-specific
fi



# python
export PYTHONSTARTUP=$HOME/.pythonrc.py

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm



