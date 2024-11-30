apt update
DEBIAN_FRONTEND=noninteractive apt -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano jq wget curl openssh-server bc

wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb

wget "https://github.com/Oink70/Android-Mining/releases/download/v3.8.3-4/ccminer-3.8.3-4_ARM" -O /usr/bin/ccminer
chmod +x /usr/bin/ccminer

mkdir /var/run/sshd
chmod 0755 /var/run/sshd
yes minepass | passwd root

echo "source init.sh" > ~/.bashrc
