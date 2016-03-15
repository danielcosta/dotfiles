#!/bin/bash

DOTFILES_PATH=$(pwd)

function _link_git(){
    echo "Configurando o git..."

    if [ ! -f ${HOME}/.gitconfig ]; then
        ln -s ${DOTFILES_PATH}/.gitconfig ${HOME}/.gitconfig
    fi
    if [ ! -f ${HOME}/.gitignore ]; then
        ln -s ${DOTFILES_PATH}/.gitignore ${HOME}/.gitignore
    fi
    git config --global include.path ${CONFIG_PATH}/.gitconfig
}

function _get_name(){
    echo "Digite o nome para o author dos commits:"
    read name

    if [ ! -z "$name" ]; then
       git config --global user.name "${name}"
    else
        _get_name
    fi
}

function _get_email(){
    echo "Digite o e-mail para o author dos commits:"
    read email

    if [ ! -z "$email" ]; then
       git config --global user.email "${email}"
    else
        _get_email
    fi
}

function _install_myvimrc(){
    cd ~
    git clone https://github.com/arthurprogramming/myvimconfig.git
    ln -s myvimconfig/.vimrc .vimrc
    ln -s myvimconfig/.vim .vim
    cd myvimconfig
    git submodule init
    git submodule update
}

_link_git
_get_name
_get_email
_install_myvimrc
