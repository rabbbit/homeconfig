#!/bin/sh

xinput set-prop 11 "Device Accel Constant Deceleration" 2.8
xinput set-prop 11 "Device Accel Velocity Scaling" 1
xinput set-prop 11 "Device Accel Profile" -1
xset m 1 10000

