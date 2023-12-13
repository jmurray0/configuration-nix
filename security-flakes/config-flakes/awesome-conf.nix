{ config, pkgs, ... }:

{

    services = {

        xserver = {
            
            windowManager = {

                awesome = {

                    enable = true;
                    luaModules = with pkgs.luaPackages; [

                        luarocks
                        luadbi-mysql
                        
                    ];

                };

            };

        };

    };

    environment = {

        systemPackages = with pkgs;
        [

            lxsession
            lxqt.lxqt-policykit
            rofi
            picom
            xorg.transset
            scrot
            xclip

        ];

    };


}
