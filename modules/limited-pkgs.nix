{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Default utils
    bash
    curl
    git
    htop
    neovim
    pavucontrol
    tree
    vim
    wget

    # Default apps
    firefox

    # i3
    i3status
    i3lock
    i3blocks
    dmenu

    # Manual pages
    man-pages
    man-pages-posix
  ];

}
