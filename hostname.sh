changeHostname()
{
    curl -X PATCH --header "Content-Type:application/json" --data \
        "{\"network\": {\"hostname\": \"$BALENA_DEVICE_NAME_AT_INIT\"}" \
        "$BALENA_SUPERVISOR_ADDRESS/v1/device/host-config?apikey=$BALENA_SUPERVISOR_API_KEY" \
}
