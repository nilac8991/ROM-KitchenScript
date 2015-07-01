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

	#Declare System variables
	Date=$(date)
	Computer=$(hostname)
	User=$USER

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
echo -e ""
echo -e "			Script started at: $Date"
echo -e "			Developer: $User"
echo -e "			HOST: $Computer"
if [[ -n $romchoose ]];then
echo -e "			Script is running in a $romchoose source dir	"
else
echo -e ""
fi
}

	# Need here to include the control to see if the file exists in order to launch ROM or not
	# For now ROM will be launched always

#while [[ true ]]; do
	KITCHENSPLASH
#done

function ROM () {


		echo -e "Welcome! the script detected that it isn't situated in any ROM sources dir"
		echo -e "So in order you will need to choose one of the supported ROMs by the script:"
		echo -e "CyanogenMod"
		echo -e "SlimRoms"
		echo -e "BlissPop"
		echo -e "CarbonROM"
		echo -e "Please insert the ROM name as is stated here or the script won't accept it.."
		read romchoose

			if [[ $romchoose = "CyanogenMod" || $romchoose = "BlissPop" || $romchoose = "SlimRoms" || $romchoose = "CarbonROM" ]]; then
				echo -e "You choosed $romchoose"
				echo -e "Going to redirect you to the Repo initialization part in now time.."
				sleep 2
				#REPO INIT function

			else

				echo -e "Wrong ROM name! Please try again.."
				sleep 2
				echo -e "Choose the ROM name (As stated in the list):"
				read romchoose
					if [[ $romchoose = "CyanogenMod" || $romchoose = "BlissPop" || $romchoose = "SlimRoms" || $romchoose = "CarbonROM" ]]; then
							echo -e "You choosed $romchoose"
							echo -e "Going to redirect you to the Repo initialization part in now time.."
							#REPO INIT function
					else
							echo -e "You still picked up a wrong ROM name..."
							echo -e "You want to exit?"
							read askexit
							if [[ $exit = "Yes" || $exit = "yes" || $exit = "YES" ]]; then
								exit 0
							else
							echo -e "ROM function going to be launched again..."
							fi
					fi
			fi
}
