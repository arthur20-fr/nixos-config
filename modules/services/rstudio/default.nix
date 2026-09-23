
{ config, pkgs, ... }:
  

  nixpkgs.config.permittedInsecurePackages = [
    "electron-41.9.1"
    #"python3.13-apache-airflow-2.7.3"
  ];
  
  environment.systemPackages = with pkgs; [
    # R langage
    #R
    #rstudio
    (rstudioWrapper.override {
      packages = with rPackages; [
        readxl
        dplyr
        ggplot2
        janitor
        knitr
        rmarkdown
      ];
    })
  ];


}
