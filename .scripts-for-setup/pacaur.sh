#!/bin/bash
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
rm pacaur.tar.gz &&
rm -rf pacaur &&
exit
