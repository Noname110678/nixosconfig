{
	programs.hyprland.enable = true;
	services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
