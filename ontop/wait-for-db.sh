#!/bin/bash
set -e

echo "[wait-for-db] Waiting for Camunda H2 database to be ready..."

while true; do
  result=$(java -cp /opt/ontop/jdbc/h2-1.4.190.jar org.h2.tools.Shell \
    -url "jdbc:h2:tcp://h2:9092/h2/camunda-h2-database" \
    -user sa -password camunda \
    -sql "SELECT COUNT(*) FROM ACT_HI_ACTINST" 2>/dev/null | grep -E '^[0-9]+$' || true)

  if [[ -n "$result" ]]; then
    echo "[wait-for-db] ACT_HI_ACTINST is ready."
    break
  else
    echo "[wait-for-db] ACT_HI_ACTINST not ready. Sleeping..."
    sleep 2
  fi
done

echo "[wait-for-db] Launching Ontop..."
exec /opt/ontop/entrypoint.sh
