dotfiles
========
Personal configuration files for various packages.

```
git clone https://github.com/tjeastman/dotfiles.git
```

Make symlinks:
```
ln -s dotfiles/emacs.d .emacs.d
ln -s dotfiles/zsh .zsh
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/octaverc .octaverc
ln -s dotfiles/screenrc .screenrc
ln -s dotfiles/sqliterc .sqliterc
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/Xdefaults .Xdefaults
ln -s dotfiles/aspell.en.pws .aspell.en.pws
```

Add name and email to the `.gitconfig.user` file.

This file may be needed to set up rxvt on some hosts:
```
infocmp rxvt-unicode-256color > rxvt-unicode-256color.ti
tic rxvt-unicode-256color.ti
```

Set up gnome-terminal:
```
dconf dump /org/gnome/terminal/legacy/profiles:/ > backup
dconf reset -f /org/gnome/terminal/legacy/profiles:/
sh gnome-terminal/install.sh zenburn gnome-terminal/settings.txt
dconf load /org/gnome/terminal/legacy/profiles:/ < backup
```