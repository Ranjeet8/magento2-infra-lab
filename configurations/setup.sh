# Final Setup Commands (setup.sh)

#!/bin/bash
# Reindex and Cache Flush
php bin/magento indexer:reindex
php bin/magento cache:flush
php bin/magento cache:clean

# Set Permissions
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chown -R test-ssh:clp .
chmod u+x bin/magento
