#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: MindoMQTT
# Configures MindoMQTT before running
# ==============================================================================
declare port

# Ensure the credential secret value is set
if bashio::config.is_empty 'mindolife'; then
    bashio::log.fatal
    bashio::log.fatal 'Configuration of this add-on is incomplete.'
    bashio::log.fatal
    bashio::log.fatal 'Please be sure to set the "mindolife" option.'
    bashio::log.fatal
    bashio::exit.nok
fi

# Ensure configuration exists
if ! bashio::fs.directory_exists '/config/mindobridge/'; then
    mkdir -p /config/mindobridge/nodes \
        || bashio::exit.nok "Failed to create Mindobridge configuration directory"
fi