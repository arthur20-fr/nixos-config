# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader = {

    # systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;

      theme = ./grub-theme;
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm.wayland.enable = false;
  services.desktopManager.plasma6.enable = true;

  services.xserver.windowManager.i3.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    arthur = {
      isNormalUser = true;
      description = "Arthur Work";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    arthur-games = {
      isNormalUser = true;
      description = "Arthur Games";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
  ];

  environment.systemPackages = with pkgs; [

    # Default utils
    curl
    #flameshot
    scrot
    xclip
    git
    htop
    neovim
    pavucontrol
    tree
    vim
    wget

    # Default apps
    alacritty
    chromium
    discord
    firefox
    nautilus

    # Compiling tools
    clang clang-tools
    cmake
    gcc
    gnumake

    # IDEs
    jetbrains.idea
    jetbrains.clion

    # Docker and its friends
    docker
    docker-compose
    grafana
    prometheus

    # Python langage
    (python3.withPackages (ps : with ps; [
      apache-airflow
      ipython
      matplotlib
      numpy
      pandas
      requests
    ]))

    # R langage
    R
    rstudio

    # i3
    i3status
    i3lock
    i3blocks
    dmenu
    networkmanagerapplet

    # KDE Plasma
    #kdePackages.konsole kdePackages.dolphin kdePackages.kate

  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
