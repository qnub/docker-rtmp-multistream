#!/usr/bin/env sh
if [ -z "$KICK_KEY" ]; then
  echo "KICK_KEY is not set. Skipping Kick configuration."
  exit 0
fi

# Enable transcode
sed -i "s|\#include $NGINX_CONFD_DIR/transformers/twitch.conf|include $NGINX_CONFD_DIR/transformers/twitch.conf|g" "$NGINX_APP_CONF_FILE"

# App
sed -i "s|KICK_KEY|$KICK_KEY|g" "${NGINX_CONFD_DIR}/apps/kick.conf"

/scripts/enableService.sh kick
echo "Kick configuration complete, and service enabled."
