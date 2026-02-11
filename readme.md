# Ash-Config

## Description
"Ash-Config is a FOSS nixOS config starting point. Made for experienced Nix users or businesses that need a stable, yet modern NixOS config. Ash-Config is not yet ready for usage, but open for testing."

## Getting Started With Ash-Config
### With a existing flake-based NixOS installation:
```
$ cd /path/to/config/dir
$ git clone https://github.com/rhbollinger1s/Ash-Config
$ sudo nixos-rebuild boot --flake .#basic
$ sudo reboot
$ nix shell nixpkgs#fastfetch -c fastfetch
```

### New NixOS installation:
Instructions Coming Soon

## Project Organization
### Some parts might be missing. Will be added later.
### Not all files are shown here
```
EtcFiles/
  ModuleBoilerplate
Hosts/
  TemplateHosts/
    Basic/
    Desktop/
      HyprlandDesktop/
      KDEPlasmaDesktop/
    Server/
  Local/
  Rhbollinger1sHosts/
    Desktop/
    Laptop/
Modules/
  Audio/
  Bootloaders/
  Desktop/
  DisplayManager/
  Drivers/
    GPU/
      Nvidia/
      AMD/
  Etc/
  Kernels/
  Packages/
    Kits/
    Apps/
flake.nix
flake.lock
readme.md
```

## Licensing
"This project is under the Apache 2.0 license."
