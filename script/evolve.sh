wget -O https://github.com/JamesHabben/evolve/archive/master.zip -d /opt
unzip /opt/master.zip
rm -rf /opt/master.zip
ln -s /opt/evolve-master/evolve.py /usr/local/bin/evolve.py