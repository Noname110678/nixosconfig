{ pkgs, ... }: {

	users.users.nam = { # change name here
		shell = pkgs.zsh;
                isNormalUser = true;
                extraGroups = [ "wheel" "sudo" "NetworkManager" "libvirt" "input" ];
                packages = with pkgs; [
                        #firefox
                        #tree
                ];
        };
}
