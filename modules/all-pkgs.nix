
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    file
    gimp

    cargo
    rustup
    rust-analyzer
    gparted

    rustc
    clang_18
    valgrind
    jupyter
    fastfetch
    nodejs
    postgresql
    maven
    jdk21
    # Default utils
    alsa-utils
    bat
    bash
    curl
    git
    htop
    neovim
    pavucontrol
    scrot
    tree
    vim
    wget
    xclip
    xss-lock

    # Default apps
    alacritty
    chromium
    discord
    firefox
    nautilus

    # Compiling tools
    clang
    clang-tools
    cmake
    gcc
    gnumake

    # IDEs
    jetbrains.idea
    jetbrains.clion
    jetbrains.webstorm

    #apache-airflow

    # Docker and its friends
    docker
    docker-compose
    grafana
    prometheus

    # Python langage
    (python3.withPackages (
      ps: with ps; [
        # apache-airflow
        ipython
        matplotlib
        numpy
        pandas
        requests
      ]
    ))

    # i3
    i3status
    i3lock
    i3blocks
    dmenu
    networkmanagerapplet

    # Manual pages
    man-pages
    man-pages-posix

    # Other
    ntfs3g # NTFS driver
    prismlauncher
    jdk25_headless

    # KDE Plasma
    kdePackages.polkit-kde-agent-1
    #kdePackages.konsole kdePackages.dolphin kdePackages.kate

    #VPN
    pkgs.cloudflare-warp

  ];

}
