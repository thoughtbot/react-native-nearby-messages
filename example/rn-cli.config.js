const blacklist = require('metro-config/src/defaults/blacklist');

module.exports = {
  resolver:{
    blacklistRE: blacklist([
      /react-native-nearby-messages\/node_modules\/.*/,
      /react-native-nearby-messages\/example\/.*/,
      /android\/.*/,
      /ios\/.*/,
    ])
  },
};
