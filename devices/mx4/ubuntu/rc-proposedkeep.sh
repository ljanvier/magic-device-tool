clear
echo ""
echo "Flashing rc-proposed channel"
echo ""
sleep 1
echo "Please boot your MX4 into recovery mode by pressing Power & Volume Up (+)"
echo ""
sleep 1
echo -n "Is your MX4 in recovery mode now? [Y] "; read recoverymode
if [ "$recoverymode"==Y -o "$recoverymode"==y -o "$recoverymode"=="" ]; then
  clear
  echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  adb devices >~/.AttachedDevices
fi
  if grep 'device$\|recovery$' ~/.AttachedDevices
  then
    echo ""
    echo "Device detected !"
    sleep 1
    clear
    echo ""
    echo "Flashing rc-proposed channel"
    sleep 1
    echo ""
    ubuntu-device-flash touch --channel ubuntu-touch/rc-proposed/meizu.en --device arale
    echo ""
    echo "Move to your device to finish the setup."
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f ~/.AttachedDevices
    echo ""
    sleep 1
    echo "Exiting script. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    sleep 1
    echo ""
    echo "Back to menu"
    sleep 1
    . ./launcher.sh
  fi
