{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self, flake-utils, nixpkgs
  }: flake-utils.lib.eachSystem ["x86_64-linux"] (system:
  let pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        omnisharp-roslyn
        dotnet-sdk_8
        mysql-workbench
      ];
    };
  });
}
