{ config, pkgs, ... }: {
# ----- [ FlightSim ] ------------------------------
    imports = [ ];
       environment.systemPackages = with pkgs; [
            flightgear
       ];
}
