# ARM64-Fedora-KDE-QoL

**Built on ARM64 Linux Fedora 44 Asahi KDE Plasma**

**Quality-of-life (QoL) improvements for laptops running Fedora KDE Plasma on ARM64**, such as Apple Silicon MacBooks with Fedora Asahi Remix. It's aimed at people who've recently switched to Linux and want their touchpad and desktop to feel smooth and intuitive, without hand-editing config files.

One installer sets up everything below. Each improvement also has its own project, if you only want one.

| Improvement | What it does | Own project |
|---|---|---|
| **3-Finger-Cube-Gesture** | 3-finger swipe **up** opens KDE's Desktop Cube; swipe **down** closes it. When the cube effect is turned off, those swipes go back to KDE. | [Cynders-dev/3-Finger-Cube-Gesture](https://github.com/ARM64-Fedora-KDE-QoL/3-Finger-Cube-Gesture) |
| **Cube-Backside-Click** | Click the **back** of a desktop inside the open cube to switch to it (KDE's cube normally ignores that click). | [Cynders-dev/Cube-Backside-Click](https://github.com/ARM64-Fedora-KDE-QoL/Cube-Backside-Click) |

Both **keep themselves working after Fedora updates**: they rebuild or refresh automatically when KDE or KWin is updated, and show a notification when they do.

## Included versions

| Release of this collection | 3-Finger-Cube-Gesture | Cube-Backside-Click |
|---|---|---|
| **v1.0** (current) | v3.0 | v1.0 |

The copies in this repository's folders are maintained separately from the standalone projects, so this collection is updated and tested as a set.

## Requirements

- A laptop with a **touchpad**, running **Fedora with KDE Plasma 6** on **Wayland** (the default on Fedora KDE)
- A user account with `sudo` rights (the account created during Fedora setup has them)
- An internet connection

Built and tested on **ARM64 Linux Fedora 44 Asahi KDE Plasma**: Fedora Linux Asahi Remix 44 (KDE Plasma Desktop Edition) on an Apple Silicon MacBook (aarch64), with KDE Plasma / KWin 6.7.5. Nothing here is ARM-specific, so it should also work on regular Fedora KDE laptops, but that hasn't been tested yet.

## Install

You need `git` to download this project. If `git --version` says *command not found*, install it first:

```bash
sudo dnf install git
```

Then:

```bash
git clone https://github.com/ARM64-Fedora-KDE-QoL/ARM64-Fedora-KDE-QoL.git
cd ARM64-Fedora-KDE-QoL
./install.sh
```

**Without git:** click **Code → Download ZIP**, extract it, open a terminal in the extracted folder, and run `bash install.sh`.

Run it as your normal user, **not** with `sudo` in front. It asks for your password **once** at the start and then installs everything; the first run takes a few minutes. When it says **All done**, **log out and back in once** (needed to activate back-side clicking).

**Try it:**
1. Swipe **up** with three fingers: the Desktop Cube opens.
2. Click and drag downward to tilt the cube, then click the **back** of a desktop on the far side: you switch to it.
3. Open the cube again and swipe **down** with three fingers: it closes.

**Tip:** if you have several virtual desktops, turn on **System Settings → Window Management → Virtual Desktops → "Navigation wraps around"**. Then swiping left/right in the cube goes around the ring endlessly instead of stopping at the first and last desktop.

**Installing just one:** run `install.sh` inside that improvement's folder, e.g. `bash Cube-Backside-Click/install.sh`.

## Uninstall

```bash
./uninstall.sh            # removes both improvements
./uninstall.sh --purge    # also deletes their settings and downloaded source
```

Log out and back in afterwards.

## Details and troubleshooting

Each improvement's folder has a full README: what it changes on your system, how the automatic updates work, security notes, how to turn it off, and troubleshooting.

- [3-Finger-Cube-Gesture/README.md](3-Finger-Cube-Gesture/README.md)
- [Cube-Backside-Click/README.md](Cube-Backside-Click/README.md)

## Future improvements

This collection is meant to grow. New quality-of-life improvements for ARM64 Fedora KDE laptops will be added as their own folders, with a new release of this collection each time.

## License

Copyright (C) 2026 Cynders. Licensed under the [GNU General Public License v3.0 or later](LICENSE): you can use, modify and share this project, and any modified versions you distribute must stay open source under the same license. It comes with no warranty.

## Credits

- [InputActions](https://github.com/InputActions/kwin) by its developers (GPL-3.0), which 3-Finger-Cube-Gesture builds on.
- KDE Plasma's Desktop Cube effect by Vlad Zahorodnii (GPL-2.0-only OR GPL-3.0-only), which Cube-Backside-Click patches.
