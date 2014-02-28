#!/bin/bash
#
#This builds pacaur, and sets up oh-my-zsh
#
#################################################
wget http://pkg.sbr.io/archlinux/i686/cower-git-9.19.gf2d9c48-1-i686.pkg.tar.xz &&
sleep 2 &&
pacman -U *.tar.xz &&
sleep 1 &&
rm *.tar.xz &&
sleep 2 &&
wget https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz &&
sleep 2 &&
tar xzvf pacaur.tar.gz &&
sleep 2 &&
cd pacaur &&
makepkg -s --asroot &&
sleep 2 &&
pacman -U *.tar.xz &&
sleep 3 &&
cd .. &&
rm *.tar.gz &&
rm -rf pacaur &&
sleep 2 &&
pacaur -S oh-my-zsh-git --asroot &&
sleep 2 &&
wget https://raw.github.com/i3-Arch/i3config/master/zshrc &&
mv zshrc ~/.zshrc &&
chsh -s $(which zsh) &&
echo " CLOSE OPEN TERMINALS, AND RE-OPEN TO SEE NEW SHELL / CONFIG ! "
sleep 3 &&
exit
