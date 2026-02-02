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
    chezmoi
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
