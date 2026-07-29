HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
unsetopt beep share_history
bindkey -v
bindkey "^e" edit-command-line
bindkey '^ ' autosuggest-accept

zstyle :compinstall filename '/home/dmaphy/.zshrc'
fpath=($fpath $HOME/.zshcomp)
autoload -Uz compinit
compinit

autoload -Uz bashcompinit
bashcompinit

zstyle ':completion:*:default' menu select=1

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(ansible autojump autopep8 aws azure battery bgnotify branch chezmoi
  chucknorris colored-man-pages colorize command-not-found composer cpanm
  dircycle direnv dirhistory dirpersist dnf docker docker-compose dotenv emoji
  firewalld fluxcd fzf gcloud gh git git-auto-fetch git-commit git-extras
  gitfast gitignore git-lfs git-prompt gnu-utils gpg-agent helm httpie isodate
  istioctl jira jsontools k9s kind kompose kubectl kubectx microk8s minikube
  mise nmap opentofu operator-sdk otp pass pep8 perl pip pipenv podman
  pre-commit pulumi pyenv pylint python qrcode redis-cli rsync screen skaffold
  ssh ssh-agent starship systemd taskwarrior terraform thefuck themes tig timer
  tldr tmux urltools uv vagrant vagrant-prompt vault vi-mode virtualenv vscode
  zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(kubeswitch init zsh)
source <(kubeswitch completion zsh)
source <(carapace _carapace zsh)
source /home/dmaphy/projects/fzf-tab/fzf-tab.plugin.zsh
source /home/dmaphy/projects/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh

source /usr/share/bash-completion/completions/azure-cli
source /usr/share/bash-completion/completions/timew
source $HOME/.bash_completions/_kubie
#source $HOME/.bash_completions/_openstack
#eval "$(_YAOOKCTL_COMPLETE=zsh_source yaookctl)"
eval "$(direnv hook zsh)"

complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/bin/aws_completer aws

eval "$(mcfly init zsh)"
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
