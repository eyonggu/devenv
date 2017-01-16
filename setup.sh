#!/bin/bash

# TODO:

GITHUB_DIR="${HOME}/github"
DEVENV_DIR="${GITHUB_DIR}/devenv"

while [ $# -gt 0 ]; do
    case $1 in
        -r)
            RESET=yes
            ;;
        *)
            echo -e "Usage: $(basename $0) [-r]"
            echo -e "Options:"
            echo -e "\t-r: reset whole dev env"
            exit 1
            ;;
    esac

    shift
done

#pull the latest repo, or clone if not exist yet
if [[ -d ${DEVENV_DIR} ]]; then
    cd ${DEVENV_DIR}
    git pull
else
    cd $GITHUB_HOME
    git clone https://github.com/eyonggu/devenv.git
fi

if [[ -z $RESET ]]; then
    #done if not reset!
    exit 0
fi

#setup vim
echo "setup vim..."
VIM_RC="${HOME}/.vimrc"
VIM_DIR="${HOME}/.vim"
VIM_BUNDLE="${VIM_DIR}/bundle"

rm -rf ${VIM_RC}
ln -s ${DEVENV_DIR}/vim/.vimrc ${VIM_RC}

rm -rf ${VIM_DIR}
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

echo "setup git..."
GIT_CONFIG="${HOME}/.gitconfig"
rm -rf ${GIT_CONFIG}
ln -s ${DEVENV_DIR}/git/.gitconfig ${HOME}/.gitconfig

#setup bin
echo "setup bin..."
rm -rf ${HOME}/bin/cs
ln -s ${DEVENV_DIR}/bin/cs ${HOME}/bin/cs
