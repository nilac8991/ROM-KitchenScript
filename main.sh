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
	echo -e "			Script configuration: $mode "
	echo -e ""
	echo -e ""
	echo -e "Script is loading...."
	sleep 5
}

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
	$orange
	echo -e " "
	echo -e "  NOTE : Some questions will need to be answered in binary inputs (I will tell you when.)"
	echo -e "  1 for Yes "
	echo -e "  0 for No "
	echo -e ""
	tput bold
	tput sgr0
	echo -e "============================================================"
	echo -e ""
	$blue
	echo -e " Device target and repo configurations"
	echo -e ""
	tput sgr0
	echo -e " CHERRYPICK1 = $CHERRYPICK1"  "for $TARGET_PRODUCT1"
	echo -e " CHERRYPICK2 = $CHERRYPICK2"  "for $TARGET_PRODUCT2"
	echo -e " REPO_SYNC_BEFORE_BUILD = $REPO_SYNC_BEFORE_BUILD"
	echo -e ""
	$blue
	echo -e " ROM Build configurations"
	echo -e ""
	tput sgr0
	echo -e " MAKE_APP   = $MAKE_APP"
	echo -e " MAKE_CLEANINSTAPP = $MAKE_CLEANINSTAPP"
	echo -e " MAKE_CLEAN = $MAKE_CLEAN"
	echo -e " MAKE_DIRTY = $MAKE_DIRTY"
	echo -e ""
	echo -e "============================================================"
	echo -e ""
	tput sgr0
	tput setaf 2
	if [[ $MAKE_CLEAN != "0" || $REPO_SYNC_BEFORE_BUILD != "1" || $CHERRYPICK1 != "0" || $CHERRYPICK2 != "0" || $MAKE_DIRTY != "1" || $MAKE_APP != "0" || $MAKE_CLEANINSTAPP != "0" ]]; then
		echo -e ""
		mode=Custom
	else
		mode=Default
	fi
}

function DISPLAYMAINMENU() {
	clear
	if [[ -n $TARGET_PRODUCT1 || -n $TARGET_PRODUCT2 ]]; then
		echo -e "  *************************************"
		echo -e "	  1 TARGET_PRODUCT: $TARGET_PRODUCT1   "
		echo -e "   2 TARGET_PRODUCT: $TARGET_PRODUCT2  "
		echo -e "  *************************************"
	fi
	CURRENTCONFIG
	echo -e "  1. Sync the ROM Repo"
	echo -e "  2. Configure repo and build parameters"
	echo -e "  2a. Reset All configurations"
		echo -e "  3. Set-up the Target device/s"
		if [[ -n $TARGET_PRODUCT1 || -n $TARGET_PRODUCT2 ]]; then
			echo -e "  4. Configure Cherry-pick script"
		if [[ -n $TARGET_PRODUCT1 ]]; then
			echo -e "  5. Build $romchoose for $TARGET_PRODUCT1"
		elif [[ -n $TARGET_PRODUCT2 ]]; then
			echo -e "  5. Build $romchoose for $TARGET_PRODUCT2"
		else
			echo -e "  5. Build $romchoose for $TARGET_PRODUCT1 and $TARGET_PRODUCT2"
		fi
	fi
	echo -e "  6. Initialize a new ROM"
	echo -e "  7. Exit"
	echo -e ""
	echo -e "Enter your choice: \c"
	read mainMenuChoice
	PROCESSMENU $mainMenuChoice
}

function PROCESSMENU () {
	case $mainMenuChoice in
		1) SYNCREPO ;;
		2) CONFIGUREBUILD ;;
		2a) KITCHCONFIG ;;
		3) DEVICETARGET;;
		4) CHERRYPICK;;
		5) BUILD ;;
		6) ROMSWITCH ;;
		7) exit 0;;
		*) echo "  Invalid Option! ERROR!" ;;
	esac
	echo -e " Press any key to continue..."
	read blank
	clear
}

