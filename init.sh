cd ~
rm -rf rqiner-mobile
git clone https://github.com/ArturBieniek4/rqiner-mobile
cp rqiner-mobile/init.sh init.sh
cd rqiner-mobile
termux-wake-lock
sshd -o PermitRootLogin=yes -p 8022
while true
do
    timeout 12h bash miner_manager.sh
    pkill -x rqiner
    pkill -x ccminer
done
