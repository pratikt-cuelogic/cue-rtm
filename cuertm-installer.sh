#!/bin/bash

INSTALL_PREFIX="/usr/local/bin"
APP="https://raw.githubusercontent.com/pratikt-cuelogic/cue-rtm/master/cuertm"
curl -OL "$APP"
install -v -m 0644 cuertm "$INSTALL_PREFIX"
