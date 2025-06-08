{ config, lib, pkgs, inputs, ... }:

{
  fonts = {
     packages = with pkgs; [
       nerd-fonts.fira-code
       fira-code
       jetbrains-mono
       noto-fonts-cjk-sans
       noto-fonts-cjk-serif
       noto-fonts-emoji
     ];
     fontconfig = {
       antialias = true;
       hinting.enable = true;
       defaultFonts = {
         emoji = ["Noto Color Emoji"];
	 monospace = [ "FiraCode" ];
	 sansSerif = [ "Noto Sans CJK SC" ];
	 serif = [ "Noto serif CJK SC" ];
       };
     };
  };
}
