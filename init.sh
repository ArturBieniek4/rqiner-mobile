cd ~
rm -rf rqiner-mobile
git clone https://github.com/ArturBieniek4/rqiner-mobile
cp rqiner-mobile/init.sh init.sh
cd rqiner-mobile
while true do
    timeout 12h bash start.sh
done