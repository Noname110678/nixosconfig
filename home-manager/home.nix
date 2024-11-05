{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "nam";
    homeDirectory = "/home/nam";
    stateVersion = "24.05";
  };
}
