{ lib, stdenv, makeWrapper, fetchFromGitHub, pandoc }:

stdenv.mkDerivation rec {
  pname = "bic";
  version = "1.0.0-alpha.2";

  src = fetchFromGitHub {
    owner = "Pinjasaur";
    repo = pname;
    rev = "v${version}";
    sha256 = "0p7anp82qcfsdwb93mn3w9fyz0kfqz0f3cc68a1jfsb680l2dj81";
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ pandoc ];

  dontStrip = true;
  buildPhase = "true";

  installPhase = ''
    mkdir -p $out/share
    cp -r bic lib .env $out/share

    makeWrapper $out/share/bic $out/bin/bic \
      --prefix PATH : ${lib.makeBinPath [ pandoc ]} \
  '';

  meta = with lib; {
    description = "Opinionated minimal static site generator in a single Bash script";
    homepage = "https://bic.sh/";
    license = licenses.mit;
    maintainers = with maintainers; [ mfossen ];
  };
}
