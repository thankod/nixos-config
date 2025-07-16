{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings = {
      defaults = {

      };
    };
    
    keymaps = {
      "<leader>f" = { action = "find_files"; };
      "<leader>g" = { action = "live_grep"; };
      "<leader>:" = { action = "command_history"; };
      "<leader>d" = { action = "diagnostics"; };
      "<leader>sk" = { action = "keymaps"; };
    };
  };
}
