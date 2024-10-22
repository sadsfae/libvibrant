#!/bin/bash
# simple shell wrapper for libvibrant-cli
# you need to gather target displays per `xrandr`
# binary source:
# https://github.com/sadsfae/libvibrant?tab=readme-ov-file#Building
# https://github.com/libvibrant/libvibrant
# Define your target displays here:
my_displays=("DVI-I-1" "DVI-D-0" "HDMI-0")

if [[ $# -eq 0 ]]; then
    echo "USAGE:"
    echo "0 = disable color / enable greyscale"
    echo "1 = enable color / disable greyscale"
    echo "./colorme.sh 1"
    echo "./colorme.sh 0"
    exit 1
fi

choice=$1

# restore saturation (color)
function restore_saturation()
{
    for display in "${my_displays[@]}"; do
        vibrant-cli "$display" 1
    done
}
# enable greyscale
function remove_saturation()
{
    for display in "${my_displays[@]}"; do
        vibrant-cli "$display" 0
    done
}

case $1 in
'0')
    remove_saturation
;;
'1')
    restore_saturation
;;
*)
    echo "choose 0 (greyscale) or 1 (color)"
;;
esac

