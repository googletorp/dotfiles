alias ll='ls -l'
alias la='ls -lAh'
alias l='ls -CF'
alias tabe='mvim'
alias drush='php ~/bin/drush'
mgrep () { grep -Ir --colour=always "$@" * ; }
#alias pg_start= 'pg_ctl -D /usr/local/var/postgres start'
alias tunnel='ssh -f gad -L 5432:localhost:5432 -N'
