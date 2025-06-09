{ config, pkgs, inputs, ... }:

{
  imports = [ ./nixvim ];

  home.username = "thankod";
  home.homeDirectory = "/home/thankod";

  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip

    ranger
    yazi
    duf
    ncdu
    gdu

    lazygit

    cowsay
    fastfetch

    which

    nix-output-monitor

    lsof
    btop
    htop
    pciutils
    dig

    firefox

    nixfmt

    sops
    age

    cargo
    rustc

    sbcl
  ];

  home.stateVersion = "25.05";

  programs = { home-manager.enable = true; };

  programs = {

    git = {
      enable = true;
      userEmail = "thankoder@gmail.com";
      userName = "thankod";
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      prezto = {
        enable = true;
        pmodules = [
          "environment"
          "editor"
          "directory"
          "spectrum"
          "utility"
          "git"
          "completion"
          "syntax-highlighting"
          "history-substring-search"
          "autosuggestions"
          "prompt"
        ];
        prompt.theme = "skwp";
        extraConfig =
          "zstyle ':prezto:module:history-substring-search' unique 'yes'";
      };
      shellAliases = {
        update = "sudo nixos-rebuild switch --flake ~/NixOS |& nom";
        nixsystem = "nvim ~/NixOS/system";
        nixhome = "nvim ~/NixOS/home";
        lazygit = "LANG=zh_CN LC_ALL=zh_CN lazygit";
      };
    };
  };
}
