# NixOS config namnam

My nixos config. Has hyprland installed. Waybar. else.

Please read notes. Or else you can make it so so bad. I leaved some comments to understand where to change values.

# !! NOTE !!

By downloading this, you can be unsatisfied by the results as im a bad user so... its up to you now. (please dont (not rn))

Make a fork of this repository to make your own files. So that reproducing is easy!

## Partitioning

This flake uses disko and you HAVE to make sure everything is correct to avoid losing data.

before install:

```
    ./disko.nix
        left comments around the file. look up some examples if you want to.
```

## User configuration.

As I've made it as easy to install the configuration as I ever could comprehend. Some parts have to be set up manually. Like users.

Change user:

```
   ./nixos/modules/users.nix
        at users.users.nam change the name from nam to anything you want.
        you can also change other settings.
```

    ```
    ./home-manager/home.nix
    home.username
    home.homeDirectory
    should be changed to preffered.
    ```
    ```
    ./flake.nix
    at homeConfigurations.nam <<< change here to your username
    ```

    ```
    at install (sh scripts)
    You will be prompted for a username. That is required to create flake directory /home/user/nix .
    Please enter the username that is set in the other files.
