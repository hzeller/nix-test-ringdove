# nixpks checked out at feature-20241019-ringdove
{ pkgs ? import /home/hzeller/src/my/nixpkgs {} }:
let
  local-librnd = pkgs.librnd.override {
    withGtk2 = true;
    withGtk4 = false;

    UnstableRevision = 37499;
    UnstableHash = "sha256-aJuJhrj2/g61j4/IewKtp2EEEv4XSmApdylslue3Q2k=";
  };

  local-pcb-rnd = pkgs.pcb-rnd.override {
    librnd = local-librnd;
    UnstableRevision = 39593;
    UnstableHash = "sha256-tDz/MA2P2ASC30VEbuA7CrMrsxrjs9I37J6qKRGzVL0=";
  };

  local-sch-rnd = pkgs.sch-rnd.override {
    librnd = local-librnd;
    UnstableRevision = 10829;
    UnstableHash = "sha256-oZ5UO+eRgx5/qDBf/3WahNsyW+UAQ8ZO/YtpDNFkZvA=";
  };

  local-camv-rnd = pkgs.camv-rnd.override {
    librnd = local-librnd;
    UnstableRevision = 916;
    UnstableHash = "sha256-jEPjyEZjbXYrhcB+MtuMH2jf/a9D0e4DHbpg37OcHvo=";
  };
in
pkgs.mkShell {
  buildInputs = with pkgs;
    [
      local-pcb-rnd
      local-sch-rnd
      local-camv-rnd

      gerbv
    ];

  shellHook = ''
  '';
}
