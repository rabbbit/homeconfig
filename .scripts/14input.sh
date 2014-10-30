#!/bin/sh

xinput set-prop 14 "Device Accel Constant Deceleration" 1.8
xinput set-prop 14 "Device Accel Velocity Scaling" 1
xinput set-prop 14 "Device Accel Profile" -1
xset m 1 10000

