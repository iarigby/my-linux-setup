#!/bin/bash
sudo echo "... means waiting for prompt"
read -p "[manual] connect to wifi..." confirm
cd ~
sudo pacman --noconfirm -Sy redshift
echo "[manual] sign into firefox"
sudo pacman --noconfirm -S yaourt
yaourt -S --noconfirm plasma5-applets-redshift-control
sed -i "s/\(nightTemperature *= *\).*/\12250/" ~/.config/plasma-org.kde.plasma.desktop-appletsrc
echo "[manual] add redshift widget to desktop and change location"
read -p "starting pacman upgrade..." confirm
sudo pacman -Syu
read -p "pacman upgrade hopefully done. Will download dropbox..." confirm
gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
yaourt -S --noconfirm dropbox
dropbox &
read -p "waiting for dropbox to be set up..." confirm

#ssh_business
mkdir ~/.ssh
cp ~/Dropbox/ssh/id_rsa* ~/.ssh/
chmod 700 ~/.ssh/id_rsa
ssh-keyscan github.com >> ~/.ssh/known_hosts

# git repositories start here
clonerepo() {
   git clone git@github.com:iarigby/$1.git
}

cloneall() {
    arr=("$@")
    for repo in ${arr[@]};
    do
        clonerepo $repo
    done
}
root_repos=(my-linux-setup org)
cloneall ${root_repos[@]}

git config --global user.email "marvinzem@gmail.com"
git config --global user.name "iarigby"

mkdir ~/dev
cd dev
# some bullshit because first one won't clone :)
dev_repos=(some_bullshit, learning, liblibfuzz, distributed-systems)
cloneall ${dev_repos[@]}

read -p "installing pacman programs" confirm
pacman_programs=(xclip, thefuck, chromium)
sudo pacman -S --noconfirm ${pacman_programs[@]}

yaourt_programs=(sublime-text-dev)
yaourt -S --noconfirm ${yaourt_programs[@]}

#visual setup

# TODO ew
read -p "konsole: download breeze blur, change white on black transparency" confirm


#xdotool script
#path
#chmod scripts
