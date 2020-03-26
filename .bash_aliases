# From bash
alias ll='ls -alF'
alias ls='ls -C'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo er    ror)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# General
alias vim='nvim'
alias tmux='export TERM=tmux-256color; tmux -2'

# Git
alias gpo='git push origin'
alias gc='git checkout'

# Kubernetes
alias kubectl='microk8s.kubectl'
complete -F __start_kubectl kube

alias k='microk8s.kubectl'
complete -F __start_kubectl k
