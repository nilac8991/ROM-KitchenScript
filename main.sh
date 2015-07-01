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

ROM

function PREREPOINIT () {

	cd
	clear
	echo -e ">> Initializing Pre Repo stuff.."
	tput setaf 2
	mkdir -p ~/bin
	PATH=~/bin:$PATH
	if [ -f "repo" ]; then
		tput setaf 3
		echo -e "Skipping cause repo is already initialized.."

	else
		tput setaf 2
		curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
		chmod a+x ~/bin/repo
		echo -e ""
		sleep 1
	fi

	echo -e ">> Github part!"
	sleep 2
	echo -e "Please enter your email for Git config : \c"
	tput setaf 2
	read gitemail
	git config --global user.email $gitemail
	sleep 2
	tput setaf 3
	echo -e "Please enter your name for Git config : \c"
	tput setaf 2
	read gituser
	git config --global user.name $gituser
	tput setaf 3
	echo -e ""
	echo -e "Github part done"
	sleep 2
	echo -e ">>	Going to install post dependencies if they are necessary..."
	sleep 2
		echo "Checking and installing Post-Dependencies for the build environment"
		echo "This step is automatically skipped if there already installed"

		tput setaf 2
		echo "Insert your password:"

			sudo apt-get update
			sudo apt-get install openjdk-7-jdk -y
			sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-6-jre openjdk-6-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib -y
			sleep 2
}

function REPOINIT () {

		echo -e "Note."
		echo -e "All the REPOs are initialized in the User home folder"
		echo -e "If for any reason you want to change the path do it before repo syncing the sources"
		sleep 2
		echo -e "In order to continue, i need to know if it's the first time you build a ROM for a device"
		echo -e "Inser yes or no"
		read askfirsttime
		if [[ $askfirsttime = "Yes" || $askfirsttime = "yes" || $askfirsttime = "YES"]]; then
			echo -e "Before to continue with the REPO initialization a pre sequence will be launched in a few seconds"
			sleep 4
			PREREPOINIT
		else
			echo -e "Skipping pre repo init sequence.."
		fi

		if (test $romchoose = "CyanogenMod"); then
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"

			#CODE....

		fi

		if (test $romchoose = "SlimRoms"); then
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"

			#CODE....

		fi

		if (test $romchoose = "BlissPop"); then
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"

			#CODE....

		fi

		if (test $romchoose = "CarbonROM"); then
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"

			#CODE....

		fi
}
