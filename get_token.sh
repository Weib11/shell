#!/bin/bash

#Setting username, password, URL

USERNAME="admin"
PASSWORD="XXX"
API_URL="https://server_ip/redfish/v1/SessionService/Sessions"

# Use curl command dump TOKEN file
CRE_TOKEN=$(curl -k -H "Content-Type: application/json" -XPOST -D headers.txt $API_URL -d '{"UserName":"'"$USERNAME"'","Password":"'"$PASSWORD"'"}')

GET_TOKEN=$(grep -i 'X-Auth-Token:' headers.txt | awk '{print $2}')

# Check GET_TOKEN parameter
if [ -n "$GET_TOKEN" ] ; then
    echo "X-Auth-Token: $GET_TOKEN"  
    exit 1

else
    echo "X-Auth-Token: Request failed"
fi
