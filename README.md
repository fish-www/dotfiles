用 [chezmoi](https://github.com/twpayne/chezmoi) 管理的 [dotfiles](https://wiki.archlinux.org/title/Dotfiles)

fastfetch

```fastfetch
OS: Arch Linux x86_64
Shell: zsh 5.9
DE: KDE Plasma 6.5.5
WM: KWin (Wayland)
WM Theme: Sweet-Mars
Theme: Breeze (SweetAmbarBlue) [Qt], Breeze-Dark [GTK2], Breeze [GTK3]
Icons: candy-icons [Qt], candy-icons [GTK2/3/4]
Font: JetBrainsMonoNL Nerd Font Mono (10pt) [Qt], JetBrainsMonoNL Nerd Font Mono (10pt) [GTK2/3/4]
Cursor: Sweet (24px)
Terminal: konsole 25.12.1
Terminal Font: JetBrainsMonoNL Nerd Font Mono (10pt)
```

## install

建议安装

```bash
yay -S --needed --noconfirm git vim curl wget \
    nvim eza git-delta \
    chezmoi \
    zsh zimfw \
    fcitx5-rime rime-ice-git \
    uv
```

其他，按需安装

```bash
# https://github.com/sdkman/sdkman-cli
curl -s https://get.sdkman.io | bash
```

使用 chezmoi 同步 dotfiles

> [Use a hosted repo to manage your dotfiles across multiple machines](https://www.chezmoi.io/user-guide/setup/#use-a-hosted-repo-to-manage-your-dotfiles-across-multiple-machines)

```bash
# 检出
chezmoi init https://github.com/fish-www/dotfiles.git

# 检查变更
chezmoi diff

# 应用变更
chezmoi apply
```

## usage

### chezmoi config

使用了 [chezmoi format tmpl](https://www.chezmoi.io/reference/special-files/chezmoi-format-tmpl/) 来生成 chezmoi 的 [配置文件](https://www.chezmoi.io/reference/configuration-file/#__tabbed_1_3)

在 `chezmoi init` 时会询问一些问题来生成配置文件，之后可以修改 `~/.config/chezmoi/chezmoi.toml` 来调整配置

### ssh

- 在 `~/.ssh/config` 中使用了 `Include` 来包含 `~/.ssh/config.d/*` 中的配置文件，可在此目录中添加本地的 ssh 配置

- 使用 `~/.ssh/id_github` 来存储 GitHub 的 SSH 密钥，可通过 `ssh-keygen` 来生成，并配置到 github 上

    ```bash
    ssh-keygen -t ed25519 -f ~/.ssh/id_github -C "your comment"
    ```

### git

- 配置统一存放在 `~/.config/git/config` 中，使用了 `Include` 来包含 `~/.config/git/config_local` 配置文件，可在此文件中添加本地的 git 配置（为什么 git 的 Include 不支持通配符 :sob:）