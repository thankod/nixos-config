{ config, lib, pkgs, inputs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
  users.users.thankod.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDF6a5lUkwOV3nCP3abELyWcHpMKenWF03fInbiJXFNb"
  ];

}
