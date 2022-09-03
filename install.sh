#!/bin/sh
# Ce script vient de github.com/mathis-r/mcserveur

cp list.sh /usr/bin/list.sh
chmod +x /usr/bin/list.sh
cp start.bash /usr/bin/start.bash
chmod +x /usr/bin/start.bash
cp stop.sh /usr/bin/stop.sh
chmod +x /usr/bin/stop.sh
cp uninstall.sh /usr/bin/uninstall.sh
chmod +x /usr/bin/uninstall.sh
mkdir -p /root/serveurs

echo "Installation faite !"
echo "Vous pouvez à présent créer un serveur, puis le lancer avec sudo start.bash => Suivez les instructions du README"
