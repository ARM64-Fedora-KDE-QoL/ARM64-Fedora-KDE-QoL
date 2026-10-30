#!/usr/bin/env bash
# uninstall.sh - ARM64-Fedora-KDE-QoL
#
# Removes every improvement in this collection by running each one's own uninstaller.
#
# Usage (as your normal user; it asks for sudo when needed):
#   ./uninstall.sh [--purge]     --purge is passed on to each uninstaller (see their READMEs)
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

banner "1/2  Cube-Backside-Click"
bash "$DIR/Cube-Backside-Click/uninstall.sh" "$@"

banner "2/2  3-Finger-Cube-Gesture"
bash "$DIR/3-Finger-Cube-Gesture/uninstall.sh" "$@"

banner "All done"
echo "Log out and back in to finish removing them."
