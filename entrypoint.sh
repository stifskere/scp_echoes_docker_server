#!/bin/bash
set -e

ECHOES_APP_ID=3658720;

if [ -z "$STEAM_USER" ] || [ -z "$STEAM_PASS" ]; then
	echo "THE PRE-RELEASE VERSIONS OF THIS GAME CANNOT BE DOWNLOADED WITHOUT AUTHENTICATION.";
	echo "PLEASE, PROVIDE STEAM_USER AND STEAM_PASS VARIABLES.";
	steamcmd \
		+login anonymous \
		+app_update "$ECHOES_APP_ID" -beta latest validate \
		+quit;
else
	steamcmd \
		+login "$STEAM_USER" "$STEAM_PASS" \
		+app_update "$ECHOES_APP_ID" -beta latest validate \
		+quit;
fi

./load_variables.sh

cd ~/.local/share/Steam/steamapps/common/SCP\ Echoes\ Playtest;
exec script -q -c "./ServerTemplate.sh" /dev/null \
	| tee -a ~/.local/share/SCP-Echoes/logs/container.log
