#zmodload zsh/zprof

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify

zstyle :compinstall filename '/home/dmaphy/.zshrc'
fpath=($fpath $HOME/.zshcomp)
autoload -Uz compinit && compinit
autoload -Uz bashcompinit &&  bashcompinit

zstyle ':completion:*:default' menu select=1

export ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE="true"
ZSH_THEME="robbyrussell"
plugins=(ansible autojump autopep8 aws azure battery bgnotify colored-man-pages
  colorize command-not-found cpanm dircycle direnv dirhistory dirpersist dnf
  docker docker-compose dotenv firewalld fluxcd fzf gcloud git git-auto-fetch
  git-commit git-extras gitfast gitignore git-lfs gnu-utils gpg-agent helm
  isodate jira jsontools k9s kind kompose kubectl kubectx minikube mise nmap
  opentofu operator-sdk pass pep8 perl pip pipenv podman pre-commit pyenv
  pylint python qrcode redis-cli rsync screen skaffold ssh ssh-agent starship
  systemd taskwarrior terraform thefuck themes tig timer tldr tmux urltools
  vagrant vagrant-prompt vault vi-mode virtualenv vscode zsh-interactive-cd)

# branch chezmoi

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(kubeswitch init zsh)
source <(kubeswitch completion zsh)
source <(carapace _carapace zsh)
#source /home/dmaphy/projects/fzf-tab/fzf-tab.plugin.zsh

# costs at least three seconds more at startup
#source /home/dmaphy/projects/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh

source /usr/share/bash-completion/completions/azure-cli
source /usr/share/bash-completion/completions/timew
source /usr/share/bash-completion/completions/kubie.bash
#source $HOME/.bash_completions/_openstack
#eval "$(_YAOOKCTL_COMPLETE=zsh_source yaookctl)"
eval "$(direnv hook zsh)"

complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/bin/aws_completer aws

eval "$(mcfly init zsh)"
eval "$(mise activate zsh)"
eval "$(starship init zsh)"

#zprof
