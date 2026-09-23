{ config, pkgs, ... }:

{
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
