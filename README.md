# K7 Minimalist Zsh theme

This is a minimalist Zsh theme that displays the current directory, Git branch, last command status and Python virtual environment, along with some useful icons and colors.
Inspired by [Powerlevel10k](https://github.com/romkatv/powerlevel10k) and created with the minimal set of features that I need.

## Features

### Left prompt

| Segment | Description |
| --- | --- |
| Current directory | Folder icon followed by the working directory, with `$HOME` abbreviated to `~` (blue). |
| Git branch | Branch icon followed by the current branch name, or the short commit hash on a detached HEAD, shown only inside a Git repository (red). |

### Right prompt

| Segment | Description |
| --- | --- |
| Last command status | Green check mark if the last command succeeded, red cross if it failed. |
| Python virtual environment | Python icon, project name (the folder containing the venv) and Python version, shown only when a venv is active (blue). The version is read from the venv's `pyvenv.cfg`, so no Python process is started on every prompt. |

The theme sets `VIRTUAL_ENV_DISABLE_PROMPT=1`, so activating a venv does not prepend its own `(venv)` tag to the prompt.

### Key bindings

The theme enables Emacs-style line editing (`bindkey -e`) by default. To use vi mode instead, set `K7_KEYMAP` before sourcing the theme:

```bash
export K7_KEYMAP=vi
source /path/to/K7/K7.zsh-theme
```

The following bindings are added in both modes (in vi mode, the navigation keys work in insert and command mode, the editing keys in insert mode only):

| Keys | Action |
| --- | --- |
| `Home` / `End` | Move to the beginning / end of the line |
| `Delete` | Delete the character under the cursor |
| `Ctrl+Left` / `Ctrl+Right` | Move one word backward / forward |
| `Up` / `Down` | Search history for commands starting with what is already typed |
| `Ctrl+Backspace` / `Ctrl+Delete` | Delete the previous / next word |
| `Ctrl+U` | Clear the whole line |

## Install Zsh

First, make sure that you have Zsh installed, and set it as your default shell.

On Fedora:

```bash
sudo dnf install zsh

chsh -s $(which zsh)
```

On Debian:

```bash
sudo apt install zsh

chsh -s $(which zsh)
```

## Install a Nerd Font

You need a Nerd Font to display the icons properly. You can download one from [Nerd Fonts](https://www.nerdfonts.com/).

I use [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip).

Install the fonts and set them as default on the terminal.

## Add to the Zsh configuration

Clone the repository and source the `K7.zsh-theme` file in your `.zshrc`.

```bash
git clone https://github.com/brunozc/K7.git

echo 'source /path/to/K7/K7.zsh-theme' >> ~/.zshrc
```
Replace `/path/to/K7/` with the actual path where you cloned the repository.
Then, restart your terminal or source your `.zshrc`:

```bash
source ~/.zshrc
```
Now you should see the new prompt with icons and colors.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.