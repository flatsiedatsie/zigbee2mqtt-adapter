const installAddon = require('./index');

const manager = {
  addAdapter() {},
  emit(event, data) {
    console.log('>', event, data ? data.value : data);
  },
  handleDeviceAdded(device) {
    console.log('+', device.id);
  },
};
const manifest = {
  moziot: {
    config: {
      mqtt: 'mqtt://localhost',
      prefix: 'zigbee2mqtt',
    },
  },
};

installAddon(manager, manifest);
