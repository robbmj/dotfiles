#!/bin/bash

# Terminate already running bar instances
killall -q i3bar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	# Launch Polybar, using default config location ~/.config/polybar/config
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload main 1>&2 | tee -a $HOME/polybar.log & disown
	done
else
	polybar --reload main 1>&2 | tee -a $HOME/polybar.log & disown
fi

echo "Polybar launched..."
