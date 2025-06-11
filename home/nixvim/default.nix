{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./completion.nix
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
      autoindent = true;
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

      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Go to definition";
            };
          };
        };
        servers = {
          rust_analyzer.enable = true;
          nixd.enable = true;
        };
      };
      lspconfig.enable = true;
      lsp-format.enable = true;
      nix.enable = true;

      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources = {
          formatting = {
            nixfmt.enable = true;
          };
        };
      };


      direnv.enable = true;

      
      diffview.enable = true;
      gitmessenger = {
        enable = true;
        autoLoad = true;
      };
      gitsigns = {
        enable = true;
        autoLoad = true;
      };

      nvim-autopairs.enable = true;
      noice = {
        enable = true;
        settings = {
          enable = true;
          notify.enable = true;
          messages.enable = true;
          popupmenu = {
            enable = true;
            backend = "nui";
          };
        };
      };

    };

  };
}
