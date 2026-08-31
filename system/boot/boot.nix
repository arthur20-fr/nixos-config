{ config, pkgs, ... }:

{
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
}
