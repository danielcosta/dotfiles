#!/bin/bash

DOTFILES_PATH=$(pwd)

function _link_git(){
  echo "Configurando o git..."
  git config --global include.path ${DOTFILES_PATH}/.gitconfig
  git config --global core.excludesfile ${DOTFILES_PATH}/.gitignore
}

function _get_name(){
  echo "Digite o nome do author dos commits:"
  read name

  if [ ! -z "$name" ]; then
    git config --global user.name "${name}"
  else
    _get_name
  fi
}

function _get_email(){
  echo "Digite o e-mail do author dos commits:"
  read email

  if [ ! -z "$email" ]; then
    git config --global user.email "${email}"
  else
    _get_email
  fi
}

function _install_vimrc(){
  cp includes/.vimrc ~/.vimrc
}

_link_git
_get_name
_get_email
_install_vimrc
