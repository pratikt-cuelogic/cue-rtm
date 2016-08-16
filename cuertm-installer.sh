#!/bin/bash

INSTALL_PREFIX="/usr/local/bin"
APP="https://raw.github.com/nvie/gitflow/develop/contrib/cuertm"
curl -OL "$APP"
install -v -m 0644 cuertm "$INSTALL_PREFIX"
