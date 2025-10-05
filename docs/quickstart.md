# Quick Start Guide
This guide serves as a quick start for setting up the relay and streaming to YouTube with high quality and transcode to Twitch and/or KICK. For more detailed information, visit the [full documentation](README.md) page.

## 1. Configure Streams
On any supporting platform configure stream parameters.

### Twitch
Open your [Twitch dashboard](https://dashboard.twitch.tv) and click on 'Stream Manager' to configure your stream details.

### KICK
Open your [KICK dashboard](https://dashboard.kick.com) and click on 'Stream' to configure your stream details.

### YouTube
Open your [YouTube dashboard](https://studio.youtube.com) and click on 'Go Live' to configure your stream details.

## 2. Relay PC Setup
1. ```git clone git@github.com:JacobSanford/docker-rtmp-multistream.git```
2. ```cd docker-rtmp-multistream```
3. Copy the `env/relay.env` file to `env/.env`:
   1. Set `RELAY_SECRET` to some unique string to secure this relay server from others. You can use https://www.uuidgenerator.net/ to create safe unique string.
   2. Add any of required keys: Twitch, KICK, YouTube, etc and/or change URLs. URL should not ends with `/` and add `/app` at the ned of KICK URL if it not already there.
   3. Configure stream quality settings as needed. For more information, see the specific documentation for [Tranbscode](services/transcode.md), as well as [Quality Considerations](quality.md).
4. Execute ```./start.sh```

The relay is now ready to receive video from your streaming software. It will work always and start aurtomatically when docker service starts. 

To apply changes from `env/.env` run command `./reload.sh`. 

To update code run command `./update.sh`.

To shut down the service, run command `./disable.sh`.

## 3. Gaming PC Setup
### a. When Using OBS Studio
#### Stream Settings
* ```Service```: Custom
* ```Server```: 
  - `rtmp://192.168.2.22:1935/relay-<RELAY_SECRET>` - for direct relay without transcoding (if you prefer transcode on your own PC)
  - `rtmp://192.168.2.22:1935/transcode-<RELAY_SECRET>` - for relay with transcoding
  * Where 192.168.2.22 corresponds to the relay PC's actual IP address and `<RELAY_SECRET>` value of `RELAY_SECRET` from `env/.env`.
* ```Stream Key```: Enter an identifer for your stream. This key is only used to identify your stream on the relay server. For example, `myStream`. It is unrelated to and should not match your Twitch or YouTube stream keys.
* ```Use Authentication```: Unchecked.

#### Output Settings
* ```Output Mode```: Advanced
* ```Encoder```: If you have a modern NVidia card, use NVIDIA NVENC H.264. Otherwise, use CPU encoding with x264.
* ```Rate Control```: CBR
* ```Bitrate```: 20000. Set the bitrate to as large as a value as possible allowed by your network/bandwidth. See below!
* ```Keyframe Interval```: 2

#### Start Streaming!
Open OBS Studio and click `Start Streaming`. The relay will automatically forward your stream to Twitch and YouTube.
