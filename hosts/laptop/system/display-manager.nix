{ config, lib, pkgs, ... }:

let
  sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";  # or any other theme
    themeConfig = {
      # Customize colors and settings
      HeaderTextColor = "#d5c4a1";
      #Background = "Backgrounds/your-custom-background.png";
      # ... other theme configuration options
    };
  });/*.overrideAttrs (oldAttrs: {
    # Optional: Inject custom background image
    installPhase = oldAttrs.installPhase + ''
      chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      cp ${./relative/path/to/your-custom-background.png} \
        $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/your-custom-background.png
    '';
  });*/
in
{
  environment.systemPackages = [ sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia # Required for video backgrounds/audio
    ];
    theme = "sddm-astronaut-theme";
  };
}
/*
{
  services.displayManager = {

    defaultSession = null; # change to i3, wayland or other later
    
    sddm = {
      enable = true;
      
    };
  };
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm.wayland.enable = false;

}*/

# services.xserver.enable = lib.mkIf config.services.displayManager.sddm.enable true;
#TODO keep this for later for different configs, i3 and wayland for example
