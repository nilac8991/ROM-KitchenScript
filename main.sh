#!/bin/bash

# Copyright (C) 2015 Călin Neamţu (nilac8991)

# NOTE.
# This script is intended to be written in this way
# Don't try to modify this on your own cause you may end by mess up the entire script
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
	orange='tput setaf 3'           # Yellow
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
}

function Details () {

	echo -e "			Script started at: $Date"
	echo -e "			Developer: $User"
	echo -e "			HOST: $Computer"
	if [[ -n $romchoose ]];then
		echo -e "			Script is running in a $romchoose source dir	"
		echo -e "           Script configuration: $mode "
elif [[ -f "kitchenscript_CyanogenMod.txt" || -f "kitchenscript_BlissPop.txt" || -f "kitchenscript_SlimRoms.txt" || -f "kitchenscript_CarbonROM" ]]; then
		if [ -f "kitchenscript_CyanogenMod.txt" ]; then
			echo -e "			Script is running in a CyanogenMod source dir	"
		elif [ -f "kitchenscript_CarbonROM.txt" ]; then
			echo -e "			Script is running in a CarbonROM source dir	"
		elif [ -f "kitchenscript_SlimRoms.txt" ]; then
			echo -e "			Script is running in a SlimROM source dir	"
		elif [ -f "kitchenscript_BlissPop.txt" ]; then
			echo -e "			Script is running in a BlissPop source dir	"
		fi
	else
	echo -e ""
	fi

}

#while [[ true ]]; do
	KITCHENSPLASH
	Details
#done

function PREREPOINIT () {

	cd
	clear
	KITCHENSPLASH
	sleep 2
	echo -e ""
	echo -e ""
	$blue
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

	sleep 2
	clear
	$blue
	echo -e ">> Github part!"
	sleep 2
	$orange
	echo -e "Please enter your email for Git config : \c"
	$green
	read gitemail
	git config --global user.email $gitemail
	sleep 2
	$orange
	echo -e "Please enter your name for Git config : \c"
	tput setaf 2
	$green
	read gituser
	git config --global user.name $gituser
	tput setaf 3
	echo -e ""
	echo -e "Github part done"
	sleep 2
	echo -e ">>	Going to install post dependencies if they are necessary..."
	sleep 2
	echo -e ""
		echo "Checking and installing Post-Dependencies for the build environment"
		echo "This step is automatically skipped if there already installed"
	sleep 4

		$orange
		echo "Insert your password:"
		$blue
			sudo apt-get update
			sudo apt-get install openjdk-7-jdk -y
			sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-6-jre openjdk-6-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib -y
			sleep 2
}

function REPOINIT () {

		clear
		KITCHENSPLASH
		echo -e ""
		echo -e ""
		$orange
		echo -e "Note."
		echo -e "All the REPOs are initialized in the User home folder"
		echo -e "If for any reason you want to change the path do it before repo syncing the sources"
		echo -e ""
		echo -e ""
		sleep 2
		echo -e "In order to continue, i need to know if it's the first time you build a ROM from this computer"
		echo -e "Insert yes or no"
		$green
		read askfirsttime
		if [[ $askfirsttime = "Yes" || $askfirsttime = "yes" || $askfirsttime = "YES" ]]; then
			echo -e "Before to continue with the REPO initialization a pre sequence will be launched in a few seconds"
			sleep 4
			PREREPOINIT
			sleep 2
		else
			$green
			echo -e "Skipping pre repo init sequence.."
			sleep 2
		fi

		if (test $romchoose = "CyanogenMod"); then
			clear
			$blue
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"
			sleep 2

			tput setaf 3
			echo -e "Insert here the name of the directory which will be used for the CyanogenMod Sources"
			tput setaf 2
			read romdir
			tput setaf 3
			mkdir -p $romdir
			echo -e ">> Going to repo init the sources in the $romdir directory"
			cd $romdir
			sleep 2
			tput setaf 2
			repo init -u git://github.com/CyanogenMod/android.git -b cm-12.1
			echo -e "Repo initialization done"
			echo -e ""
			sleep 2
			clear

		elif (test $romchoose = "SlimRoms"); then
			clear
			$blue
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"

			tput setaf 3
			echo -e "Insert here the name of the directory which will be used for the SlimRoms Sources"
			tput setaf 2
			read romdir
			tput setaf 3
			mkdir -p $romdir
			echo -e ">> Going to repo init the sources in the $romdir directory"
			cd $romdir
			sleep 2
			tput setaf 2
			repo init -u git://github.com/SlimRoms/platform_manifest.git -b lp5.1
			echo -e "Repo initialization done"
			echo -e ""
			sleep 2
			clear

		elif (test $romchoose = "BlissPop"); then
			clear
			$blue
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"

			tput setaf 3
			echo -e "Insert here the name of the directory which will be used for the BlissPop Sources"
			tput setaf 2
			read romdir
			tput setaf 3
			mkdir -p $romdir
			echo -e ">> Going to repo init the sources in the $romdir directory"
			cd $romdir
			sleep 2
			tput setaf 2
			repo init -u https://github.com/TeamBliss-LP/android.git -b lp5.1
			echo -e "Repo initialization done"
			echo -e ""
			sleep 2
			clear

		else
			clear
			$blue
			echo -e "Going to initialize the ROM sources for the $romchoose ROM"

			tput setaf 3
			echo -e "Insert here the name of the directory which will be used for the BlissPop Sources"
			tput setaf 2
			read romdir
			tput setaf 3
			mkdir -p $romdir
			echo -e ">> Going to repo init the sources in the $romdir directory"
			cd $romdir
			sleep 2
			tput setaf 2
			repo init -u https://github.com/CarbonROM/android.git -b lp5.1
			echo -e "Repo initialization done"
			echo -e ""
			sleep 2
			clear

		fi
	echo -e "Do you want to repo sync now ?"
 	echo -e "Insert 1 or 0"
 	sleep 1
 	tput setaf 2
 	read askrepodep
 	if [[ $askrepodep = "1" ]]; then
 		tput setaf 3
 		echo -e ">> Going to repo sync now..."
 		echo -e "Remember this step will take some time according to your internet connection"
 		sleep 3
 		echo -e "Insert the numbers of cpu cores you want to use during the sync (If you don't know just press enter):"
		read cpucores
		if [[ -n $cpucores ]]; then
			repo sync -j$cpucores
		else
			repo sync
		fi
	fi
	tput setaf 3
	echo -e "Done ! The Repo is now initialized, but remember to repo sync the ROM sources"
	echo -e "Script copied to the $romdir directory"
	echo "##THIS IS AN AUTOGENERATED FILE FOR ROM-KITCHENSCRIPT##
	##DON'T TRY TO MODIFY OR DELETE IT## " > kitchenscript_$romchoose.txt
	cd ..
	cp main.sh $romdir
	tput setaf 3
	sleep 3

}

