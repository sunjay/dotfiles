##########################################################
# Basic Installation Script
# * Links dotfiles into their corresponding locations
#   * home/ -> ~ or $HOME
##########################################################

symlinkDotfiles() {
    if [-z "$1"] then
        echo "Usage: symlinkDotfiles(from, to)"
        exit -1
    fi

    if [-z "$2"] then
        echo "Usage: symlinkDotfiles(from, to)"
        exit -1
    fi

}

# Symlink home/ files



