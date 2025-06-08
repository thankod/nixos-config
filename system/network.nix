{ pkgs, ...} :
{
  
  networking = {

    hostName = "mimo";
    networkmanager.enable = true;

    proxy.default = "http://192.168.1.15:7890";
    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    nameservers = [
      "192.168.1.1"
      "8.8.8.8"
      "114.114.114.114"
    ];
    firewall.allowedTCPPorts = [ 1522 22 ];
    firewall.allowedUDPPorts = [ 1522 22 ];
    defaultGateway = "192.168.1.1";
    interfaces.enp3s0 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.1.19";
          prefixLength = 24;
        }
      ];
    };
  };
}
