{ pkgs, ... }: {
  home = {
    pointerCursor = {
      package = pkgs.catppuccin-cursors.frappePink;
      name = "Catppuccin-cursors-frappe-pink";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
