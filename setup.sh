#!/bin/bash

#check necessary utilities
bins=(rg ccls)
for b in ${bins[@]}; do
    if ! command -v ${b} &> /dev/null; then
        echo "Please install ${b} first!"
        exit
    fi
done

DEVENV_DIR=${HOME}/.devenv

#setup vim
echo "setup vim..."
VIM_RC="${HOME}/.vimrc"
VIM_DIR="${HOME}/.vim"
VIM_DIR_BACKUP="${VIM_DIR}/backup"
VIM_DIR_BUNDLE="${VIM_DIR}/bundle"
VIM_DIR_UNDO="${VIM_DIR}/undo"

if [[ ! -d ${VIM_DIR_UNDO} ]]; then
    mkdir -p ${VIM_DIR_UNDO}
fi
if [[ ! -d ${VIM_DIR_BACKUP} ]]; then
    mkdir -p ${VIM_DIR_BACKUP}
fi

rm -rf ${VIM_RC}
ln -s ${DEVENV_DIR}/vim/vimrc ${VIM_RC}
rm -rf ${VIM_DIR}
ln -s ${DEVENV_DIR}/vim ${VIM_DIR}

echo "setup git..."
GIT_CONFIG="${HOME}/.gitconfig"
rm -rf ${GIT_CONFIG}
ln -s ${DEVENV_DIR}/git/gitconfig ${HOME}/.gitconfig

#setup bin
echo "setup bin..."
[ -d ${HOME}/bin ] || mkdir ${HOME}/bin
rm -rf ${HOME}/bin/cs
ln -s ${DEVENV_DIR}/bin/cs ${HOME}/bin/cs
rm -rf ${HOME}/bin/git_vimdiff_wrapper
ln -s ${DEVENV_DIR}/git/git_vimdiff_wrapper ${HOME}/bin/git_vimdiff_wrapper
cp ${DEVENV_DIR}/bin/bat ${HOME}/bin/bat
cp ${DEVENV_DIR}/bin/vgrep ${HOME}/bin/vgrep
cp ${DEVENV_DIR}/bin/fd ${HOME}/bin/fd

#setup tmux
echo "setup tmux..."
rm -rf ${HOME}/.tmux.conf
ln -s ${DEVENV_DIR}/tmux/tmux.conf ${HOME}/.tmux.conf

echo "setup ctags..."
rm -rf ${HOME}/.ctags
ln -s ${DEVENV_DIR}/tag/ctags ${HOME}/.ctags

#merge .bashrc
echo "update .bashrc"
mv ~/.bashrc ~/.bashrc.bak
paste -s -d"\n" ~/.bashrc.bak ${DEVENV_DIR}/bash/bashrc_user > ~/.bashrc

#yamllint config
echo "setup yamllint config"
rm -rf $HOME/.config/yamllint
mkdir -p $HOME/.config/yamllint
ln -s ${DEVENV_DIR}/yamlint/config $HOME/.config/yamllint/config

echo "To complete installation"
echo "Open vim and Run :PlugInstall install vim plugins"

