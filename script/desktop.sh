#!/bin/bash

configure_ubuntu1204_autologin()
{
    USERNAME=enisa
    LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf

    echo "==> Configuring lightdm autologin"
    if [ -f $LIGHTDM_CONFIG ]; then
        echo "" >> $LIGHTDM_CONFIG
        echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
        echo "autologin-user-timeout=0" >> $LIGHTDM_CONFIG
    fi
}

echo "==> Checking version of Ubuntu"
. /etc/lsb-release

if [[ $DISTRIB_RELEASE == 12.04 ]]; then

    configure_ubuntu1204_autologin

elif [[ $DISTRIB_RELEASE == 14.04 ]]; then
    echo "==> Installing lubuntu-core"
    apt-get install -y lubuntu-core

    USERNAME=enisa
    LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
    GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf

    mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
    echo "[daemon]" >> $GDM_CUSTOM_CONFIG
    echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
    echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
    echo "AutomaticLoginEnable=enisa" >> $GDM_CUSTOM_CONFIG
    
    echo "==> Configuring lightdm autologin"
    if [ -f $LIGHTDM_CONFIG ]; then
        echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
        echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
    fi
fi
