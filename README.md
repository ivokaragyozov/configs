# Requirements

1. Install [kitty](https://sw.kovidgoyal.net/kitty/):
   ```bash
   brew install kitty
   ```
2. Install [fish](https://fishshell.com/):
   ```bash
   brew install fish
   ```
3. Install [neovim](https://neovim.io/):
   ```bash
   brew install neovim
   ```
4. Install [tmux](https://github.com/tmux/tmux/wiki):
   - Install tmux
     ```bash
     brew install tmux
     ```
   - Install [tpm](https://github.com/tmux-plugins/tpm) which will allow for plugins to be installed
     ```bash
     git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
     ```

# Installation

1. Clone the repo into your desired configs folder:
   ```bash
   git clone https://github.com/ivokaragyozov/configs.git ~/.config
   ```
2. Set fish as your login shell:
   - Add fish to `/etc/shells` with:
     ```bash
     echo /usr/local/bin/fish | sudo tee -a /etc/shells
     ```
   - Change your default shell with:
     ```bash
     chsh -s /usr/local/bin/fish
     ```
3. Enter a tmux session:
   - Source the tmux.conf file:
     ```bash
     tmux source ~/.config/tmux/tmux.conf
     ```
   - Press <kbd>Ctrl-A</kbd> + <kbd>I</kbd> to install the plugins.
4. Open neovim, it will install its plugins automatically.
