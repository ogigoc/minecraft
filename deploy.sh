gcloud compute instances create minecraft-server \
--tags minecraft-port \
--zone europe-north1-a \
--machine-type=e2-standard-16 \
--boot-disk-size=100GB

gcloud compute ssh minecraft-server

curl https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar --output server.jar

sudo apt-get install default-jre -y

echo "eula=true" > eula.txt

echo "#Minecraft server properties
#Sun Feb 21 17:03:56 UTC 2021
enable-jmx-monitoring=false
rcon.port=25575
level-seed=
gamemode=survival
enable-command-block=false
enable-query=false
generator-settings=
level-name=world
motd=A Minecraft Server
query.port=25565
pvp=true
generate-structures=true
difficulty=easy
network-compression-threshold=256
max-tick-time=60000
use-native-transport=true
max-players=20
online-mode=false
enable-status=true
allow-flight=false
broadcast-rcon-to-ops=true
view-distance=32
max-build-height=256
server-ip=
allow-nether=true
server-port=25565
enable-rcon=false
sync-chunk-writes=true
op-permission-level=4
prevent-proxy-connections=false
resource-pack=
entity-broadcast-range-percentage=100
rcon.password=
player-idle-timeout=0
force-gamemode=false
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
spawn-animals=true
snooper-enabled=true
function-permission-level=2
level-type=default
spawn-monsters=true
enforce-whitelist=false
resource-pack-sha1=
spawn-protection=16
max-world-size=29999984
" > server.properties

java -Xmx1024M -Xms1024M -jar server.jar nogui
