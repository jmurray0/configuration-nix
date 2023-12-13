{ config, pkgs, ... }:

{

  environment = {

    systemPackages = with pkgs;
      [

        macchanger

      ];

  };

  programs =
    { 

    };

}
