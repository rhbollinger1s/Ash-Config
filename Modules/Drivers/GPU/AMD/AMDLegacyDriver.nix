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
    boot.kernelParams = [
    # For Southern Islands (SI i.e. GCN 1) cards
    "amdgpu.si_support=1"
    "radeon.si_support=0"
    # For Sea Islands (CIK i.e. GCN 2) cards
    "amdgpu.cik_support=1"
    "radeon.cik_support=0"
];
}
