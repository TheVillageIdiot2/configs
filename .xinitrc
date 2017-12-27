#!/bin/sh
#Configure gpu
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto


#Add local fonts
xset +fp /usr/share/fonts/TTF/ &
xset fp rehash &

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


#Start clipboard daemon
autocutsel -buttonup &

#Start compton
# compton -b --config ~/.config/compton/config &

exec i3
