{ lib, inputs, ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "FiraCode";
      size = 13.0;
    };
    settings = {
      background_opacity = 0.9;
      dynamic_background_opacity = 1;
      confirm_os_window_close = 0;
      cursor_trail = 1;
      linux_display_server = "auto";
      wheel_scroll_min_lines = 1;
      enbale_audio_bell = "no";
      selection_foreground = "none";
      selection_background = "none";
      foreground = "#dddddd";
      background = "#000000";
      cursor = "#dddddd";
    };
  };
}
