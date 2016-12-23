#!/bin/bash

ffmpeg -re -stream_loop -1 -i 'BigBuckBunny.mp4' \
    -acodec libfdk_aac -vcodec libx264 -f flv "${TARGET_RTMP_IP}/live/mdst" \
     -c:a libfdk_aac -b:a 32k -c:v libx264 -b:v 128K -f flv "${TARGET_RTMP_IP}/hls/mdst_low" \
     -c:a libfdk_aac -b:a 64k  -c:v libx264 -b:v 256k -f flv "${TARGET_RTMP_IP}/hls/mdst_mid" \
     -c:a libfdk_aac -b:a 128k -c:v libx264 -b:v 512K -f flv "${TARGET_RTMP_IP}/hls/mdst_hi"
