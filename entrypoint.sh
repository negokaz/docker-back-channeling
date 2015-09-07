#!/usr/bin/env bash

if [ "${DATOMIC_URL}" = "datomic:free://localhost:4334/bc" ]; then
  # when default url
  echo "preparing datomic..."
  # add java option -Xmx1g
  sed -r -i 's/^exec java /exec java -Xmx1g /' /opt/back-channeling/bin/transactor
  # start datomic
  bash -c "cd /opt/datomic; /opt/back-channeling/bin/transactor" &
  # wait until datomic listens 4334
  until ss -a | grep -E '^tcp +LISTEN.+:4334' > /dev/null 2>&1; do sleep 1; done
fi

exec "/opt/back-channeling/bin/back_channeling"
