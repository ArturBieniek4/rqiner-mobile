apt update -y
# apt upgrade -y
apt install wget curl -y
curl -s https://api.github.com/repos/Qubic-Solutions/rqiner-builds/releases/latest | grep "rqiner-aarch64-mobile" | grep "browser_download_url" | cut -d : -f 2,3 | xargs wget -O rqiner
if [ -f ./rqiner ]; then
    echo 'File exists.'
else
    echo 'File does not exist. Downloading fallback miner.'
    wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/v0.6.0/rqiner-aarch64-mobile -O rqiner
fi
chmod +x rqiner
./rqiner -i XKDKXQQDMEEYRGDRSNFEDYKSPVLDZIHERAPRIPSJXEJUHTZWAEPAUUWDAKAB -l miner_$(ifconfig | grep -oE 'inet [0-9.]+' | grep "192" | sed 's/inet //' | cut -d . -f 4) -t 4
