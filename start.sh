sshd -o PermitRootLogin=yes -p 8022
wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/v1.1.2-experimental/rqiner-aarch64 -O /usr/bin/rqiner # fallback miner
curl -s https://api.github.com/repos/Qubic-Solutions/rqiner-builds/releases/latest | grep "rqiner-aarch64" | grep "browser_download_url" | cut -d : -f 2,3 | xargs wget -O /usr/bin/rqiner
chmod +x /usr/bin/rqiner
#rqiner -i XKDKXQQDMEEYRGDRSNFEDYKSPVLDZIHERAPRIPSJXEJUHTZWAEPAUUWDAKAB -l aminer_$(ifconfig | grep -oE 'inet [0-9.]+' | grep "192" | sed 's/inet //' | cut -d . -f 4) -t $(nproc --all) -c "ccminer -a verus -o stratum+tcp://eu.luckpool.net:3956 -u RSKHPzTqhu1o5gDvitNKXRJRxcP1dEb9W3.aminer_$(ifconfig | grep -oE 'inet [0-9.]+' | grep "192" | sed 's/inet //' | cut -d . -f 4) -p hybrid -t $(nproc --all)"
ccminer -a verus -o stratum+tcp://eu.luckpool.net:3956 -u RSKHPzTqhu1o5gDvitNKXRJRxcP1dEb9W3.aminer_$(ifconfig | grep -oE 'inet [0-9.]+' | grep "192" | sed 's/inet //' | cut -d . -f 4) -p x -t $(nproc --all)
