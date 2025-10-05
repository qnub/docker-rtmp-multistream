TRANSCODE_DOUBLE_FPS=$(( TRANSCODE_FPS * 2 ))
TRANSCODE_VIDEO_BITRATE=$(( TRANSCODE_KBITS_PER_VIDEO_FRAME * TRANSCODE_FPS ))

# Encoder Settings
sed -i "s|RELAY_SECRET|$RELAY_SECRET|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|FFMPEG_LOGLEVEL|$FFMPEG_LOGLEVEL|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_AUDIO_BITRATE|$TRANSCODE_AUDIO_BITRATE|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_CODEC|$TRANSCODE_CODEC|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_DOUBLE_FPS|$TRANSCODE_DOUBLE_FPS|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_FFMPEG_THREADS|$TRANSCODE_FFMPEG_THREADS|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_FPS|$TRANSCODE_FPS|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_HEIGHT|$TRANSCODE_HEIGHT|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_VIDEO_BITRATE|$TRANSCODE_VIDEO_BITRATE|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"
sed -i "s|TRANSCODE_X264_PRESET|$TRANSCODE_X264_PRESET|g" "${NGINX_CONFD_DIR}/transformers/transcode.conf"

echo "Transcode configuration complete."
