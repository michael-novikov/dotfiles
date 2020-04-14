
##
# Your previous /Users/mnovikov/.bash_profile file was backed up as /Users/mnovikov/.bash_profile.macports-saved_2018-04-19_at_00:51:14
##

# MacPorts Installer addition on 2018-04-19_at_00:51:14: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=~/bin:$PATH

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export PATH=/Users/mnovikov/Library/Python/3.7/bin:$PATH

# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

