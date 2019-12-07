{ bootDevice ? "/dev/sda" }:

{ config, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.devices = [ bootDevice ];

  networking.hostName = "nixos-test2";
  networking.wireless.enable = false;

  networking = {
    usePredictableInterfaceNames = true;
    interfaces.ens18.ipv4.addresses = [{
      address = "10.11.11.32";
      prefixLength = 24;
    }];
    defaultGateway = "10.11.11.253";
    nameservers = [ "10.11.11.253" ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmaQOt+bV0y+Yqvbz6Q7NOMoJ65R2ahjjeGf3pdNu6PM8Zw9VR9p5zCT5h5VoS+0fx6Uk+GgScWp0/uqRg2KgfcQPCqcyl8AhHQou4bsKg8UbDsL/FwHFOEaciMUVxwDnhJ0pkyPl22Dqc4NBkw+CXMV0oFGn7yew59qjLu4XQc82IJnUjPTNZbIA/KQszT8m4A+xlyag4+b8SJ6QeW1vmxxmp1xewTdXpKA3bi16om1TJbaIk22gQhqBWdNV0ue2HbRftDDdbRzneBjF6ssLEBUvXEG6ByCxsD6fHzQyNElJols52AmRi9NCG5WjbgfBJ1IKqj2Wwq8l7evmQGDQz ailiev@mamul.org
"
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    dnsutils
    bc
  ];

  services.openssh.enable = true;
}
