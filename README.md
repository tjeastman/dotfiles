dotfiles
========
Personal configuration files for various packages.

```
git clone https://github.com/tjeastman/dotfiles.git
```

Make symlinks:
```
ln -s dotfiles/zsh .zsh
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/octaverc .octaverc
ln -s dotfiles/screenrc .screenrc
ln -s dotfiles/sqliterc .sqliterc
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gitignore.global .gitignore.global
ln -s dotfiles/Xdefaults .Xdefaults
ln -s dotfiles/aspell.en.pws .aspell.en.pws
ln -s dotfiles/pylintrc .pylintrc
ln -s dotfiles/profile .profile
ln -s dotfiles/ctags .ctags
ln -s dotfiles/ansible.cfg .ansible.cfg
ln -s dotfiles/avrduderc .avrduderc
ln -s dotfiles/python/contrib/pyenv .pyenv
```

Install some Python packages:
```
pip install -r requirements.txt --user
```

Add name and email to the `.gitconfig.user` file.
