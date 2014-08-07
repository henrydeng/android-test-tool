#!/bin/bash
# Uploading to mobile
adb push events.sh /data/local/tmp/
adb shell chmod 755 /data/local/tmp/events.sh
# Exec script
adb shell sh /data/local/tmp/events.sh
