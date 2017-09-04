Dotfiles
========

My Linux dotfiles and .desktop files, to be managed by GNU stow.

To add a program's symlinks, use `stow -t ~/ FOLDER_NAME`

Folders in the `scripts` directory should be added to `/usr/local/bin`, using the command `stow -t /usr/local/bin/ FOLDER_NAME`.

Aliases for these two `stow` commands, `dotfile` and `dotscript` are in `bash/.bash_aliases`.
