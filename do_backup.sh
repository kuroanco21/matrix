#!/bin/sh

set -eu

DIR="matrix_backup_$(date '+%Y%m%dT%H%M%S')"
mkdir ${DIR}

# nginx
cp -ar ./conf_nginx ./${DIR}/
cp -ar ./data_nginx ./${DIR}/
cp -ar ./log_nginx ./${DIR}/
# certbot
cp -ar ./data_letsencrypt ./${DIR}/
cp -ar ./log_letsencrypt ./${DIR}/
# postgresql
cp -ar ./data_postgresql ./${DIR}/
# synapse
cp -ar ./data_synapse ./${DIR}/
# secrets
cp -ar ./secrets ./${DIR}/

tar czf ./${DIR}.tar.gz ./${DIR}
rm -r ./${DIR}

echo "backup created: ${DIR}.tar.gz"
