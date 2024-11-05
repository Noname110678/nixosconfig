
{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;


	# defining all the packages we need
	environment.systemPackages = with pkgs; [
		# Desktop apps
		obs-studio
		rofi
		wofi
		mpv
		pavucontrol
		kitty
		gparted
		telegram-desktop
		google-chrome
		nautilus
		gedit
		feh
		pinta
		steam

		# CLI
		
		doas
		htop
		wget
		git
		killall
		neofetch
		file
		fastfetch
		nix-index
		unzip
		scrot
		ffmpeg
		light
		lux
		mediainfo
		ranger
		cava
		zip
		ntfs3g
		yt-dlp
		brightnessctl
		swww
		openssl
		lazygit
		bluez
		bluez-tools
		zsh
		lshw
		# wayland approved
		wl-clipboard
		xwayland
		wl-clipboard
		cliphist
		wlogout
		swaylock
		hyprpaper
		waybar
		egl-wayland
		# Sound
		pipewire
		wireplumber

		# Screenshots

		grim
		grimblast
		slurp
		flameshot
		swappy
		spectacle

		# Other
		pciutils
		busybox
		home-manager
		libsForQt5.qtstyleplugin-kvantum
		libsForQt5.qt5ct
		glib
		python3
		catppuccin-cursors	
		lxappearance
		wireguard-tools
    
	];

	#nerd fonts
	fonts.packages = with pkgs; [
   		  jetbrains-mono
  		  noto-fonts
  		  noto-fonts-emoji
  		  twemoji-color-font
  		  font-awesome
  		  powerline-fonts
 		  powerline-symbols
 		  (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  	];
} 
