[GUIDE here!](https://github.com/conghuyyy/zsh-conghuy-plugin-updater/blob/main/GUIDE.md)

# Installation

## Oh My Zsh

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone https://github.com/conghuyyy/zsh-conghuy-dev-utilities.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-conghuy-dev-utilities
    ```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

    ```sh
    plugins=( 
        # other plugins...
        zsh-conghuy-dev-utilities
    )
    ```

3. Start a new terminal session.

## Manual (Git Clone)

1. Clone this repository somewhere on your machine. This guide will assume `~/.zsh/zsh-conghuy-dev-utilities`.

    ```sh
    git clone https://github.com/conghuyyy/zsh-conghuy-dev-utilities.git ~/.zsh/zsh-conghuy-dev-utilities
    ```

2. Add the following to your `.zshrc`:

    ```sh
    source ~/.zsh/zsh-conghuy-dev-utilities
    ```

3. Start a new terminal session.