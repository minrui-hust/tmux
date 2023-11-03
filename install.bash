#! /bin/bash

# Give an error when expanding an unset variable
set -u

# install pre-request
sudo apt install libncurses-dev libevent-dev -y

# remove already install tmux
sudo apt remove tmux -y

# download tmux
if (tmux -V &>> /dev/null); then
  echo tmux already installed, version: `tmux -V`
else
  echo Installing tmux...
  tmux_image=tmux-3.3a.tar.gz
  tmux_image_path=https://github.com/tmux/tmux/releases/download/3.3a/
  wget -c -O /tmp/${tmux_image} ${tmux_image_path}/${tmux_image} || { echo tmux install failed; exit 1; }
  tar xzf /tmp/${tmux_image} -C /tmp
  cd /tmp/tmux-3.3a && ./configure
  sudo make install -j
fi

