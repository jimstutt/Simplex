{ mkDerivation, base, containers, stdenv, transformers }:
mkDerivation {
  pname = "SimplexLib";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  executableHaskellDepends = [ base containers transformers ];
  license = stdenv.lib.licenses.bsd3;
}
