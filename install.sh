#!/usr/bin/env bash
# install.sh - ARM64-Fedora-KDE-QoL
#
# Installs every improvement in this collection, one after the other:
#   1. 3-Finger-Cube-Gesture  - 3-finger swipe up/down opens/closes KDE's Desktop Cube
#   2. Cube-Backside-Click    - click the back of a desktop inside the cube to switch to it
# Each one lives in its own folder here and can also be installed on its own with that
# folder's install.sh. See README.md.
#
# Usage (as your normal user; it asks for your password once, at the start):
#   ./install.sh
# To remove everything: ./uninstall.sh
#
# Copyright (C) 2026 Cynders
# SPDX-License-Identifier: GPL-3.0-or-later
# This program is free software: you can redistribute it and/or modify it under the terms of
# the GNU General Public License as published by the Free Software Foundation, either version 3
# of the License, or (at your option) any later version. It is distributed WITHOUT ANY WARRANTY;
# see the LICENSE file for details.

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

banner() { printf '\n\033[1;35m######## %s ########\033[0m\n' "$*"; }

if [[ $EUID -eq 0 ]]; then
  echo "Run this as your normal user, not root (it will ask for sudo when needed)."
  exit 1
fi

# The gesture installer asks for the sudo password and installs the shared packages (including
# git, which Cube-Backside-Click needs), so it runs first.
banner "1/2  3-Finger-Cube-Gesture"
bash "$DIR/3-Finger-Cube-Gesture/install.sh"

banner "2/2  Cube-Backside-Click"
bash "$DIR/Cube-Backside-Click/install.sh"

banner "All done"
echo "Installed:"
echo "  - 3-Finger-Cube-Gesture: 3-finger swipe up opens the Desktop Cube, swipe down closes it."
echo "  - Cube-Backside-Click:   click the back of a desktop inside the cube to switch to it."
echo
echo "Log out and back in once to activate back-side clicking."
echo "Both keep themselves up to date after Fedora updates; you get a notification when they do."
