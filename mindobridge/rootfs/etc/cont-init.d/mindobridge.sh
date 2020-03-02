#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: MindoMQTT
# Configures MindoMQTT before running
# ==============================================================================
declare port

# Ensure configuration exists
if ! bashio::fs.directory_exists '/config/mindobridge/'; then
    mkdir -p /config/mindobridge/nodes \
        || bashio::exit.nok "Failed to create Mindobridge configuration directory"
fi