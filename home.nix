{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tooeasy2do";
  home.homeDirectory = "/home/tooeasy2do";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true; 
  home.packages = with pkgs; [
	git
    krita
    gimp
    inkscape
    aseprite-unfree
    obs-studio
    brave
    godot
	git
    vlc
    kdenlive
    # Programming
    python311
    direnv
    # Gaming stuff
    lutris
    wine
    steam
    discord
    # Terminal stuff
    starship # Prompt I like
    zsh # Shell replacement
    zoxide # smarter cd command
  ];
  programs.zsh = {
    enable = true;
    shellAliases = {
            home-switch = "home-manager switch";
            nixos-switch = "nixos-rebuild switch";
            home-config = "nvim .config/nixpkgs/home.nix";
            nixos-config = "sudo nvim /etc/nixos/configuration.nix";
        };
    enableAutosuggestions = true;
    enableCompletion = true;
    history.extended = true;
    oh-my-zsh = {
            enable = true;
            plugins = ["colored-man-pages" "zoxide" "command-not-found"];
        };
    initExtra = ''
        export TERM="xterm-256color"
        eval "$(starship init zsh)"
        eval "$(direnv hook zsh)"
    '';
      }; 
  # Makes neovim read lua config 
  	programs.neovim.extraConfig = ''
    luafile $NIXOS_CONFIG_DIR/config/nvim/init.lua
  '';
}
