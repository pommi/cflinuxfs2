set -e -x

apt-get update
apt-get install -y --force-yes --no-install-recommends libreadline6-dev tzdata locales

cp /tmp/assets/etc/default/locale /etc/default/locale

# disable interactive dpkg
echo "debconf debconf/frontend select noninteractive" | debconf-set-selections

# timezone
dpkg-reconfigure -fnoninteractive -pcritical tzdata

# locale
locale-gen en_US.UTF-8
dpkg-reconfigure -fnoninteractive -pcritical libc6
dpkg-reconfigure -fnoninteractive -pcritical locales
