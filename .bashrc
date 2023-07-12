# My aliases
alias gs='git status'
alias gaa='git add --all'
alias gc='git commit -m $2'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gcol='gmono --debug-collisions'
alias gnav='gmono --debug-navigation'
alias gts='gmono --time-scale $2'
alias c="clear"
alias cd="cd ~/"
alias workspace="cd ~/Workspace"

# Terminal Styles
PS1='\[\033]0;Git Bash$PWD\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"'\u '                # user@host<space>
PS1="$PS1"'\[\033[33m\]'       # change to white
PS1="$PS1"'\w'                 # current working directory
PS1="$PS1"'\[\033[36m\]'       # change color to cyan
PS1="$PS1"'`__git_ps1`'        # bash function
PS1="$PS1"' \[\033[37m\][\A]'  # 24h time, white
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc
