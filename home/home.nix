{ config, pkgs, inputs, ... }:

{
  imports = [ ./nixvim ./kitty.nix ./hyprland ];

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

    tldr
    fd
    bat
    eza
    ripgrep
    fzf

    lazygit

    cowsay
    fastfetch

    which

    nix-output-monitor
    nvd

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
    crates-tui

    sbcl

    ponysay
    pokemonsay

  ];

  home.stateVersion = "25.05";

  programs = { home-manager.enable = true; };

  programs = {

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

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
        update = "sudo nixos-rebuild switch --flake ~/NixOS |& nom && diffnew";
        nixsystem = "nvim ~/NixOS/system";
        nixhome = "nvim ~/NixOS/home";
        lazygit = "LANG=zh_CN LC_ALL=zh_CN lazygit";
        ls = "exa";
        cat = "bat";
        diffnew =
          "nvd diff $(command ls -dv /nix/var/nix/profiles/system-*-link | tail -2)";
        difflist =
          "nix profile diff-closures --profile /nix/var/nix/profiles/system";
      };
    };
  };
}
