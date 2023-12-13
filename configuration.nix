# Authored by
# Jayden Lee Murray

# Function defintion: {<arg1>, <arg2>, ...}
## A function could be defined as the following, and would still be valid:
#   {<args>}: {
#
#   }

{config, pkgs, ...}:

{

    # Importing *.nix flakes. Must be contained in the same directory as config.
    imports = 
    [
        # Hardware Configuration
        ./hardware-configuration.nix

        # Config Flakes
        ./config-flakes/zsh-conf.nix
        ./config-flakes/starship-conf.nix
        ./config-flakes/wine-conf.nix
        ./config-flakes/awesome-conf.nix

        # Development Flakes
        ./development-flakes/python-env.nix

        # Security Flakes
        ./security-flakes/security-analyzers.nix
        ./security-flakes/security-bluetooth.nix
        ./security-flakes/security-cellular.nix
        ./security-flakes/security-cloud.nix
        ./security-flakes/security-code.nix
        ./security-flakes/security-containers.nix
        ./security-flakes/security-dns.nix
        ./security-flakes/security-exploits.nix
        ./security-flakes/security-forensics.nix
        ./security-flakes/security-fuzzers.nix
        ./security-flakes/security-generic.nix
        ./security-flakes/security-hardware.nix
        ./security-flakes/security-host.nix
        ./security-flakes/security-intel.nix
        ./security-flakes/security-kubernetes.nix
        ./security-flakes/security-ldap.nix
        ./security-flakes/security-load.nix
        ./security-flakes/security-malware.nix
        ./security-flakes/security-misc.nix
        ./security-flakes/security-nettraffic.nix
        ./security-flakes/security-networking.nix
        ./security-flakes/security-packets.nix
        ./security-flakes/security-passwords.nix
        ./security-flakes/security-ports.nix
        ./security-flakes/security-proxies.nix
        ./security-flakes/security-scanners.nix
        ./security-flakes/security-smartcards.nix
        ./security-flakes/security-spoofing.nix
        ./security-flakes/security-terminals.nix
        ./security-flakes/security-tls.nix
        ./security-flakes/security-tunnels.nix
        ./security-flakes/security-voip.nix
        ./security-flakes/security-webservers.nix
        ./security-flakes/security-windows.nix
        ./security-flakes/security-wireless.nix

        # Home Manager
        <home-manager/nixos>
    ];

    #<---- BOOT ---->#
    boot = {

        loader.efi = 
        {

            efiSysMountPoint = "/boot";
            canTouchEfiVariables = true;

        };

        loader.grub = 
        {

            enable = true;
            efiSupport = true;
            useOSProber = true;
            enableCryptodisk = true;
            devices = 
            [ 
                "nodev" 
            ];
            theme = pkgs.nixos-grub2-theme;

        };

        # FULL DISK ENCRYPTION
        # Uncomment below after initiating proper setup to enable.

        # initrd = 
        # {

        #     luks.devices = 
        #     {
        #         root = {

        #             device = "/dev/disk/by-uuid/<REPLACE WITH ENCRPYTED PARTITION>";
        #             preLVM = true;

        #         };


        #     };

        # };

        # END FULL DISK ENCRYPTION

        kernelModules = # Define kernel modules below.
        [
            
        ];

    };
    #<---- END BOOT ---->#
    
    #<---- LOCALE ---->#
    time.timeZone = "America/New_York";
    time.hardwareClockInLocalTime = true;

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = 
    {

        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";

    };
    #<---- END LOCALE ---->#
    
    #<---- SERVICES ---->#
    services = 
    {

        xserver = {

            enable = true;
            layout = "us";
            xkbVariant = "";

            displayManager = {
                lightdm.enable = true;
            };

            desktopManager = {
                cinnamon.enable = true;
            };

        };

        # pipewire = {
            
        #     enable = true;
        #     alsa.enable = true;
        #     alsa.support32Bit = true;
        #     pulse.enable = true;

        # };

        gvfs.enable = true;
        devmon.enable = true;
        udisks2.enable = true;
        upower.enable = true;
        printing.enable = true;
        mullvad-vpn.enable = true;
        accounts-daemon.enable = true;

    };

    #<---- END SERVICES ---->#

    #<---- HARDWARE ---->#

    hardware = 
    {

        opengl = 
        {
            driSupport32Bit = true;
        };

    };

    #<---- END HARDWARE ---->#

    #<---- NETWORK ---->#
    networking = 
    {
        
        hostName = "nix-jaydenlm";
        # Requires "networkmanager" package.
        networkmanager.enable = true;

    };
    #<---- END NETWORK ---->#


    #<---- ENVIRONMENT ---->#
    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
    
    environment = {

        systemPackages = with pkgs; 
        [

            # SYSTEM
            wayland
            gcc
            nixos-grub2-theme

            # ENCRYPTION
            cryptsetup
            tpm-luks

            # ADMINISTRATION
            gtop
            gparted
            etcher
            nixpkgs-fmt
            home-manager
            git
            gh

            # SHELL
            kitty
            kitty-themes
            links2
            neofetch
            btop
            nnn
            qutebrowser
            nordic
            fish
            calc
            genpass
            gptfdisk
            woeusb-ng
            vim

            # FONTS
            font-manager

            fira-go
            fira-mono
            fira-code
            fira-code-symbols
            jetbrains-mono
            nerdfonts
            meslo-lg

            # LOCAL
            appimage-run
            python3
            inetutils
            openvpn
            filezilla
            chromium
            chessx

            libsForQt5.qtstyleplugin-kvantum
            themechanger

            arduino
            arduino-cli
            arduino-core

            steam
            
        ];

        sessionVariables = 
        {
            
            #SHELL = "fish";
            BROWSER = "librewolf";
            EDITOR = "nano";

        };
	
    };
    #<---- END ENVIRONMENT ---->#


    #<---- SOUND ---->#
    sound = {

        enable = true;

    };
    #<---- END SOUND ---->#
    
    #<---- SECURITY ---->#
    security = {

        polkit.enable = true;
        rtkit.enable = true;
        # wrappers = {
        #     pkexec.source = "${pkgs.polkit.bin}/bin/pkexec";
        #     polkit-agent-helper-1.source = "${pkgs.polkit.out}/lib/polkit-1/polkit-agent-helper-1"; 
        # };
    };
    #<---- END SECURITY ---->#


    #<---- USERS ---->#
    users = 
    {
        
        users.jaydenlm = 
        {

            isNormalUser = true;
            shell = pkgs.fish;
            description = "Administrator";
            extraGroups = 
            [
                "tty"
                "dialout"
                "networkmanager"
                "wheel"
            ];
            packages = with pkgs; 
            [
                # VPN
                mullvad-vpn
                
                # Browser
                librewolf
                tor-browser-bundle-bin

                # Mailing
                thunderbird

                # Notes + Code
                libreoffice
                obsidian
                android-udev-rules

                vscode
                vscodium

                ciscoPacketTracer8

                # Remote Desktop
                rustdesk
                
                # Fun
                discord
                betterdiscord-installer
                n2048
                inkscape-with-extensions
                gimp-with-plugins
                googleearth-pro
                shipments

            ];

        };

    };

    home-manager.users = 
    {
    
        jaydenlm = { pkgs, ... }: 
        {

            programs = {

                kitty = 
                {
                    enable = true;
                    theme = "Nord";

                    settings = 
                    {
                        font_family = "FiraCode Nerd Font SemBd";
                        font_size = 11;
                        disable_ligatures = false;
                        window_padding_width = 10;
                    };
                };

            };

            home.stateVersion = "23.05";
        };

    };
    #<---- END USERS ---->#


    #<---- PROGRAMS ---->#
    programs = {

        fish = 
        {
            enable = true;

            shellAliases = {

                # System
                journal = "journalctl -fn 100";

                # NixOS modification
                nswitch = "sudo nixos-rebuild switch";
                nswitchnow = "sudo nixos-rebuild switch && sudo reboot now";
                nupgrade = "sudo nixos-rebuild switch --upgrade";
                nupgradenow = "sudo nixos-rebuild switch --upgrade && sudo reboot now";
                nedit = "sudo nixos-rebuild edit";

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
        };

        steam = 
        {

            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            
        };

    };
    #<---- END PROGRAMS ---->#

    #<---- END OF FILE ---->#
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
    };

    nix.settings = {

        experimental-features = 
        [
            "nix-command"
            "flakes"
        ];

    };
    
    nixpkgs.config = 
    {
        allowUnfree = true;
        allowBroken = true;

        permittedInsecurePackages = 
        [
            "electron-12.2.3"
            "electron-19.1.9"
            "electron-24.8.6"

            "python-2.7.18.6"
            "python-2.7.18.7"

            "googleearth-pro-7.3.4.8248"

            "tightvnc-1.3.10"
        ];
    };

    system.autoUpgrade = 
    {
        enable = true;
        allowReboot = true;
        
    };
    system.stateVersion = "23.11"; 
}
