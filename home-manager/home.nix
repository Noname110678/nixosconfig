{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "nam"; # change it here
    homeDirectory = "/home/nam"; # change it here
    stateVersion = "24.05";
  };
}
