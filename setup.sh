#!/bin/bash

DEVENV_DIR="$(pwd)"

cd ${DEVENV_DIR}

#setup vim
echo "setup vim..."
VIM_RC="${HOME}/.vimrc"
VIM_DIR="${HOME}/.vim"
VIM_BUNDLE="${VIM_DIR}/bundle"
VIM_UNDO="${VIM_DIR}/undo"

rm -rf ${VIM_RC}
ln -s ${DEVENV_DIR}/vim/.vimrc ${VIM_RC}

rm -rf ${VIM_DIR}
ln -s ${DEVENV_DIR}/vim ${VIM_DIR}

if [[ ! -d ${VIM_BUNDLE} ]]; then
    mkdir -p ${VIM_BUNDLE}
fi

if [[ ! -d ${VIM_UNDO} ]]; then
    mkdir -p ${VIM_UNDO}
fi

#install vim plugins (using pathogen)
cd ${VIM_BUNDLE}
rm -rf vim-fugitive
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

rm -rf supertab
git clone https://github.com/ervandew/supertab.git

rm -rf ctrlp.vim
git clone https://github.com/kien/ctrlp.vim.git

rm -rf vim-go
git clone https://github.com/fatih/vim-go.git

rm -rf ale
git clone https://github.com/dense-analysis/ale.git

echo "setup git..."
GIT_CONFIG="${HOME}/.gitconfig"
rm -rf ${GIT_CONFIG}
ln -s ${DEVENV_DIR}/git/.gitconfig ${HOME}/.gitconfig

#setup bin
echo "setup bin..."
[ -d ${HOME}/bin ] || mkdir ${HOME}/bin
rm -rf ${HOME}/bin/cs
ln -s ${DEVENV_DIR}/bin/cs ${HOME}/bin/cs
rm -rf ${HOME}/bin/git_vimdiff_wrapper
ln -s ${DEVENV_DIR}/git/git_vimdiff_wrapper ${HOME}/bin/git_vimdiff_wrapper

#setup tmux
echo "setup tmux..."
rm -rf ${HOME}/.tmux.conf
ln -s ${DEVENV_DIR}/tmux/.tmux.conf ${HOME}/.tmux.conf

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

#check necessary utilities
hash ctags 2>/dev/null || { echo -e >&2 "\e[31mWarning: ctags is not installed!\e[0m"; }
hash cscope 2>/dev/null || { echo -e >&2 "\e[31mWarning: cscope is not installed!\e[0m"; }
hash fzf 2>/dev/null || { echo -e >&2 "\e[31mWarning: please install fzf!, then run "PlugInstall" in vim to install fzf.vim plugin\e[0m"; }

