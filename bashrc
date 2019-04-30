# Throw this in a .bashrc or .bash_profile

# Removes dangling images from docker
alias cleandocker='docker rmi $(docker images -q --filter "dangling=true")'

# Clean up merged branches
alias gcmb="git branch --merged | grep -Ev '(^\*|master)' | xargs git branch -d"

# Git CLI
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e[34;1m\]\u\[\e[0m\]\[\e[33;1m\]@\[\e[0m\]\[\e[32;1m\]\h\[\e[0m\] \[\e[31;1m\]'\t'\[\e[0m\] \[\e[34;1m\]'\w'\[\e[0m\]\n\[\e[32;1m\]>\[\e[0m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$ "