function CONFIGUREBUILD () {
	clear
	IOMAINSPLASH
	tput setaf 3
	echo -e "Begining to edit the default repo and build options."
	echo -e "      "
	echo -e "     | Submit values in binary bits"
	echo -e "     | 1 for Yes, and 0 for No"
	echo -e ""
	echo -e "Make app instead of build the ROM?"
	echo -e " When Make app is activated instead of building the ROM for a target device the environment will build a single app for a specified target"
	tput setaf 2
	read MAKE_APP
	if [[ "$MAKE_APP" == 0 || "$MAKE_APP" == 1 ]]; then
		echo -e ""
	else
	tput setaf 3
	echo -e ""
	echo -e "ERROR! Wrong parameters passed. Reconfigure"
	CONFIGUREBUILD
	fi

	tput setaf 3
	if (test $MAKE_CLEAN = "1" || test $MAKE_APP = "1"); then
		echo -e "Skipping Make InstallClean because Make clean or Make App is activated so it's unuseful"
	else
	echo -e "Make clean before starting the build?"
	echo -e "	Make clean will delete all the containing files contained in the OUT folder, in order to make a clean build : \c"
	tput setaf 2
	read MAKE_CLEAN
	if [[ "$MAKE_CLEAN" == 0 || "$MAKE_CLEAN" == 1 ]]; then
		echo -e ""
	else
	tput setaf 3
	echo ""
	echo -e "ERROR! Wrong parameters passed. Reconfigure"
	CONFIGUREBUILD
	fi

	tput setaf 3
	if (test $MAKE_CLEAN = "1" || test $MAKE_APP = "1"); then
		echo -e "Skipping Make InstallClean because Make clean or Make App is activated so it's unuseful"
	else
	echo -e "Make Cleaninstapp before starting the build?"
	echo -e "	Make Install app will delete just the intermediates stuff of Apps intermediates like classes in order to build them again and optimize them better: \c"
	tput setaf 2
	read MAKE_CLEANINSTAPP
	if [[ $MAKE_CLEANINSTAPP == 0 || $MAKE_CLEANINSTAPP == 1 ]]; then
		echo -e ""
	else
	echo -e ""
	tput setaf 3
	echo -e "ERROR! Wrong parameters passed. Reconfigure"
	CONFIGUREBUILD
	fi
fi
	tput setaf 3
	if (test $MAKE_CLEAN = "1"); then
		echo -e "Skipping Make dirty because Make clean is activated so it's unuseful"
		echo -e ""
	else
	echo -e "Make Dirty before starting the build?"
	echo -e "	Make Dirty will delete the previous build zip, build.prop,changelog and md5sum in order to regenerate them : \c"
	tput setaf 2
	read MAKE_DIRTY
	if [[ $MAKE_DIRTY == 0 || $MAKE_DIRTY == 1 ]]; then
		echo -e ""
	else
	tput setaf 3
	echo -e "ERROR! Wrong parameters passed. Reconfigure"
	CONFIGUREBUILD
	fi
fi

	tput setaf 3
	echo -e "Repo sync before starting the build?"
	echo -e "	Repo sync will automatically be launched before the build starts : \c"
	tput setaf 2
	read REPO_SYNC_BEFORE_BUILD
	if [[ $REPO_SYNC_BEFORE_BUILD == 0 || $REPO_SYNC_BEFORE_BUILD == 1 ]]; then
		echo -e ""
		fi
	tput setaf 3
	else
	echo -e "ERROR! Wrong parameters passed. Reconfigure"
	CONFIGUREBUILD
	fi

	tput setaf 3
	if (test $MAKE_APP = "1"); then
		echo -e "Skipping Make InstallClean because Make App is activated so it's unuseful"
	else
	if [[ -f "cherry_$TARGET_PRODUCT1.sh" && -f "cherry_$TARGET_PRODUCT2.sh" && -n $TARGET_PRODUCT1 && -n $TARGET_PRODUCT2 ]]; then
		echo -e ""
		echo -e "Use cherry-pick script before starting the build for both the target product devices? : \c"
		tput setaf 2
		read cherryask
		if [[ $cherryask = "NO" || $cherryask = "no" || $cherryask = "No" || $cherryask = "0" ]]; then
			echo -e "For which target product do you want to launch Cherry script?"
			echo -e "Insert 1 for $TARGET_PRODUCT1"
			echo -e "Insert 2 for $TARGET_PRODUCT2"
			read cherryask2
			if (test cherryask2 = "1"); then
				echo -e "Cherry pick script will be runned for the $TARGET_PRODUCT1 at build time"
				$CHERRYPICK1= 1
			else
				echo -e "Cherry pick script will be runned for the $TARGET_PRODUCT2 at build time"
				$CHERRYPICK2= 1
			fi
		else
			$CHERRYPICK1= 1
			$CHERRYPICK2= 1
		fi
	elif [[ -f "cherry_$TARGET_PRODUCT1.sh" && -n $TARGET_PRODUCT1 ]]; then
			echo -e "Run cherry script for $TARGET_PRODUCT1 before the build?"
			read CHERRYPICK1
			if [[ $CHERRYPICK1 == 0 || $CHERRYPICK1 == 1 ]]; then
			echo -e ""
			tput setaf 3
			else
			echo -e " ERROR! Wrong parameters passed. Reconfigure"
			CONFIGUREBUILD
			fi
		elif [[ -f "cherry_$TARGET_PRODUCT2.sh" && -n $TARGET_PRODUCT2 ]]; then
					echo -e "Run cherry script for $TARGET_PRODUCT2 before the build?"
					read CHERRYPICK1
					if [[ $CHERRYPICK2 == 0 || $CHERRYPICK2 == 1 ]]; then
					echo -e ""
					tput setaf 3
					else
					echo -e " ERROR! Wrong parameters passed. Reconfigure"
					CONFIGUREBUILD
					fi
		else
		tput setaf 3
		echo -e "Sorry but no cherry pick script was found for both devices, try maybe to reconfigure the cherry script and come back here after"
		fi
	fi

}

while [[ true ]]; do
	KITCHENSPLASH
	Details
	DISPLAYMAINMENU
done
