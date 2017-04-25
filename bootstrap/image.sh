#!/bin/sh

source "/etc/image.cfg"
HACKS_HOME=${HACKS_HOME:-/media/mmcblk0p2/data}

logmsg()
{
  echo "$(date) - $0: $1" >> /tmp/hacks.log
  echo "$1"
}

logmsg "Executing script"

#image_flip, image_mirror
if [ -n "$image_flip" -o -n "$image_mirror"]; then
	if [ $image_flip -eq 1 ]; then 
		flags=$((flags | 1))
	fi
	
	if [ $image_mirror -eq 1 ]; then 
		flags=$((flags | 2))
	fi
	
	printf '0x%x\n' $flags > /proc/isp/mirror-flip/mode
fi

#image_picture
if [ -n $image_brightness ]; then 
	printf '0x%x\n' $image_brightness > /proc/isp/filter/brightness
fi

if [ -z $image_contrast ]; then 
	printf '0x%x\n' $image_contrast > /proc/isp/filter/contrast
fi

if [ -z $image_gamma ]; then 
	printf '0x%x\n' $image_gamma > /proc/isp/filter/gamma
fi

if [ -z $image_hue ]; then 
	printf '0x%x\n' $image_hue > /proc/isp/filter/hue
fi

if [ -z $image_saturation ]; then 
	printf '0x%x\n' $image_saturation > /proc/isp/filter/saturation
fi

if [ -z $image_sharpness ]; then 
	printf '0x%x\n' $image_sharpness > /proc/isp/filter/sharpness
fi

#image_awb
if [ -n $image_awb_temperature ]; then 
	printf '0x%x\n' $image_awb_temperature > /proc/isp/awb/temperature
fi

if [ -n $image_awb_enable ]; then 
	printf '0x%x\n' $image_awb_enable > /proc/isp/awb/enable
fi

#image_af
if [ -n $image_af_w0en ]; then 
	printf '0x%x\n' $image_af_w0en > /proc/isp/af/w0-en
fi

if [ -n $image_af_w1en ]; then 
	printf '0x%x\n' $image_af_w1en > /proc/isp/af/w1-en
fi

#image_ae
if [ -n $image_ae_enable ]; then 
	printf '0x%x\n' $image_ae_enable > /proc/isp/ae/enable
fi

#image_pm
if [ -n $image_pm_enable ]; then 
	printf '0x%x\n' $image_pm_enable > /proc/isp/pm/enable
fi

#image_osd
if [ -n $image_osd_enable ]; then 
	printf '0x%x\n' $image_osd_enable > /proc/isp/osd/enable
fi

#image_nr3d
if [ -z $image_nr3d_intensity ]; then 
	image_nr3d_intensity=$(/media/mmcblk0p2/data/usr/bin/awk '{printf "%d\n",$1}' /proc/isp/nr3d/intensity)
else
	printf '0x%x\n' $image_nr3d_intensity > /proc/isp/nr3d/intensity
fi

if [ -n $image_nr3d_enable ]; then 
	printf '0x%x\n' $image_nr3d_enable > /proc/isp/nr3d/enable
fi

#image_md
if [ -n $image_md_enable ]; then 
	printf '0x%x\n' $image_md_enable > /proc/isp/md/enable
fi

#image_iq
if [ -z $image_iq_enable ]; then 
	printf '0x%x\n' $image_iq_enable > /proc/isp/iq/enable
fi

#image_drc
if [ -z $image_drc_temperature ]; then 
	printf '0x%x\n' $image_drc_intensity > /proc/isp/drc/intensity
fi

if [ -z $image_drc_enable ]; then 
	printf '0x%x\n' $image_drc_enable > /proc/isp/drc/enable
fi
