{ lib, buildPackages, fetchFromGitHub, fetchpatch, perl, buildLinux, ... } @ args:

buildLinux (args // {
  version = "5.12.0-2021.06.21";
  modDirVersion = "5.12.0";

  src = fetchFromGitHub {
    owner = "koverstreet";
    repo = "bcachefs";
    # commit does not exist on any branch on the target repository
    rev = "775b36b4720cd51b4a7f01619a2ed3d092666518";
    sha256 = "sha256-GSzZzvZ0vHjKZhk9WB2Nh3ViUTX0KA2j/bli03PRAmI=";
  };

  extraConfig = "BCACHEFS_FS m";

  extraMeta = {
    branch = "master";
    hydraPlatforms = []; # Should the testing kernels ever be built on Hydra?
    maintainers = with lib.maintainers; [ davidak chiiruno ];
    platforms = [ "x86_64-linux" ];
  };

} // (args.argsOverride or {}))
