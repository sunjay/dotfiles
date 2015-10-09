##########################################################
# 
# Basic Installation Script
# * Links dotfiles into their corresponding locations
#   * home/ -> ~ or $HOME
# 
##########################################################

symlinkDotfiles() {
    if [ -z "$1" ]; then
        echo "Usage: symlinkDotfiles(from, to)"
        exit -1
    fi

    if [ -z "$2" ]; then
        echo "Usage: symlinkDotfiles(from, to)"
        exit -1
    fi

    from=$(readlink -f $1)
    to=$(readlink -f $2)

    echo "Copying dotfiles from $from to $to"
    echo

    files=$(ls $from)
    for file in $files; do
        echo "Backing up any existing file with a .old extension"
        mv $to/.$file $to/.$file.old

        echo "Creating symlink to $from/$file in $to/.$file"
        ln -s $from/$file $to/.$file
    done
}

# Symlink home/ files
symlinkDotfiles "home" ${HOME-~}


