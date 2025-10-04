#!/usr/bin/env sh
if [ -z "$TWITCH_KEY" ]; then
  echo "TWITCH_KEY is not set. Skipping Twitch configuration."
  exit 0
fi

  # Enable transcode
  sed -i "s|\#include $NGINX_CONFD_DIR/transformers/twitch.conf|include $NGINX_CONFD_DIR/transformers/twitch.conf|g" "$NGINX_APP_CONF_FILE"

# App
sed -i "s|TWITCH_KEY|$TWITCH_KEY|g" "${NGINX_CONFD_DIR}/apps/twitch.conf"

/scripts/enableService.sh twitch
echo "Twitch configuration complete, and service enabled."
