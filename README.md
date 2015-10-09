# dotfiles
My dotfiles

## Installation
Use `./install.sh` from the root directory of this repository to automatically link dotfiles in the correct locations.

You may need to make the file executable first using `chmod 755 install.sh`.

## Adding files
The install script automatically symlinks files to the correct location based on the folder in which they are placed in this repository.

* Files placed in `home/` are automatically moved to `~` or `$HOME`

**IMPORTANT: Files in this repository should NOT have the `.` prefix.** That will be added automatically when the files are symlinked. So to add a `.vimrc` file to `~`, place a file called `vimrc` in the `home/` directory in this repository.

