#zmodload zsh/zprof

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace

# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

# display PID when suspending processes as well
setopt longlistjobs

# report the status of backgrounds jobs immediately
setopt notify

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# not just at the end
setopt completeinword

# Don't send SIGHUP to background processes when the shell exits.
setopt nohup

# make cd push the old directory onto the directory stack.
setopt auto_pushd

# avoid "beep"ing
setopt nobeep

# don't push the same dir twice.
setopt pushd_ignore_dups

# * shouldn't match dotfiles. ever.
setopt noglobdots

# use zsh style word splitting
setopt noshwordsplit

# don't error out when unset parameters are used
setopt unset

## add `|' to output redirections in the history
setopt histallowclobber

## try to avoid the 'zsh: no matches found...'
setopt nonomatch

## warning if file exists ('cat /dev/null > ~/.zshrc')
setopt NO_clobber

## alert me if something failed
setopt printexitvalue

## Allow comments even in interactive shells
setopt interactivecomments

## if a new command line being added to the history list duplicates an older
## one, the older command is removed from the list
setopt histignorealldups

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
  docker docker-compose dotenv firewalld fluxcd gcloud git git-auto-fetch
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

source /usr/share/bash-completion/completions/azure-cli
source /usr/share/bash-completion/completions/timew
source /usr/share/bash-completion/completions/kubie.bash
#source $HOME/.bash_completions/_openstack
#eval "$(_YAOOKCTL_COMPLETE=zsh_source yaookctl)"
eval "$(direnv hook zsh)"

complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/bin/aws_completer aws

export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=2
export MCFLY_RESULTS=128
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_RESULTS_SORT=LAST_RUN
export MCFLY_PROMPT="❯"

eval "$(mcfly init zsh)"
eval "$(mise activate zsh)"
eval "$(starship init zsh)"

#zprof
