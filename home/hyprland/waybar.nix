{ pkgs, lib, config, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = lib.mkDefault ./style.css;
    settings = [{
      layer = "top";
      position = "top";
      fixed-center = true;

      spacing = 0;
      height = 0;
      margin-top = 8;
      margin-right = 8;
      margin-bottom = 0;
      margin-left = 8;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right =
        [ "tray" "pulseaudio" "cpu_text" "cpu" "memory" "custom/notification" ];
      "custom/notification" = {
        tooltip = false;
        format = "{icon}";
        format-icons = {
          notification = "󱅫";
          none = "󰂚";
          dnd-notification = "󰵙";
          dnd-none = "󰂛";
          inhibited-notification = "󱅫";
          inhibited-none = "󰂚";
          dnd-inhibited-notification = "󰵙";
          dnd-inhibited-none = "󰂛";
        };
        return-type = "json";
        exec = "swaync-client -swb";
        exec-if = "which swaync-client";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };

      clock = {
        format = "{:%H:%M - %a, %b %d %Y}";
        tooltip = true;
      };
      cpu = {
        format = "󰻠 : {usage}%";
        interval = 2;

        states = { critical = 90; };
      };
      memory = {
        format = " : {percentage}%";
        interval = 2;

        states = { critical = 80; };

        tooltip = true;
      };
      pulseaudio = {
        format = "{icon} : {volume}%";
        format-muted = "󰖁 : {volume}%";
        format-icons = { default = [ "󰕿" "󰖀" "󰕾" ]; };
      };

    }];

  };
}
