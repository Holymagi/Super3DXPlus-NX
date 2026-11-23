# Changelog

What **Super3DX+ NX** adds for Nintendo Switch, along with the core improvements inherited from [Super3DX+](https://github.com/smolderyguest/Super3DXPlus) over [Re3DX+](NOTICE.md). Longer explanations are in `docs/`.

---

## Nintendo Switch (Super3DX+ NX)

- **Native Nintendo Switch Port:** Built with `devkitPro`, `libnx`, `SDL2`, and OpenGL ES (`switch-mesa`) for native execution via Homebrew Menu (Title Takeover recommended).
- **Streamlined Switch Builder (`setup-switch.bat`):** Guided Windows setup script that checks Python & devkitPro, installs the Zig C++ demangler automatically, runs synchronized `--phys` physics generation, compiles `super3dx+nx.nro`, and packages the ready-to-copy SD card layout (`output-switch/switch/super3dx+nx/`).
- **Physics & Build Fixes:**
  - Fixed macro conflicts in `src/phys/rc_runtime.c` during Switch compilation.
  - Enforced synchronized `phys_rc.c` + `data/phys.img` generation via `--phys` to prevent `rc: bad address` crashes when entering races.
- **Switch Networking & Polish:**
  - Added Switch socket initialization and network diagnostics.
  - Applied the Versus READY-button fix and matching NRO icon/metadata.
  - Cleaned up repository documentation (`README.md`) and build scripts to focus on Nintendo Switch deployment.

---

## Input & Menus (Core)

- **Controller-First Menus:** Full Joy-Con / Pro Controller navigation on every screen with rebindable buttons and analog axes.
- **Input Tuning & Rumble:** Adjustable deadzone, response curve, input filtering, button-steering speed, and vibration strength (wall hits, expansion joints, tire slip).
- **Camera Shake:** Adjustable 0%–100% camera shake smoothing at high speed and over rough roads.
- **Rebuilt Menu Flow:** `PLAY / SETTINGS / EXIT` → Car Selection → `Solo / Versus / Car Settings`.
- **Starting Points & Tuning:** Stock, Full Tune, and Hell's Tuning (starts Story Mode on Ch. 101), plus restored AT/MT transmission select, special car colors, and suspension lowering for tuned cars.
- **Graphics & Audio Options:** Dedicated `GRAPHICS` sub-menu (textures, reflections, HD textures, wet road, anti-aliasing) and a Volume Mixer including separate `ENGINE` and `TURBO` sliders (with turbo whine rebalanced to match the original arcade mix).
- **Intro Cutscenes:** Option to skip intro cutscenes, plus restored missing cutscenes and Information screen.
- **Customizable Touch Layout:** Optional touch controls and resizable/draggable HUD gauges (50%–200%) with separate Shift Up / Shift Down placement.

---

## Game Modes (Core)

- **LAN / Online Versus:**
  - Fixed versus synchronization, route choice at junctions, last-stretch calls, placings, and disconnect handling.
  - Fixed an issue where the second race of a session could hang indefinitely at the start.
  - Added `READY` confirmation before each round (with `AUTO READY` option), 30-second stall recovery, rival ping indicator (`P: ms`) under `ADVANTAGE`, and restored headlight flash (`HEADLIGHT FLASH`).
  - Added `NETWORK OPTIONS` with live connection stats, detailed net logging, and scrubbed logs (removes IPs and room codes for safe sharing).
- **Story Mode:**
  - Added `WIN STREAK` and `CHAPTERS CLEARED` displays on the card screen, `N WINS` indicator on victory screens, and `THIS TIME` session mileage.
  - Restored arcade goal sequence (negated screen with rival's closing line and face) and last-stretch distance callouts (`Remaining 5 km` / `Remaining 3 km`, `Don't get caught!`, `Keep going!`).
- **10 Outrun:** Restored special OST, track and time-zone selection, rival line animation, rival markers, and smoother mid-race asset preloading.
- **Time Attack:** Persistent rankings with car class and level saved across sessions.
- **Music Selection:** Defaults to `RANDOM` each session, with host/winner music selection in Versus.

---

## Graphics, Audio & Bug Fixes (Core)

- **Mileage Tally & Car Aura:** Rebuilt end-of-session mileage tally screen (toggleable via `MILEAGE SCREEN` in Options) and multi-layer car aura flames starting from 5,000 km up to 500,000 km (`data/aura.wpk`).
- **3D Course Select Miniatures:** Restored 3D route miniatures and running glow across all cities—Tokyo, Nagoya, Osaka, Fukuoka, and Hakone (`data/minicourse.wpk`), plus fixed Windows path-slash texture bugs.
- **Roof / First-Person Meter Layout:** Restored arcade-accurate speedometer, tachometer, and boost gauge positioning in first-person view for all cars and meter styles.
- **Map & Lighting Fixes:**
  - Fixed checkered/see-through reflective buildings on morning Tokyo maps (New Belt Line, C1, Yokohane).
  - Fixed solid white wall artifact at the C1 inward tunnel exit (~10.8 km).
  - Restored rival car reflections, tire smoke, headlight flares, shift light, and junction-choice walls.
- **Car & Dress-Up Fixes:**
  - Fixed missing tuned parts (exhaust, roll cage, lowering) on alternate trim colors (Evo RS, GC8 RA, R34 Nür, 964 RS, etc.).
  - Fixed Nissan R35 offering unavailable arcade body parts (preventing missing-bonnet artifacts).
  - Aligned exhaust flames accurately to tuned exhaust pipes (e.g., Savanna RX-7 single pipe).
- **Countdown & Audio Polish:** Fixed Export & Japan manual-gear countdown display, silenced car engine audio immediately upon crossing the goal line, and restored arcade countdown/odometer sound effects.
- **Export & JPN Support:** Full support for Export (English) and Japan game dumps via `build.py` and `tools/pipeline.py`.