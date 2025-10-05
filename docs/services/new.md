# Adding New Services

To add a new, unsupported streaming service:

1. Create new configuration file(s) in the `container/build/scripts/pre-init.d` and `container/build/conf/nginx/http.d/apps|ransformers` directories.
2. Add any necessary new environment variables to the `container/Dockerfile` and `env/relay.env` files. Ensure secrets such as stream keys and usernames are initialized as empty strings.
3. Add the new service to the `app.conf` file and comment it out. Add low resolution configs (as Twitch) to `relay-RELAY_SECRET` apps and high resolution (as YouTube) to `transcode-RELAY_SECRET` app.

For services which requires transcoding you can use next files as example:
   - `container/build/scripts/pre-init.d/90_configure_twitch.sh`
   - `container/build/conf/nginx/http.d/apps/twitch.conf` 

For services which can use same quality as YouTube - next files:
   - `container/build/scripts/pre-init.d/90_configure_youtube.sh`
   - `container/build/conf/nginx/http.d/apps/youtube.conf`
