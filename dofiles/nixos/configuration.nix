# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
imports = [ # Include the results of the hardware scan.
		./hardware-configuration.nix
	];

#BOOTLOADER:
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;




#SIEĆ:
networking.networkmanager.enable = true;
networking.hostName = "pc"; 

#REGION:
time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";

i18n.extraLocaleSettings = {
		LC_ADDRESS = "pl_PL.UTF-8";
		LC_IDENTIFICATION = "pl_PL.UTF-8";
		LC_MEASUREMENT = "pl_PL.UTF-8";
		LC_MONETARY = "pl_PL.UTF-8";
		LC_NAME = "pl_PL.UTF-8";
		LC_NUMERIC = "pl_PL.UTF-8";
		LC_PAPER = "pl_PL.UTF-8";
		LC_TELEPHONE = "pl_PL.UTF-8";
		LC_TIME = "pl_PL.UTF-8";
	};

#WYŚWIETLANIE:
services.xserver = {
		enable = true;
		layout = "pl";
		xkbVariant = "";
		videoDrivers = ["nvidia"];
		displayManager.lightdm.enable = true;
		windowManager.spectrwm.enable = true;
	};
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.nvidia = {
    nvidiaSettings = true;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.nvidia.prime = {  
    offload = {
       enable = true;
       enableOffloadCmd = true;
    };
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:5:0:0";
  };


#KLAWIATURA:
console.keyMap = "pl2";


  #DŹWIĘK:
sound.enable = true;
hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
users.users.genti = {
		isNormalUser = true;
		description = "Ignacy Kondraciuk";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
			chromium
			pavucontrol
			htop
			blueman
			git
			dmenu
			neovim
			xfce.thunar
			alacritty
			xlockmore
			xfce.mousepad
			feh
		];
	};
system.stateVersion = "23.05"; # NIE USUWAĆ




#DODATKOWE SERWISY DO WŁĄCZENIA:
hardware.bluetooth.enable = true;
services.blueman.enable = true;
services.printing.enable = true;
#INNE:
nixpkgs.config.allowUnfree = true;
}


