{ pkgs, ... }: {
	users.users.nam = {
		shell = pkgs.zsh;
                isNormalUser = true;
                extraGroups = [ "wheel" "sudo" "NetworkManager" "libvirt" "input" ];
                packages = with pkgs; [
                        #firefox
                        #tree
                ];
        };
}
