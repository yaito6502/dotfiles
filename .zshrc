eval "$(anyenv init -)"
alias USER="yaito"
alias MAIL="yaito@student.42tokyo.jp"
alias norm=norminette
alias cmp='gcc -Wall -Wextra -Werror'
alias key='cat ~/.ssh/id_rsa.pub'
alias relogin='exec $SHELL -l'
source $HOME/.brewconfig.zsh
export PATH="$HOME/.node_modules_global/bin:$PATH"
export PATH="$HOME/homebrew/bin:$PATH"
