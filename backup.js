const fs = require('fs');
const { resolve } = require('path');
const os = require('os');

const homedir = os.homedir();

async function vsCodeBackup() {
  let paths = [
    '.config/Code/User/settings.json',
    '.config/Code/User/keybindings.json',
  ];
  for (let path of paths) {
    let filename = path.match(/[^/]+$/)[0];
    let backupPath = __dirname + '/vscode/' + filename;
    try {
      fs.copyFile(`${homedir}/${path}`, backupPath, (err) => {
        if (err) {
          console.log(err);
        }
        console.log(`Copied ${filename} to ${backupPath}`);
      });
    } catch (err) {
      console.log(err);
    }
  }
}

async function backup() {
  await vsCodeBackup();
}

backup();
