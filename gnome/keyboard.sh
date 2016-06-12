#!/bin/sh
# make caps lock a control key
gsettings set org.gnome.libgnomekbd.keyboard options "['caps\tcaps:ctrl_modifier']"
