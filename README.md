# NSwitch3DX+

![Platform](https://img.shields.io/badge/Platform-Nintendo%20Switch-E60012?style=flat-square&logo=nintendoswitch&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)
![Backend](https://img.shields.io/badge/Graphics-OpenGL%20ES%203.2%20(switch--mesa)-5586A4?style=flat-square)

An unofficial **Nintendo Switch** homebrew port of *Wangan Midnight Maximum Tune 3DX+*, built on top of [Super3DX+](https://github.com/smolderyguest/Super3DXPlus) and [Re3DX+](NOTICE.md) using `devkitPro`, `libnx`, `SDL2`, and OpenGL ES (`switch-mesa`).

> **Disclaimer:** This repository contains **source code and build tools only**. No copyrighted game assets, ROMs, or arcade dumps are included. You must supply your own legal dump of *Wangan Midnight Maximum Tune 3DX+* (Export or Japan).

---

## Features

- **Native 60 FPS Performance:** Runs at 1080p Docked / 720p Handheld via OpenGL ES 3.2 (`switch-mesa`).
- **Controller-First Experience:** Full Joy-Con and Pro Controller menu navigation, rebindable buttons/axes, deadzone tuning, and rumble support.
- **Complete Game Modes:** Story Mode (with Win Streak, Mileage Tally, and Car Aura), 10 Outrun, Time Attack, and LAN/Online Versus.
- **Automated Windows Build Script:** Includes `setup-switch.bat` to handle physics recompilation (`--phys`), NRO compilation, and ready-to-copy SD card packaging.

---

## Requirements

### Nintendo Switch
- CFW (**Atmosphère**) installed.
- **Title Takeover (Full RAM Mode) is required:** Hold `R` while launching any installed game to open the Homebrew Menu. **Applet Mode is not supported.**

### PC (for Building on Windows)
- [Python 3.9+](https://www.python.org/downloads/)
- [devkitPro](https://devkitpro.org/) with the following packages installed:
  - `switch-dev`
  - `switch-sdl2`
  - `switch-mesa`
  - `switch-glad`
- Your own *Wangan Midnight Maximum Tune 3DX+* arcade game dump.

---

## Building from Source

1. Clone or download this repository.
2. Run **`setup-switch.bat`** and follow the on-screen prompts. The script will automatically:
   - Verify your Python and devkitPro installations.
   - Generate synchronized physics (`phys_rc.c` + `data/phys.img`) via `tools/pipeline.py gen --phys`.
   - Compile `super3dx+nx.nro` and package the SD card layout into `output-switch/`.

> **Important:** Always keep `super3dx+nx.nro` and `data/phys.img` from the **exact same build**. Mixing files from different builds will cause `rc: bad address` crashes when entering a race.

---

## Installation on Switch

Copy the generated folder from `output-switch/` to the root of your Nintendo Switch SD card so the directory structure matches this layout:

```text
sdmc:/
└── switch/
    └── super3dx+nx/
        ├── super3dx+nx.nro
        └── data/
            ├── phys.img
            └── (converted game assets...)

1.Boot into Atmosphère

2.Open the Homebrew Menu via Title Takeover (hold R while launching any installed title)

3.Launch NSwitch3DX+

Credits & License
NSwitch3DX+ (Nintendo Switch Port): Holymagi

Upstream Projects: Super3DX+ & Re3DX+ contributors — see NOTICE.md for full attributions.

License: Distributed under the MIT License — see LICENSE for details.

