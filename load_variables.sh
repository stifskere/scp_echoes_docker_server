# READ https://wiki.scpechoes.com/configs/server FOR MORE INFORMATION.
!#/bin/bash
set -e

CONFIG_FOLDER="/home/echoes/.local/share/SCP-Echoes";
CONFIG_FILE="$CONFIG_FOLDER/server_settings.json";

mkdir -p "$CONFIG_FOLDER";
touch "$CONFIG_FILE";
cat > "$CONFIG_FILE" <<EOF
{
  "ServerName": ${SERVER_NAME:-\"My Server\"},
  "ServerPort": ${SERVER_PORT:-27015},
  "ServerInfoUrl": ${SERVER_INFO_URL:-null},
  "ServerIconUrl": ${SERVER_ICON_URL:-null},
  "MinPlayers": ${MIN_PLAYERS:-2},
  "MaxPlayers": ${MAX_PLAYERS:-20},
  "TimeToRoundStart": ${TIME_TO_ROUND_START:-15},
  "AdminPassword": ${ADMIN_PASSWORD:-null},
  "ServerListKey": ${SERVER_LIST_KEY:-null},
  "ServerAddress": ${SERVER_ADDRESS:-null},
  "ShowLogType": ${SHOW_LOG_TYPE:-true},
  "RichTextLogs": ${RICH_TEXT_LOGS:-true},
  "ShowTimestamps": ${SHOW_TIMESTAMPS:-true},
  "TimestampsInUTC": ${TIMESTAMPS_IN_UTC:-true},
  "MaxDuplicateLogs": ${MAX_DUPLICATE_LOGS:-10},
  "DuplicateLogsTimeWindow": ${DUPLICATE_LOGS_TIME_WINDOW:-\"00:01:00\"},
  "MinLogLevel": ${MIN_LOG_LEVEL:-1},
  "ServerTags": ${SERVER_TAGS:-[]},
  "CustomMaps": ${CUSTOM_MAPS:-[]},
  "Sprays": ${SPRAYS:-[]},
  "OverrideRoundConfig": ${OVERRIDE_ROUND_CONFIG:-\"\"}
}
EOF
