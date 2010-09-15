# mikls zsh config file.

# Environment variables.
export CLICOLOR=1
export COLORTERM=yes
export EDITOR=vim
export LESS=-r
export LSCOLORS=CxFxExDxBxegedabagacad
export PAGER=less
export TERM=screen

# VirtualEnv wrapper for Django work
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    #source /usr/local/bin/virtualenvwrapper.sh
fi

# OS-specific overrides.
case `uname -s` in
    'Darwin') # Mac OS X
        # Make sure /usr/local/bin takes precendence over /usr/bin
        PATH=/usr/local/bin:"${PATH}"

        # Add our Homebrew Python bin.
        PATH=/usr/local/Cellar/python/2.7/bin:"${PATH}"

        # Only setting the drupal.org CVS root on my Mac
        export CVSROOT=:pserver:mikl@cvs.drupal.org:/cvs/drupal-contrib

        if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
            export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        fi
    ;;
    'FreeBSD')
        if [ -f /usr/local/bin/vim ]; then
            # Set FreeBSD package mirror.
            export PACKAGEROOT=http://ftp.dk.freebsd.org
        fi
    ;;
esac

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Use the same aliases as bash.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Command history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory hist_ignore_all_dups hist_ignore_space

# Keybindings
bindkey -v # VI-style keybindings
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Command completion
autoload -U compinit && compinit
setopt extendedglob
unsetopt CASE_GLOB
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Completion options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
#zstyle ':completion:*:descriptions' format "- %d -"

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# Misc. settings
unsetopt beep # Disable console beeps.
setopt autocd notify

# Configure the prompt
autoload -U promptinit && promptinit
setopt prompt_subst

export PROMPT="%F{cyan}(%f%n@%U%m%u%F{cyan})%f %F{cyan}(%f%i/%l/%?%F{cyan})%f %F{cyan}(%f%~%F{cyan})%f
%# "

# If available, add vcprompt to RPROMPT.
if [ -f ~/bin/vcprompt ]; then
    export RPROMPT='%F{cyan}$(vcprompt -f \(%n:%b%r%m%u\))%f'
fi

