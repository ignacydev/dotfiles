{ config, pkgs, ... }:

{
home.username = "genti";
home.homeDirectory = "/home/genti";

home.stateVersion = "23.05"; # Please read the comment before changing.

home.packages = with pkgs; [
	chromium
	alacritty
	htop
  ];




programs.home-manager.enable = true;

services.picom = {
  
        
	enable = true;
	fade = true;
	vSync = true;
	inactiveOpacity = 0.9;
	shadow = true;
	backend = "glx";
	settings = {
		blur = { 
			method = "dual_kawase";
    			size = 20;
   			deviation = 5.0;
  		};
	};

};


}

