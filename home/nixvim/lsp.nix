{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          gd = { action = "definition"; };
          gD = { action = "declaration"; };
          gr = { action = "references"; };
          gt = { action = "type_definition"; };
          gi = { action = "implementation"; };
          gh = { action = "hover"; };
          re = { action = "rename"; };
        };
      };
      servers = {
        rust_analyzer.enable = true;
        nixd.enable = true;
      };
    };
    lspconfig.enable = true;
    lsp-format.enable = true;
  };
}
