{ config, inputs, pkgs, ...}: {
	imports = [
		./hardware-configuration.nix
		./pkgs.nix
		./modules/bundle.nix
	];
	programs.zsh.enable = true;
	programs.steam.enable = true;		
	# set a hostname
	networking.hostName = "nixos";
  services.resolved.enable = true;
  time.timeZone = "Asia/Yekaterinburg"; # set your timezone
	i18n.defaultLocale = "en_US.UTF-8"; # default locate (locale.conf in arch for example)
	i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8" ];
	nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes
 	system.stateVersion = "24.05"; # dont touch it <3
	# OpenSSH (allow to ssh into this machine)
	services.openssh.enable = true;
}

