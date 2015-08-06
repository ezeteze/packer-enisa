#!/bin/bash

date > /etc/box_build_time

VAGRANT_USER=enisa
VAGRANT_HOME=/home/$VAGRANT_USER
VAGRANT_INSECURE_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDu2arPUPYZc3wYsKJq8kQgPTbM4TgF9ZZLnpq4a0tIffPbZ+rl72THWhOFwOspybbJYWOiQ3UmSvxTjyRfNLvsKkTYEzzw2kvqbXmldqEQLvTbTwd2TWdMJnVku2Wjtmvjv60n9JZMngTkWONmf4BpbiASISWrVYH/9A8Mk2CY+KZW6SdJbbwFbZ/gxFGpFRdNMWfF413VttY0LzbzrwWpiiXC2aSEhI9tajQ3laew4oStNy0/MUFfjECbu6vz6WqRCMA/XSB+31wuVeZNphzkJNjuuIntaJlGKhPr/5ukaTBhcY0L5Zt1jxMW24OMn4ozNCp1iwA5RXsofeuFT0DV enisa insecure public key"

# Create Vagrant user (if not already present)
if ! id -u $VAGRANT_USER >/dev/null 2>&1; then
    echo "==> Creating $VAGRANT_USER user"
    /usr/sbin/groupadd $VAGRANT_USER
    /usr/sbin/useradd $VAGRANT_USER -g $VAGRANT_USER -G sudo -d $VAGRANT_HOME --create-home
    echo "${VAGRANT_USER}:${VAGRANT_USER}" | chpasswd
fi

# Set up sudo
echo "==> Giving ${VAGRANT_USER} sudo powers"
echo "${VAGRANT_USER}        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

echo "==> Installing vagrant key"
mkdir $VAGRANT_HOME/.ssh
chmod 700 $VAGRANT_HOME/.ssh
cd $VAGRANT_HOME/.ssh


echo "${VAGRANT_INSECURE_KEY}" > $VAGRANT_HOME/.ssh/authorized_keys
chmod 600 $VAGRANT_HOME/.ssh/authorized_keys
chown -R $VAGRANT_USER:$VAGRANT_USER $VAGRANT_HOME/.ssh
