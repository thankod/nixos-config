{ inputs, ... }: {
  programs.nixvim.plugins = {
    blink-compat.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        sources = { default = [ "lsp" "path" "buffer" ]; };
        completion = {
          list.selection = {
            preselect = false;
            auto_insert = true;
          };
        };
      };
    };
  };
}
