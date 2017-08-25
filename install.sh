useradd -d /home/xmr -c "xmr miner" xmr
mkdir /home/xmr
chown xmr /home/xmr
echo "xmr:$1" | chpasswd

# get git to install it
apt-get install git 

# dependencies
sudo apt-get install build-essential autotools-dev autoconf libcurl3 libcurl4-gnutls-dev

# download latest version
cd /opt
git clone https://github.com/wolf9466/cpuminer-multi

cd cpuminer-multi/

# compile
./autogen.sh
CFLAGS="-march=native" ./configure
make

#install
make install

#start mining using
#minerd -a cryptonight -o stratum+tcp://pool.minexmr.com:4444 -u 43LFAbT6ktCeta7Q9MSm8PE8Kunv2eq1WgQ7bAJL7vsfSsaCkEFnzE8FistMgH9YyRZS5uAwEMfdK65yDuWM89KiAFEQ6Vn -p x
