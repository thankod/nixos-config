{ inputs }: 
{
  program.nixvim.plugins = {
    blink-compat.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        sources = {
          default = [ "lsp" "path" "buffer" ];
        }
        comletion = {
          list.selection = {
            preselect = false;
            auto_insert = true;
          };
        };
        documentaion.auto_show = true;
      };
    };
  }
}
