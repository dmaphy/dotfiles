#!/usr/bin/env zsh

if [ ${SHELL} = "zsh" ]; then
	echo "Thou shall not use this without Zsh.";
	exit 1337;
fi

symlinks=(aliases environment functions gitconfig inputrc zshcomp zshenv zshrc.pre)

for symlink in ${symlinks};
do
	ln -s ${HOME}/projects/dotfiles/${symlink} ${HOME}/.${symlink}; 
done