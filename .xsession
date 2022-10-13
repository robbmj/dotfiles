# restore wallpaper
nitrogen --restore &

# remap caps lock to escape
setxkbmap -option caps:escape

# setup monitors
xrandr \
	--output DisplayPort-0 --primary --mode 3440x1440 --pos 1080x137 --rotate normal \
	--output DisplayPort-1 --mode 1920x1080 --pos 0x0 --rotate left \
	--output HDMI-A-0 --off \
	--output HDMI-A-1 --mode 1920x1080 --pos 4520x0 --rotate left &
