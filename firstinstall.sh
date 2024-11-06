echo " Smart installer of NixOS "
echo " Please read the README.md for actually understanding whats going on."
echo " Press any key to continue "
read a
echo " Using disko to format partitions "
echo " (RISK OF LOSING DATA. PLEASE SEE disko.nix BEFORE DOING ANYTHING)"
echo " Press any key to continue or CTRL + C to quit "
read a
echo " Running disko... "
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko $PWD/
echo " Disk has been altered. "
lsblk
echo " Generating a config..."
sudo nixos-generate-config --root /mnt
echo " Config has been generated. "
echo " Installing the system. "
sudo nixos-install
echo " System has been installed. "
mkdir -p /mnt/opt/tempFlake
echo " Copying flake to /opt/tempFlake (in the installed OS) "
cp -a $PWD/. /mnt/opt/tempFlake
echo " Flake has been copied to /opt/tempFlake. "
echo " Once you have booted the system. Please move it from /opt/tempFlake to /home/user/nix "
echo " Then run: sudo mv /opt/tempFlake /home/user/nix"
echo " Enjoy your new system. "
echo " Press any key to reboot "
read a
sudo reboot