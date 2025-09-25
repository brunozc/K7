# Minimalist Zsh theme for me

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


# Add to the Zsh configuration

Clone the repository and source the `K7.zsh` file in your `.zshrc`.

```bash
git clone https://github.com/brunozc/K7.git

echo 'source /path/to/K7/K7.zsh' >> ~/.zshrc
```
Replace `/path/to/K7/` with the actual path where you cloned the repository.
Then, restart your terminal or source your `.zshrc`:

```bash
source ~/.zshrc
```
Now you should see the new prompt with icons and colors.


# License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.