#!/bin/bash
wget https://aur.archlinux.org/packages/co/cower/cower.tar.gz &&
sleep 2 &&
tar xzvf cower.tar.gz &&
sleep 1 &&
rm cower.tar.gz &&
cd cower &&
makepkg -s --as-root &&
sleep 2 &&
pacman -U *.tar.xz &&
sleep 3 &&
cd .. &&
rm -rf cower &&
wget https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz &&
sleep 2 &&
tar xzvf pacaur.tar.gz &&
sleep 2 &&
cd pacaur &&
makepkg -s --as-root &&
sleep 2 &&
pacman -U *.tar.xz &&
sleep 3 &&
cd .. &&
rm -rf pacaur &&
exit
