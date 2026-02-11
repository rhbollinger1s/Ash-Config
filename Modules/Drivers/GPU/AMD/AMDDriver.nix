{ config, pkgs, ... }: {
# ----- [ AMDDriver.nix ] ------------------------------
    imports = [ ];
    hardware.graphics = {
    enable = true;
    enable32Bit = true;
    };
    hardware.amdgpu.opencl.enable = true;
    systemd.tmpfiles.rules =
    let
        rocmEnv = pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with pkgs.rocmPackages; [
            rocblas
            hipblas
            clr
        ];
        };
    in [
        "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
    ];
    services.lact.enable = true;
}
