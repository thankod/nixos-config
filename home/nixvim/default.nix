{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.gruvbox.enable = true;
    opts = {
      relativenumber = true;
      number = true;
      clipboard = "unnamedplus";
      mouse = "a";
    };

    plugins = {
      lualine.enable = true;
      oil = {
        enable = true;
        settings = {
          view_options = {
            show_hidden = true;
          };
          preview = {
            border = "rounded";
            win_options.winblend = 1;
          };
        };
      };

      lsp.enable = true;
      lspconfig.enable = true;
      lsp-format.enable = true;
      nix.enable = true;

      none-ls = {
        enable = true;
        sources = {
          formatting = {
            nixfmt.enable = true;
            treefmt.enable = true;
          };
        };
        settings = {

          
        };
      };
      nvim-autopairs.enable = true;
      noice = {
        enable = true;
      };
    };

  };
}
