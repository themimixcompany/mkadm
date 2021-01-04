const VERSION = "1.0.0";

const process = require('process');

process.argv.shift();
process.argv.shift();
console.log(process.argv[0].match(/[A-Za-z0-9]/g).join('').toLowerCase());
