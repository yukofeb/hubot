#!/bin/bash

cd /opt/hubot
sudo npm install
node_modules/forever/bin/forever restartall
