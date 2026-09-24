# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./system/networking.nix
    ./system/nvidia.nix
    ./system/display-manager.nix
  ];

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

  services.desktopManager.plasma6.enable = true;

  services.xserver.windowManager.i3.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics = {
    enable = true;
   # enable32Bit = true;
  };
  # services.xserver.displayManager.setupCommands

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # boot.blacklistedKernelModules = [ "nouveau" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    arthur = {
      isNormalUser = true;
      description = "Arthur";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      packages = with pkgs; [ ];
    };
    /*
      arthur-games = {
        isNormalUser = true;
        description = "Arthur Games";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        ];
      };
    */
  };

  #services.printing.enable = true;
  #services.avahi.enable = true;
  #services.avahi.nssmdns4 = true;

  #hardware.printers.ensurePrinters = [];

  # Already done by KDE but better to still declare it
  services.pipewire = {
    enable = true;
    alsa.enable = true; # enable alsa utils
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nixpkgs.config.permittedInsecurePackages = [
    #TODO add this to the main config if rstudio in active
    #"electron-41.9.1"
  ];

  environment.systemPackages = with pkgs; [
  ];

  xdg.mime.defaultApplications = {
    "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
