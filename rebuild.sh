#!/usr/bin/env bash

echo " Rebuilding config... "
sudo -E NIX_CONFIG="experimental-features = nix-command flakes" nixos-rebuild switch --flake $HOME/nix
echo " Finished. "
echo " If it is your first time installing this config, please reboot "
exit 0;