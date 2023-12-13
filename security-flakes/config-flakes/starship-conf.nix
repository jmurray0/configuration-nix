{ config, pkgs, ... }:

{

    environment = {

      systemPackages = with pkgs;
        [

          # STARSHIP
          starship

        ];

    };

    programs.starship =
      {

        enable = true;

        settings =
          {
            add_newline = true;
            format =
              "[╭─](bold green)$time$battery[────────────────→](bold green)\n[│](bold green)$shell$sudo$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration\n[╰─────→](bold green)$character";

            shell =
              {
                disabled = false;
                format = "[$indicator]($style) ";
                style = "bright-green bold";
                zsh_indicator = "zsh";
                bash_indicator = "󱆃";
                fish_indicator = "󰻳";
                unknown_indicator = "";
              };
            time =
              {
                disabled = false;
                format = "[󰥔]($style) [\\[ $time \\]]($style)";
                style = "bright-green bold";
                time_format = "%T";
                utc_time_offset = "-4";
              };
            battery =
              {
                full_symbol = "󱟢";
                charging_symbol = "󱟦";
                discharging_symbol = "󱟤";
              };
            sudo =
              {
                disabled = false;
                format = "[$symbol]($style) ";
                symbol = "󱅞";
                style = "bright-red bold";
              };
            username =
              {
                format = "[$user]($style) ";
                style_user = "bright-white bold";
                style_root = "bright-red bold";
                show_always = true;
              };
            hostname =
              {
                style = "bright-green bold";
                ssh_only = true;
              };
            nix_shell =
              {
                symbol = "󱄅";
                format = "[$symbol](bright-blue) [$name]($style) ";
                style = "bright-blue bold";
              };
            git_branch =
              {
                only_attached = true;
                format = "[$symbol $branch]($style) ";
                symbol = "󰘬";
                style = "bright-yellow bold";
              };
            git_commit =
              {
                only_detached = true;
                format = "[ﰖ$hash]($style) ";
                style = "bright-yellow bold";
              };
            git_state =
              {
                style = "bright-purple bold";
              };
            git_status =
              {
                style = "bright-green bold";
              };
            directory =
              {
                read_only = " 󰉐";
                truncation_length = 0;
              };
            cmd_duration =
              {
                format = "[$duration]($style) ";
                style = "bright-blue";
              };
            jobs =
              {
                style = "bright-green bold";
              };
            character =
              {
                success_symbol = "[](bright-green bold)";
                error_symbol = "[](bright-red bold)";
              };

          };

      };

}
