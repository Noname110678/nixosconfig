{
  disko.devices = {
    disk = {
      # please change the drive name (lsblk to view them)
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1"; # ALSO CHANGE HERE TO YOUR DRIVE
        content = {
          type = "gpt"; # partition table i use gpt
          partitions = {
            ESP = {
              label = "boot";
              name = "ESP";
              size = "512M"; # change size if u need
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
            size = "100%"; # change if you need (again)
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # override the existing partition
                #subvols time
                subvolumes = {
                        "@" = {
                          mountpoint = "/";
                          mountOptions = ["subvol=@" "compress=zstd" "noatime"];
                        };
                        "@home" = {
                          mountpoint = "/home";
                          mountOptions = ["subvol=@home" "compress=zstd" "noatime"];
                        };
                        # we need more kthx
                        "@nix" = {
                          mountpoint = "/nix";
                          mountOptions = ["subvol=@nix" "compress=zstd" "noatime"];
                        };
                        "@persist" = {
                          mountpoint = "/persist";
                          mountOptions = ["subvol=@persist" "compress=zstd" "noatime"];
                        };
                        "@log" = {
                          mountpoint = "/var/log";
                          mountOptions = ["subvol=@log" "compress=zstd" "noatime"];
                        };
                        "/swap" = {
                          mountpoint = "/swap";
                          swap.swapfile.size = "34G"; # ram + 2g of swap (IF YOU WANT USE DIFFERENT METHOD I DONT WANNA USE A LOT FOR SWAP)
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
}