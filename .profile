#.bashrc
# Source brew bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

[[ -s "/Users/pkoch/.rvm/scripts/rvm" ]] && source "/Users/pkoch/.rvm/scripts/rvm"

[[ -s "$HOME/.rvm/contrib/ps1_functions" ]] && source "$HOME/.rvm/contrib/ps1_functions"

export PS1="$RAILS_ENV $PS1"

# User specific aliases and functions
alias ls='ls -GFhb'

# Change bash key behaviour
bind Space:magic-space
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# try source .general_exports
if [ -f $HOME/.general_exports ]; then
    . $HOME/.general_exports
fi

# User specific environment and startup programs
#export PS1="\t\[\033[01;30m\]|\[\033[01;34m\]\u\[\033[01;32m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\n\$ "
ps1_set

# from /etc/bashrc: Make bash check its window size after a process completes
shopt -s checkwinsize # Check window after each command
shopt -s cdspell      # This will correct minor spelling errors in a cd cmd
shopt -s histappend   # Append to history rather than overwrite
shopt -s histreedit   # Edit failled substitutions
#shopt -s histverify   # History substitution in-place, for verification
