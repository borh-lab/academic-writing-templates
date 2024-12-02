{ pkgs, ... }:
{
  # https://devenv.sh/basics/
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    fswatch
    typst
    source-han-serif
    source-han-sans
  ];

  # https://devenv.sh/scripts/
  scripts.compile-thesis.exec = "${pkgs.bash}/bin/bash make.sh thesis";

  enterShell = ''
    git --version
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.shellcheck.enable = true;
  pre-commit.hooks.shfmt.enable = true;
  pre-commit.hooks.markdownlint.enable = true;

  # https://devenv.sh/processes/
  processes.watch.exec = "${pkgs.bash}/bin/bash watch.sh";

  # See full reference at https://devenv.sh/reference/options/
}
