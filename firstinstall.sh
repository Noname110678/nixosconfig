#!/usr/bin/env bash

# if the script is located in ~/nix then do nothing
if [[ "$PWD" != "/mnt$HOME/nix" ]]; then
    mkdir -p "/mnt$HOME/nix"
    cp -fr "$PWD/**" "/mnt$HOME/nix"
    echo " Copied files to /mnt$HOME/nix. "
    echo " Modifying the config only in ~/nix !!! "
    echo " Press any key to proceed "
    read ee
fi

echo " Formatting disk partitions with disko (PLEASE READ disko.nix BEFORE DOING ANYTHING) "
echo " Continue ? [Y/n] "
read answer
if [[ "$answer"!= "Y" && "$answer"!= "y" ]]; then
    echo " Operation aborted. "
    exit 1
fi
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko /mnt$HOME/nix/disko.nix
echo " Finished. "
echo " Making a config. "
echo " Continue ? [Y/n] "
read answer
if [[ "$answer"!= "Y" && "$answer"!= "y" ]]; then
    echo " Operation aborted. "
    exit 1
fi
sudo nixos-generate-config --root /mnt
echo " Generated config. "
echo " Copying hardware-configuration.nix in ./nixos "
sudo cp /mnt/etc/nixos/hardware-configuration.nix /mnt$HOME/nix/nixos
echo " Finished. "
echo " Installing system. "
echo " Continue ? [Y/n] "
read answer
if [[ "$answer"!= "Y" && "$answer"!= "y" ]]; then
    echo " Operation aborted. "
    exit 1
fi
echo "Setting the channel to unstable.. (rolling release)"
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update nixos
echo "Installing the system. "
echo " This will take a while. Please be patient. "
sudo nixos-install
echo " Finished. "
echo " The system has been installed. "
echo " To apply the flake. Reboot and run another script named rebuild.sh "
echo " Reboot ? [Y/n] "
read answer
if [[ "$answer"!= "Y" && "$answer"!= "y" ]]; then
    echo " Not rebooting. Nothing left to do now. "
    exit 1
fi
echo " Rebooting the system. "
sleep 1
sudo reboot