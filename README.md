# NSwitch3DX+

An unofficial **Nintendo Switch** homebrew port of *Wangan Midnight Maximum Tune 3DX+*, built on top of [Super3DX+](https://github.com/smolderyguest/Super3DXPlus) and [Re3DX+](NOTICE.md) using `devkitPro`, `libnx`, `SDL2`, and OpenGL ES (`switch-mesa`).

> **Disclaimer:** This repository contains **source code and build tools only**. No copyrighted game assets, ROMs, or arcade dumps are included. You must supply your own legal dump of *Wangan Midnight Maximum Tune 3DX+* (Export or Japan).

---

## Features

- **Native 60 FPS on Nintendo Switch** (1080p Docked / 720p Handheld) via OpenGL ES 3.2 (`switch-mesa`).
- **Controller-First Menus:** Full Joy-Con and Pro Controller navigation, rebindable buttons/axes, deadzone tuning, and rumble support.
- **Complete Game Modes:** Story Mode (with Win Streak, Mileage Tally, and Car Aura), 10 Outrun, Time Attack, and LAN/Online Versus.
- **Streamlined Windows Builder:** Includes `setup-switch.bat` for automated physics recompilation (`--phys`), NRO compilation, and SD card packaging.

---

## Requirements

- **Nintendo Switch** running CFW (Atmosphère) — **Title Takeover (full RAM mode) is required** (hold `R` while launching any installed game to open Homebrew Menu; Applet Mode is not supported).
- **PC (Windows)** with:
  - [Python 3.9+](https://www.python.org/downloads/)
  - [devkitPro](https://devkitpro.org/) with `switch-dev`, `switch-sdl2`, `switch-mesa`, and `switch-glad` installed.
- Your own *Wangan Midnight Maximum Tune 3DX+* arcade game dump.

---

## Building for Nintendo Switch

1. Clone or download this repository.
2. Run **`setup-switch.bat`** and follow the on-screen prompts:
   - Verifies Python and devkitPro.
   - Generates synchronized physics (`phys_rc.c` + `data/phys.img`) via `tools/pipeline.py gen --phys`.
   - Compiles `super3dx+nx.nro` and packages the ready-to-copy SD card layout into `output-switch/`.

> **Important:** Always keep `super3dx+nx.nro` and `data/phys.img` from the **exact same build** to avoid `rc: bad address` crashes when entering a race.

---

## Installation on Switch SD Card

Copy the generated folder to the root of your Switch SD card so the structure looks like this:

```text
sdmc:/
└── switch/
    └── super3dx+nx/
        ├── super3dx+nx.nro
        └── data/
            ├── phys.img
            └── (converted game assets...)
Launch Homebrew Menu via Title Takeover and start Super3DX+ NX.

Credits & License
Super3DX+ NX (Switch Port): Holymagi

Upstream Projects: Super3DX+ & Re3DX+ contributors (see NOTICE.md)

License: See LICENSE for full details.
