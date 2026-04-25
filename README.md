用 [chezmoi](https://github.com/twpayne/chezmoi) 管理的 [dotfiles](https://wiki.archlinux.org/title/Dotfiles)

fastfetch

```fastfetch
OS: Arch Linux x86_64
Shell: zsh 5.9
WM: niri 25.11 (Wayland)
Font: 0xProto Nerd Font Mono (10pt) [GTK2/3/4]
Cursor: Sweet (24px)
Terminal: tmux 3.6a
```

## install

### packages

> 命令行工具参考：
>
> - [Core utilities](https://wiki.archlinux.org/title/Core_utilities)
> - [Modern Unix](https://github.com/ibraheemdev/modern-unix)

```bash
paru -S --needed --noconfirm git vim curl wget \
    nvim eza git-delta bat btop duf dust gdu tldr \
    fd jq ripgrep ripgrep-all fzf zoxide \
    chezmoi \
    zsh zimfw tmux\
    fcitx5-rime rime-ice-git fcitx5-configtool \
    uv
```

字体

```bash
paru -S --needed --noconfirm \
    ttf-0xproto-nerd ttf-jetbrains-mono-nerd \
    noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
```

> niri
> 
> 参考 [Getting Startted](https://niri-wm.github.io/niri/Getting-Started.html)

```bash
paru -S --needed --noconfirm \
    niri xwayland-satellite \
    xdg-desktop-portal-gnome xdg-desktop-portal-gtk \
    gnome-keyring libsecret \
    alacritty fuzzel swaylock \
    matugen cava qt6-multimedia-ffmpeg \
    libnotify mako polkit-gnome \
    waybar ttf-jetbrains-mono-nerd otf-font-awesome \
    qt6ct breeze breeze-icons gnome-themes-extra
```

### init

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

### niri

- 需要手动创建一下 `~/.config/niri/local-config.kdl`，即使没有要写的配置

  因为在 niri 的 `config.kdl` 中 include 了 `local-config.kdl`，用来存放机器相关的配置，而 niri 要到下个版本才能支持 [可选 include](https://niri-wm.github.io/niri/Configuration%3A-Include.html#optional-includes)

- 关于 dolphin 的深色模式，需要先启动 qt6ct，配置 color theme 为深色模式的主题
