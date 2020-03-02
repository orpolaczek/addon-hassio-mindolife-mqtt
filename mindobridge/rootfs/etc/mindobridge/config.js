const fs = require('fs');
const options = JSON.parse(fs.readFileSync('/data/options.json', 'utf8'));


const config = {
    pollingIntervalMillis: options.pollingIntervalMillis, 
    mindolife: {
        developerKey: options.mindolife.developerKey,
        sessionKey: options.mindolife.sessionKey,
        gatewayId: options.mindolife.gatewayId
    },
    mqtt: {
        host: options.mqtt.host,
        port: options.mqtt.port,
        username: options.mqtt.username,
        password: options.mqtt.password,
        topicPrefix: options.mqtt.topicPrefix
    },
    log: options.log
};

module.exports = config;
