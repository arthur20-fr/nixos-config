{ config, pkgs, ... }:

{
  #connect ssh from outside the network
  services.tailscale.enable = true;
}
