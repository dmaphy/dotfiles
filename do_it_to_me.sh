#!/usr/bin/env zsh

if [ "${SHELL}" != "zsh" -a "${SHELL}" != "/bin/zsh" -a "${SHELL}" != "/usr/bin/zsh" ]; then
	echo "Thou shall not use this without Zsh.";
	exit 1337;
fi

symlinks=(aliases environment functions gitconfig* inputrc zshcomp zshenv zshrc.local zshrc.pre vi-mode.zsh vimrc)

for symlink in ${symlinks};
do
	ln -sf ${HOME}/projects/dotfiles/${symlink} ${HOME}/.${symlink}; 
done
