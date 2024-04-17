sudo apt update -y && sudo apt upgrade -y
sudo apt install wget curl
curl -s https://api.github.com/repos/Qubic-Solutions/rqiner-builds/releases/latest | grep "rqiner-x86-broadwell" | grep "browser_download_url" | cut -d : -f 2,3 | xargs wget -O rqiner
chmod +x rqiner
./rqiner -i XKDKXQQDMEEYRGDRSNFEDYKSPVLDZIHERAPRIPSJXEJUHTZWAEPAUUWDAKAB -l miner_$(ifconfig wlp2s0 | grep -oE 'inet [0-9.]+' | sed 's/inet //' | cut -d . -f 4) -t $(nproc --all)
