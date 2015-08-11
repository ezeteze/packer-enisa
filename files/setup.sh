#!/bin/bash
# init
	function pause(){
   	  read -p "$*"
	}
 
echo "Hello, welcome to initial setup of the ENISA training material."
pause 'Press [Enter] key to continue...'
unzip /home/enisa/training.zip -d /home/enisa/Desktop/Training-Material
mv /home/enisa/Desktop/Training-Material/workspace /home/enisa/workspace
mv /home/enisa/Desktop/Training-Material/.thunderbird /home/enisa/.thunderbird
mv /home/enisa/Desktop/Training-Material/.irssi /home/enisa/.irssi
sudo dpkg -i /home/enisa/Desktop/Training-Material/MaltegoCarbonCE.v3.5.3.deb
rm -rf /home/enisa/Desktop/Training-Material/MaltegoCarbonCE.v3.5.3.deb
sudo mv /home/enisa/Desktop/Training-Material/html/* /var/www/html/
rm -rf /home/enisa/Desktop/Training-Material/html/
sudo chown -R www-data:www-data /var/www/
echo "export PATH=$PATH:/home/enisa/android-sdk-linux/" >> /home/enisa/.bash_profile
echo "export ANDROID_HOME=/home/enisa/android-sdk-linux/" >> /home/enisa/.bash_profile
echo "export PATH=$PATH:/home/enisa/android-sdk-linux/" >> /home/enisa/.profile
echo "export ANDROID_HOME=/home/enisa/android-sdk-linux/" >> /home/enisa/.profile
source /home/enisa/.bash_profile
unzip /home/enisa/android-studio-ide-141.2135290-linux.zip -d /home/enisa/
chmod -R 777 /home/enisa/android/
echo "no" | /home/enisa/android-sdk-linux/tools/android create avd -n Enisa -t 2 --abi default/armeabi-v7a
echo "hw.keyboard=yes" >> /home/enisa/.android/avd/Enisa.avd/config.ini
echo "hw.dPad=yes" >> /home/enisa/.android/avd/Enisa.avd/config.ini
/home/enisa/android-sdk-linux/tools/mksdcard 100M /home/enisa/.android/avd/Enisa.avd/sdcard.img
rm -rf /home/enisa/setup.sh
rm -rf /home/enisa/training.zip
rm -rf /home/enisa/android.zip
pause 'Will now reboot! Press [Enter] key to continue...'
sudo reboot

