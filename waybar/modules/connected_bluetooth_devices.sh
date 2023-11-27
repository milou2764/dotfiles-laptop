#!/bin/bash

bluetoothctl info | grep -B9 -e 'Connected: yes' | grep 'Device' | cut -f2 -d' '
