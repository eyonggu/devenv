#!/bin/bash

# TODO:

GITHUB_DIR="${HOME}/github"
DEVENV_DIR="${GITHUB_DIR}/devenv"

#clone the repo from github
cd $GITHUB_HOME
if [[ -d ${DEVENV_DIR} ]]; then
    #git pull
    .
else 
    git clone https://github.com/eyonggu/devenv.git
fi

#setup vim
VIM_RC="${HOME}/.vimrc"
VIM_DIR="${HOME}/.vim"
VIM_BUNDLE="${VIM_DIR}/bundle"

rm ${VIM_RC}
ln -s ${DEVENV_DIR}/vim/.vimrc ${VIM_RC}

rm ${VIM_DIR}
ln -s ${DEVENV_DIR}/vim ${VIM_DIR}

if [[ ! -d ${VIM_BUNDLE} ]]; then
    mkdir -p ${VIM_BUNDLE}
fi

#install vim plugins (using pathogen)
cd ${VIM_BUNDLE}
rm -rf vim-fugitive
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

rm -rf supertab
git clone https://github.com/ervandew/supertab.git

#setup git
GIT_CONFIG="${HOME}/.gitconfig"
rm -rf ${GIT_CONFIG}
ln -s ${DEVENV_DIR}/git/.gitconfig ~/.gitconfig
