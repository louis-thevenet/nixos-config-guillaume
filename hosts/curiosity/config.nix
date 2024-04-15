{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.zsh.enable = true;

  console.keyMap = "fr";
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver.libinput.enable = true;

  environment.systemPackages = with pkgs; [vim];
  services.blueman.enable = true;

  system.stateVersion = "23.05";
}
