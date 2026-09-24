# Node-Thermal Friction — Compat Tires

Optional companion to **Node-Thermal Friction** (core). Ships `vehicles/` only — JBeam
tire clones and a few Scintilla GT3 configs. Does **not** include thermals, HUDs, or ducts.

| | |
| --- | --- |
| **Requires** | Core Node-Thermal Friction ([Repo 39082](https://www.beamng.com/resources/tire-wear-and-thermals-respin.39082/)) |
| **This listing** | [Repo 39083](https://www.beamng.com/resources/tire-wear-and-thermals-respin-%E2%80%94-compat-tires.39083/) |
| **Unpacked folder** | `Node-Thermal-Friction-Tires-dev` |
| **Ray standard** | `numRays`: **16** (do not raise globally — modded cars break at 18–24) |

## Why a second mod?

BeamNG treats any zip that contains `vehicles/` as a vehicle mod and hides `ui/` / `lua/`.
Core must stay thermals-only; Compat stays parts-only. Enable **both** when you want NTF
selectable tires.

## What’s inside

See **`INVENTORY.md`**. Summary:

- **Street size ladder** — `vehicles/common/tires_ntf_street/` (F/R pairs across common sizes)
- **GT3 NTF slicks** — Hard / Medium / Soft / Supersoft (+ baseline) for Scintilla meshes
- **Sunstorm NTF slicks** — Hard / Medium / Soft / Supersoft
- **ETKC GT3 NTF** — F/R pair (smoke before advertising with Pigniteon ETK Racing)
- **Scintilla configs** — `gt3_ntf_baseline.pc` + `gt3_ntf_endurance.pc` only (mirrors GT3 pack Baseline / Endurance; compound ladder lives in AMD Customs Collection)

Meshes stay in the car packs (Scintilla GT3 Racing Parts, etc.). This zip only adds
JBeam definitions that classify cleanly under NTF.

## Are these tires special?

**Mostly catalog + classify — not magic rubber (for now).**

1. **Catalog (now):** NTF-named parts and configs so Soft / Med / Hard / Sport land in the shop.
2. **Classify (now):** Tuned `tread` / `softness` / names so core maps them onto locked spectra. Stock tires still get full thermals/wear via classify.
3. **Physics special (later):** One-off “special rubber” (e.g. high-climb configs with unique μ/life) — **not** the default pack. Tabled until after catalog coverage.

Core alone is enough for any native tire. Compat is optional convenience + calibrated routing.

## Install

1. Enable **core** Node-Thermal Friction.
2. Enable this Compat pack (zip or `-dev` unpack).
3. Disable duplicate Repo copies of 39082/39083 if using `-dev`.
4. Spawn car → Parts → tires → **NTF**, or load a **GT3 NTF** Scintilla config.
5. Apps: Classic or Crew from **core** (Pitwall is `-dev` only).

## Pack

From the core repo tools (points at the live tires unpack by default):

```powershell
.\tools\scripts\Pack-Compat-Release.ps1 -ZipName 'NodeThermalFriction_CompatTires.zip'
```

Or set `-TiresRoot` to your tires unpack / git root.
