{ pkgs, inputs, ... }:
{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home = {
    username = "scorsi";
    homeDirectory = "/home/scorsi";
  };

  programs.git = {
    enable = true;
    userName = "scorsi";
    userEmail = "8389441+scorsi@users.noreply.github.com";
    signing.key = "D76B05A9BADC84CF";
    signing.signByDefault = true;
    ignores = [ "*~" ".#*" "\\#*#" ];
    extraConfig = {
      tag.gpgSign = true;
      init.defaultBranch = "main";
    };
  };

  home.persistence."/persist/home/scorsi" = {
    directories = [
      "Download"
      "Documents"

      ".ssh"
      ".gnupg"
    ];
    #files = [
    #];
    allowOther = true;
  };

  home.stateVersion = "23.11";
}
