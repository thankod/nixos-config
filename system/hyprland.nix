{ pkgs, config, lib, ...}: 
{
  programs = {
    hyprland = {
      enable = true;
    };

    #hyprlock.enable = true;
  };

  services.hypridle.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtwayland
    pyprland
    xwayland
    hyprpicker
    hyprcursor
    #hyprlock
    hypridle
    hyprpaper
    waypaper
    waybar
    wlogout
    hyprshade
    kitty
  ];

}
