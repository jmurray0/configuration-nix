{ config, pkgs, ... }:

{

  environment = {

    systemPackages = with pkgs;
      [

        wireshark
        nmap-unfree
        netdiscover
        dig

      ];

  };

  programs =
    { 

    };

}
