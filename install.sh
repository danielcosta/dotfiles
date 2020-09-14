#!/bin/bash

DOTFILES_PATH=$(pwd)

function _link_git(){
  echo "Configuring Git..."
  git config --global include.path ${DOTFILES_PATH}/.gitconfig
  git config --global core.excludesfile ${DOTFILES_PATH}/.gitignore
}

function _get_git_name(){
  echo "Please input global git author's name:"
  read name

  if [ ! -z "$name" ]; then
    git config --global user.name "${name}"
  else
    _get_git_name
  fi
}

function _get_git_email(){
  echo "Please input global git author's e-mail:"
  read email

  if [ ! -z "$email" ]; then
    git config --global user.email "${email}"
  else
    _get_git_email
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

function _install_apps(){
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y vim git tmux powerline fonts-powerline thunderbird docker-compose openjdk-11-jre-headless ca-certificates-java java-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt install -y docker-ce docker-ce-cli containerd.io
  sudo usermod -aG docker $USER
  sudo systemctl enable docker
  curl -L -o /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i /tmp/chrome.deb && rm /tmp/chrome.deb
  curl -L -o /tmp/code.deb "https://go.microsoft.com/fwlink/?LinkID=760868" && sudo dpkg -i /tmp/code.deb && rm /tmp/code.deb
  curl -L -o /tmp/skype.deb https://go.skype.com/skypeforlinux-64.deb && sudo dpkg -i /tmp/skype.deb && rm /tmp/skype.dev
  curl -L -o /tmp/dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb && sudo dpkg -i /tmp/dbeaver.deb && rm /tmp/dbeaver.deb
  sudo snap install authy --beta
  sudo snap install postman
}

function _finish(){
  echo "Finished. Now please restart bash session."
}

_install_apps
_link_git
_get_git_name
_get_git_email
_install_vimrc
_install_tmux_conf
_install_bashrc
_finish
