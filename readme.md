# Ash-Config

## Description
Ash-Config is a FOSS NixOS configuration framework for experienced users and businesses seeking a stable yet modern foundation. Currently in public alpha—functional (basic can be built) but not yet production-ready. Testing and feedback welcome.

## Prerequisites
- NixOS 25.11
- Flakes enabled (`experimental-features = nix-command flakes`)
- Understanding of NixOS module system

## Getting Started With Ash-Config
### With an existing flake-based NixOS installation:
```
$ nix shell nixpkgs#git
$ cd /path/to/config/dir
$ git clone https://github.com/rhbollinger1s/Ash-Config
$ mkdir ./Hosts/Local/NewHostnameHere
$ cp -r ./Hosts/TemplateHosts/Basic ./Hosts/Local/YourNewHostName
$ nano ./Hosts/Local/YourNewHostName/configuration.nix #Change the hostname
$ nano ./flake.nix #Make new config with provided boilerplate for new hostname
$ cd ./Hosts/Local/YourNewHostnameHere
$ sudo nixos-generate-config --dir .
$ sudo nixos-rebuild boot --flake .#YourNewHostName
$ sudo reboot
$ nix shell nixpkgs#fastfetch -c fastfetch
```

### New NixOS installation:
Instructions Coming Soon

### Quick test:
```
$ sudo nixos-rebuild boot --flake github:rhbollinger1s/Ash-Config#ash-Basic
```

## Project Organization
### Config does not yet match structure shown here, currently fixing as time goes on.
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

## Usage
First, follow the installation guide. Note that in the Hosts directory, there are 3 subfolders. TemplateHosts are supposed to be copied or tested from. Local is where you put your own custom configs. Rhbollinger1sHosts are the configs for the author's hosts, here for your reference. You build from the flake, telling it your hostname. It looks for your host's config file, which pulls in the modules you need, any per-host settings like hostname or locales, and pulls in modules you need.

## Contributing
Contributions welcome! When adding modules:
- Keep them focused and minimal (KISS principle)
- Test thoroughly before submitting
- Never commit files from `./Hosts/Local/` (user-specific configs)
- Submit PRs against the `main` branch

## AI Policy
### What AI may not be used for:
- Writing documentation
- Writing code
- Writing bug fixes
- Writing issues

### What AI may be used for:
- Writing commit messages
- Finding bugs (Provide error messages to AI. Nix errors are notoriously difficult to decipher, so we permit AI assistance for debugging.)

## Licensing
"This project is under the Apache 2.0 license."
