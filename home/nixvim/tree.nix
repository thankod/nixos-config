{ inputs, ... }: {
  programs.nixvim.plugins = {
    neo-tree = {
      enable = true;
      enableGitStatus = true;
    };
  };
}
