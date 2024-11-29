pkg update -o Dpkg::Options::="--force-confold" --force-yes -y && pkg install proot-distro termux-api -y && proot-distro install ubuntu
echo "proot-distro login ubuntu" > ~/.bashrc
proot-distro login ubuntu
