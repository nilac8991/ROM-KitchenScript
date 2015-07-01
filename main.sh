#!/bin/bash

# Copyright (C) 2015 Călin Neamţu (nilac8991)

# NOTE.
# This script is intended to be written in this way
# Don't try to modify this on your own cause you may end by messing all the script up
# If you want features to be addeed or if you are having issues with the script just send me a message:
# On XDA: nilac8991
# Or on email: nilac8991@gmail.com
# I wish you good work and i hope that the script will help you a bit with the repo configuration and with the ROM build


# Don't allow scrollback buffer
echo -e '\0033\0143'
clear

# Built-in script colors
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
blue='tput setaf 4'             # Blue
magenta='tput setaf 5'          # Magenta
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld='tput bold '             # Bold
txtundrline='tput smul '				# Underline
normal='tput sgr0'


function KITCHENSPLASH () {

	$blue

echo -e "	__________ ________      _____ "
echo -e "	\______   \\_____  \    /     \  "
echo -e "	 |       _/ /   |   \  /  \ /  \  "
echo -e "	 |    |   \/    |    \/    Y    \ "
echo -e "	 |____|_  /\_______  /\____|__  / "
echo -e "	        \/         \/         \/  "
echo -e ""
echo -e "	    ____  __.__  __         .__  "
echo -e "	    |    |/ _|__|/  |_  ____ |  |__   ____   ____  "
echo -e "	    |      < |  \   __\/ ___\|  |  \_/ __ \ /    \ "
echo -e "	    |    |  \|  ||  | \  \___|   Y  \  ___/|   |  \ "
echo -e "	    |____|__ \__||__|  \___  >___|  /\___  >___|  / "
echo -e "		    \/             \/     \/     \/     \/  "
echo -e ""
echo -e "	    	    _________            .__        __   "
echo -e "	    	    /   _____/ ___________|__|______/  |_ "
echo -e "	    	    \_____  \_/ ___\_  __ \  \____ \   __\ "
echo -e "	    	    /        \  \___|  | \/  |  |_> >  |  "
echo -e "	    	    /_______  /\___  >__|  |__|   __/|__|  "
echo -e "	    	    	    \/     \/         |__| "
}

#while [[ true ]]; do
	KITCHENSPLASH
#done
