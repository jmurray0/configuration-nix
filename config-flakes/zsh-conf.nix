{ config, pkgs, ... }:

{

    environment = {

      systemPackages = with pkgs;
        [

          # ZSH
          zsh
          oh-my-zsh

        ];

    };

    programs.zsh =
      {

        enable = true;
        histSize = 10000;
        histFile = "~/zsh/history";

        shellAliases = {

          # System
          journal = "journalctl -fn 100";

          # NixOS modification
          switch = "sudo nixos-rebuild switch";
          switchnow = "sudo nixos-rebuild switch && sudo reboot now";

          # Restarting
          restart = "sudo reboot now";
          reboot = "sudo reboot now";

          # Shutdowns
          shutdown = "sudo poweroff";
          poweroff = "sudo poweroff";

          # Nix Shortcuts
          ns = "nix search nixpkgs";
          ngcold = "sudo nix-collect-garbage -d";

        };

        ohMyZsh = {

          enable = true;
          plugins =
            [
              "git"

            ];
          theme = "agnoster";

        };

      };

}
