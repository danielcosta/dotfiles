#!/bin/bash

DOTFILES_PATH=$(pwd)

function _link_git(){
  echo "Configuring Git..."
  git config --global include.path ${DOTFILES_PATH}/.gitconfig
  git config --global core.excludesfile ${DOTFILES_PATH}/.gitignore
}

function _get_name(){
  echo "Please input global git author's name:"
  read name

  if [ ! -z "$name" ]; then
    git config --global user.name "${name}"
  else
    _get_name
  fi
}

function _get_email(){
  echo "Please input global git author's e-mail:"
  read email

  if [ ! -z "$email" ]; then
    git config --global user.email "${email}"
  else
    _get_email
  fi
}

function _install_vimrc(){
  echo "Configuring Vim"
  echo "source ~/.dotfiles/includes/.vimrc" >> ~/.vimrc
}

function _install_tmux_conf(){
  echo "Configuring Tmux"
  echo "source ~/.dotfiles/includes/.tmux.conf" >> ~/.tmux.conf
}

function _install_bashrc(){
  echo "Configuring Bash"
  echo "source ~/.dotfiles/includes/.bashrc" >> ~/.bashrc
}

function _finish(){
  echo "Finished. Now please restart bash session."
}

_link_git
_get_name
_get_email
_install_vimrc
_install_tmux_conf
_install_bashrc
_finish
