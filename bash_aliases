alias ll='ls -l'
alias la='ls -lAh'
alias l='ls -CF'
alias tabe='mvim'
alias ddm='drush make --no-core --contrib-destination=.'
mgrep () { grep -Ir --colour=always "$@" * ; }
#alias pg_start= 'pg_ctl -D /usr/local/var/postgres start'
alias tunnel='ssh -f gad -L 5432:localhost:5432 -N'
alias tunnel_acorn='ssh -f acorn -L 5430:localhost:5432 -N'
tsh () { ssh -t $1 "tmux attach || tmux new || login" $2 $3 * ; }

