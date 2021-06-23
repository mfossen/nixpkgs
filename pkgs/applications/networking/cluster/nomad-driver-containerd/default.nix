{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "nomad-driver-containerd";
  version = "0.8";

  src = fetchFromGitHub {
    owner = "roblox";
    repo = pname;
    rev = "v${version}";
    sha256 = "089a3pbllw3kcpg2wqb5zfyr5kgl0i0vp470zihwn7hc63r26s1j";
  };

  #vendorSha256 = "sha256-thvrocVno6jz4vqedrU1vYXFyHjiFBh/ZJUfouKzo4k=";
  vendorSha256 = "sha256-usQBGsDVCmMrIdIFOLtYyAJ936SSd8FwK/7hICWWmMY=";

  #runVend = true;

  subPackages = [ "." ];

  # some tests require a running podman service
  doCheck = false;

  meta = with lib; {
    homepage = "https://www.github.com/hashicorp/nomad-driver-podman";
    description = "Podman task driver for Nomad";
    platforms = platforms.unix;
    license = licenses.mpl20;
    maintainers = with maintainers; [ cpcloud ];
  };
}
