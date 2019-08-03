alias ll='ls -l'
alias la='ls -lAh'
alias l='ls -CF'
alias tabe='mvim'
alias ddm='drush make --no-core --contrib-destination=.'
mgrep () { grep -Ir --colour=always "$@" * ; }
alias gitcp="git cherry-pick $@ && git commit --amend --reset-author"