function ROM () {

		clear
		KITCHENSPLASH
		echo -e ""
		echo -e "Welcome! the script detected that it isn't located in any ROM sources dir"
		echo -e "So in order you will need to choose one of the supported ROMs by the script:"
		echo -e "Press any key to continue"
		read blank
		clear
		echo -e ""
		echo -e "CyanogenMod"
		echo -e "SlimRoms"
		echo -e "BlissPop"
		echo -e "CarbonROM"
		echo -e ""
		echo -e "Please insert the ROM name as is stated here or the script won't accept it.."
		$green
		read romchoose

			if [[ $romchoose = "CyanogenMod" || $romchoose = "BlissPop" || $romchoose = "SlimRoms" || $romchoose = "CarbonROM" ]]; then
				$blue
				echo -e "You choosed $romchoose"
				echo -e "Going to redirect you to the Repo initialization part in no time.."
				sleep 3
				REPOINIT

			else
				$blue
				echo -e "Wrong ROM name! Please try again.."
				sleep 2
				echo -e "Choose the ROM name (As stated in the list):"
				$green
				read romchoose
					if [[ $romchoose = "CyanogenMod" || $romchoose = "BlissPop" || $romchoose = "SlimRoms" || $romchoose = "CarbonROM" ]]; then
							$blue
							echo -e "You choosed $romchoose"
							echo -e "Going to redirect you to the Repo initialization part in no time.."
							sleep 3
							REPOINIT
					else
							$blue
							echo -e "You still picked up a wrong ROM name..."
							echo -e "You want to exit?"
							read askexit
							if [[ $askexit = "Yes" || $askexit = "yes" || $askexit = "YES" ]]; then
								exit 0
							else
							echo -e "ROM function going to be launched again..."
							sleep 2
							ROM
							fi
					fi
			fi
}

if [[ -f "kitchenscript_CyanogenMod.txt" || -f "kitchenscript_BlissPop.txt" || -f "kitchenscript_SlimRoms.txt" || -f "kitchenscript_CarbonROM" ]]; then
	echo -e ""
else
	ROM
fi

function CURRENTCONFIG () {
	echo -e " "
	echo -e "  NOTE : Some questions will need to be answered in binary inputs (I you will when.)"
	echo -e "  1 for Yes "
	echo -e "  0 for No "
	echo -e ""
	tput bold
	tput setaf 6
	echo -e "============================================================"
	echo -e ""
	echo -e " Device target and repo configurations"
	echo -e ""
	echo -e " CHERRYPICK = $CHERRYPICK"
	echo -e " REPO_SYNC_BEFORE_BUILD = $REPO_SYNC_BEFORE_BUILD"
	echo -e ""
	echo -e " ROM Build configurations"
	echo -e ""
	echo -e " MAKE_APP   = $MAKE_APP"
	echo -e " MAKE_CLEANINSTAPP = $MAKE_CLEANINSTAPP"
	echo -e " MAKE_CLEAN = $MAKE_CLEAN"
	echo -e " MAKE_DIRTY = $MAKE_DIRTY"
	echo -e ""
	echo -e "============================================================"
	echo -e ""
	tput sgr0
	tput setaf 2
	if [[ $MAKE_CLEAN != "0" || $REPO_SYNC_BEFORE_BUILD != "1" || $CHERRYPICK != "0" || $MAKE_DIRTY != "1" || $MAKE_APP != "0" || $MAKE_CLEANINSTAPP != "0" ]]; then
		echo -e ""
		mode=Custom
	else
		mode=Default
	fi
}
