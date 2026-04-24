#!/bin/sh

# Set wallpaper using feh
feh --randomize --bg-fill ~/Pictures/Walls/* &

# Start picom (compositor)
picom &

# autolock 
xautolock -time 10 -locker "i3lock -c 000000" &

# Kill any existing polybar instances and start a new one
~/.config/polybar/launch.sh &

# You can add more bspwm settings below this line if needed
