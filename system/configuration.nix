{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./network.nix
    ./hyprland.nix
    ./font.nix
    ./input.nix
    ./ssh.nix
  ];

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  users.users.thankod = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
    shell = pkgs.zsh;

    hashedPassword =
      "$y$j9T$dQPEdcWo8hmt7Pa3Dl4YJ/$wzHepC3TzBIzmpw1sm/tV7nyOx9ooBAKGUqu875IzNB";
    packages = with pkgs; [ tree ];
  };

  security.sudo.wheelNeedsPassword = false;

  programs = {
    zsh.enable = true;
    neovim.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [ vim wget neofetch git ];
  environment.variables.EDITOR = "nvim";

  #sops = {
  #age.keyFile = "/home/thankod/.config/sops/age/keys.txt";
  #defaultSopsFile = ./secrets.yaml;
  #defaultSymlinkPath = "/run/user/1000/secrets";
  #defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  #};

  system.stateVersion = "24.11"; # Did you read the comment?

}
