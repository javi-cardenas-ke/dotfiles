# MacOS Development Setup
This document has been updated for macOS 26. You can download the repo on a new device as a ZIP to get started.

```sh
just setup # install packages and link dotfiles after clone
```

## Homebrew

Install [Homebrew](https://brew.sh/), the missing package manager for macOS and make sure to add Homebrew to your PATH.

```sh
brew --version # verify installation
```

### Brewfile

A [Brewfile](https://docs.brew.sh/Brew-Bundle-and-Brewfile) is a single configuration file that lists all your Homebrew packages and applications, letting you set up new machines with one command.

```sh
just brew
```

`brew` installs CLI tools to `/usr/local/bin` and `cask` installs GUI applications to `/Applications`

## GitHub

Create a [SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add it to your [GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account), then clone this repository.

```sh
ssh-keygen -t ed25519 -C "85462046+javi-cardenas@users.noreply.github.com" # creates a SSH key
pbcopy < ~/.ssh/id_ed25519.pub # copies the SSH key to your clipboard

ssh -T git@github.com # verify SSH connection
git clone git@github.com:javi-cardenas/dotfiles.git
```

## Stow

[GNU Stow](https://www.gnu.org/software/stow/) creates symlinks from this repository to dotfiles in your home directory.

```sh
just stow # create symlinks
just unstow # remove symlinks
```

## MacOS

### Finder

```sh
just finder
```

In Finder, use `cmd + shift + h` to take you to the Home folder and then drag it to the sidebar.

### Raycast

[Raycast](https://raycast.com/) is a Spotlight replacement for macOS. Turn the Spotlight hotkey off, remap `cmd + space` to Raycast, and create hotkeys for window management.

- Settings -> Keyboard -> Keyboard Shortcuts -> Spotlight -> Show Spotlight search -> Off

- Raycast -> Settings -> Extensions -> Window Management

### Security

- Filevault: Privacy & Security -> Filevault -> Turn On (Encrypts SSD)

- Firewall: Network -> Firewall -> On

- Rename local hostname: General -> Sharing -> Local hostname -> Edit. Make sure all file sharing is also disabled.

- Locked screen: Notifications -> Allow notifications when the screen is locked -> Off

### Storage

- General -> Storage -> Empty Trash automatically

### Keyboard

- Key repeat rate -> Fast

- Delay until repeat -> Short
