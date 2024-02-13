#!/bin/sh
set -e

# This script is meant for quick & easy install via:
# $ curl -fsSL https://raw.githubusercontent.com/bitrixdock/bitrixdock/master/install.sh -o install.sh | sh install.sh
#echo "Check requirements"
#apt-get -qq update
#hash git 2>/dev/null || { apt-get install -y git; }
#hash docker 2>/dev/null || { cd /usr/local/src && curl -fsSL https://get.docker.com/ | sh; }
#hash docker-compose 2>/dev/null || { curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose; }

echo "Create folder struct"
mkdir -p ./www/bitrix && \
curl -fsSL https://www.1c-bitrix.ru/download/scripts/bitrixsetup.php -o ./www/bitrix/bitrixsetup.php && \
cd ./www/ && \
git clone https://github.com/steem02/bitrix-docker.git && \
cd .. && chmod -R 775 www/ && chown -R root:www-data www/ && \
cd ./www/bitrix-docker

echo "Config"
cp -f .env_template .env

echo "Run"
docker-compose up -d
