#!/usr/bin/env bash

echo " Rebuilding config... "
sudo nixos-rebuild switch --flake $HOME/nix
echo " Finished. "
echo " If it is your first time installing this config, please reboot "
exit 0;