#!/bin/bash

API_URL="https://10.191.4.11:8006/api2/json"
TOKEN_ID="terrapie@pam!tf"
TOKEN_SECRET="03579d45-41d5-4185-859d-cb6faf504f92"

LIST=$1
CATEGORY=$2

while read VMID; do
    STATUS=$(curl -s -k \
      -H "Authorization: PVEAPIToken=$TOKEN_ID=$TOKEN_SECRET" \
      "$API_URL/nodes/pve1/qemu/$VMID/status/current" | jq -r '.data.status')

    if [[ "$STATUS" != "running" ]]; then
        echo "[$CATEGORY] VM $VMID is DOWN. Starting..."
        curl -s -k -X POST \
          -H "Authorization: PVEAPIToken=$TOKEN_ID=$TOKEN_SECRET" \
          "$API_URL/nodes/pve1/qemu/$VMID/status/start"
    fi
done < "$LIST"

