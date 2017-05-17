{ mkDerivation, base, containers, stdenv, transformers }:
mkDerivation {
  pname = "LP";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base containers transformers ];
  license = stdenv.lib.licenses.bsd3;
}
