#!/bin/bash

cd /opt/hubot
sudo bundle install
node_modules/forever/bin/forever restartall
