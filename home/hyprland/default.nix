{ pkgs, lib, config, ... }: {
  imports = [ ./waybar.nix ];

  home.packages = with pkgs; [
    wofi-emoji
    copyq
    pavucontrol
    lxqt.lxqt-policykit
    pipes
  ];

  services.hyprpaper.enable = true;
  services.blueman-applet.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";
      "$browser" = "firefox";
      "$emoji" = "wofi-emoji";
      exec-once = [
        "waybar"
        "hyprpaper"
        "swaync"
        "lxqt-policykit-agent"
        "copyq"
        "fcitx5"
      ];
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, C, killactive"
        "$mainMod, M, exit"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, Return, exec, $terminal"
        "$mainMod, R, exec, $menu"
        "$mainMod, J, togglesplit,"
        "$mainMod, B, exec, $browser"
        "CTRL ALT, Delete, exec, wlogout"
        "$mainMod, Z, exec, $emoji"
        #"$mainMod SHIFT, N, exec, swaync-client -t -sw"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, -, workspace, 11"
        "$mainMod, =, workspace, 12"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT, -, movetoworkspace, 11"
        "$mainMod SHIFT, =, movetoworkspace, 12"
        "$mainMod ALT, 1, focusworkspaceoncurrentmonitor, 1"
        "$mainMod ALT, 2, focusworkspaceoncurrentmonitor, 2"
        "$mainMod ALT, 3, focusworkspaceoncurrentmonitor, 3"
        "$mainMod ALT, 4, focusworkspaceoncurrentmonitor, 4"
        "$mainMod ALT, 5, focusworkspaceoncurrentmonitor, 5"
        "$mainMod ALT, 6, focusworkspaceoncurrentmonitor, 6"
        "$mainMod ALT, 7, focusworkspaceoncurrentmonitor, 7"
        "$mainMod ALT, 8, focusworkspaceoncurrentmonitor, 8"
        "$mainMod ALT, 9, focusworkspaceoncurrentmonitor, 9"
        "$mainMod ALT, 0, focusworkspaceoncurrentmonitor, 0"
        "$mainMod ALT, -, focusworkspaceoncurrentmonitor, 11"
        "$mainMod ALT, =, focusworkspaceoncurrentmonitor, 12"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
    };
  };
}
