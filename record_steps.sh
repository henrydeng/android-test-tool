#!/bin/bash
APK="package.apk"
PACKAGE="com.app.name"
ACTIVITY="com.app.name.default.activity"
# 1. Install
echo "Uninstalling $PACKAGE"
adb uninstall $PACKAGE 
adb logcat -c
echo "Installing $APK"
adb install $APK
adb logcat -d > log/install.log
# 2. Exec app
echo "Starting $PACKAGE"
adb logcat -c
adb shell am start -n $PACKAGE/$ACTIVITY
# 3. Recording steps
echo "I will record Your steps. Just use app as usual"
adb shell getevent -t > events.txt
./decode_events.py events.txt > events.sh
echo "Exec events.sh to replay your actions"
