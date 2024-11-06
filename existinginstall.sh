#!usr/bin/env bash

if [[ "$PWD" != "$HOME/nix" ]]; then
    mkdir -p "$HOME/nix"
    cp -fr "$PWD/**" "$HOME/nix"
    echo " Copied files to $HOME/nix. "
    echo " Modifying the config only in ~/nix !!! "
    echo " Press any key to proceed "
    read ee
fi

echo " Copying hardware-configuration.nix in ./nixos "
sudo cp /mnt/etc/nixos/hardware-configuration.nix $HOME/nix/nixos
echo " Finished. "
echo " Rebuilding the configuration "
sudo nixos-rebuild switch --flake $HOME/nix
echo " Config installed. Restart for full effect. "
echo " Restart? [Y/n] "
read restart
if [[ $restart == "Y" || $restart == "y" ]]; then
    sudo reboot
fi