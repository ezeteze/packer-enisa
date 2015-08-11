unzip /home/enisa/mobile.zip -d /tmp
cp /tmp/jd-gui /usr/local/bin/jd-gui
cp /tmp/apktool /usr/local/bin/apktool
chmod +x /usr/local/bin/apktool
cp /tmp/apktool.jar /usr/local/bin/apktool.jar
mkdir /usr/local/share/applications/
cp /tmp/jdgui.desktop /usr/local/share/applications
cp /tmp/ADT-Eclipse.desktop /usr/local/share/applications
mkdir /home/enisa/Desktop
chown enisa:enisa /home/enisa/Desktop
chmod +x /home/enisa/setup.sh
chown enisa:enisa /home/enisa/setup.sh
chown -R enisa:enisa /home/enisa/
echo lxsession -s Lubuntu -e LXDE > /home/enisa/.xsession
chown enisa:enisa /home/enisa/.xsession
# Zeuscan Plugin 
wget -O /usr/lib/python2.7/dist-packages/volatility/plugins/zeusscan.py https://volatility.googlecode.com/svn-history/r2835/trunk/contrib/plugins/malware/zeusscan.py

Will install this from pypi
#unzip /home/enisa/distorm3.zip -d /tmp
#python /tmp/distorm3/setup.py build
#python /tmp/distorm3/setup.py build install

#Delete what we don't need
rm -rf /home/enisa/mobile.zip
rm -rf /home/enisa/distorm3.zip
