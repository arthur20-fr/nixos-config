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
    scrot
    xclip
    xss-lock

    # Default apps
    alacritty
    chromium
    discord
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
