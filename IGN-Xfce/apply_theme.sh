#!/bin/bash

warnal_bg_terminal ()
{
	if [ -f $HOME/.config/xfce4/terminal/terminalrc ]; then
		sed -i "s~\(BackgroundImageFile=\).*~\1$1~g" $HOME/.config/xfce4/terminal/terminalrc
	else
		mkdir -p $HOME/.config/xfce4/terminal/
		cp /usr/share/themes/IGN-Xfce/terminalrc $HOME/.config/xfce4/terminal/terminalrc
		sed -i "s~\(BackgroundImageFile=\).*~\1$1~g" $HOME/.config/xfce4/terminal/terminalrc
	fi
}

ign-xfce ()
{
	xfconf-query -c xsettings -p /Net/ThemeName -s "IGN-Xfce"
	xfconf-query -c xfwm4 -p /general/theme -s "IGN-Xfce"
	warnal_bg_terminal "/usr/share/themes/IGN-Xfce/gtk-2.0/Panel/panel-blue.png"
}

install-ign-xfce ()
{
	sudo cp -r ../IGN-Xfce /usr/share/themes/IGN-Xfce
	sudo chmod 755 -R /usr/share/themes/IGN-Xfce
}

install-ign-xfce
ign-xfce
