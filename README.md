# Tire Wear and Thermals ReSpin — Tires

Optional **ReSpin Tires** companion for [Tire Wear and Thermals ReSpin](https://github.com/antoniomdavis36749/Tire-Wear-and-Thermals-ReSpin).

This repo ships **JBeam-only** selectable `*_Respin` tire clones. Meshes stay in vanilla BeamNG or in the companion car mods. It is **not** a standalone thermals mod — install **core ReSpin** first.

## Latest (0.1.2)

- Street / vanilla-wheel gap-fill: **Sport Plus**, **Track Day**, **Hard C2**, **Medium C3**
- Native Sport / Race / Standard are **not** replaced
- Scintilla GT3 Respin slicks (Soft C4 + Hard/Medium/Soft SKUs)
- Pigniteon ETKC Grip-All GT3 Respin tires

## Install

1. Install [core ReSpin](https://github.com/antoniomdavis36749/Tire-Wear-and-Thermals-ReSpin) (thermals + UI apps).
2. Install this companion (unpacked folder or `TireWearThermalsReSpin_CompatTires.zip`).
3. For GT3 clones, also install the matching car mod for meshes:
   - [Scintilla GT3 Racing Parts](https://www.beamng.com/resources/scintilla-gt3-racing-parts.23027/)
   - Pigniteon ETK Racing
4. Parts → tires → pick a name ending in **Respin**.

Street SKUs use vanilla `common.zip` meshes. GT3 SKUs use the car-mod meshes.

## Why a second zip / repo

BeamNG mounts any package that contains `vehicles/` as a vehicle mod. If those JBeams live inside the core ReSpin zip, `ui/` and `lua/` never mount and the apps disappear.

| Resource | GitHub | Zip |
| --- | --- | --- |
| Core ReSpin (thermals + UI) | [Tire-Wear-and-Thermals-ReSpin](https://github.com/antoniomdavis36749/Tire-Wear-and-Thermals-ReSpin) | `TireWearThermalsReSpin_*.zip` |
| ReSpin Tires (this repo) | [Tire-Wear-and-Thermals-ReSpin-Tires](https://github.com/antoniomdavis36749/Tire-Wear-and-Thermals-ReSpin-Tires) | `TireWearThermalsReSpin_CompatTires.zip` |

```powershell
.\tools\scripts\Pack-Release.ps1
```

Inventory and part names: **`COMPAT_TIRES.md`**. Listing copy-paste: **`LISTING.md`**.

## Legal

GNU Affero General Public License v3 — see `license`.

Do **not** redistribute companion meshes, textures, or sounds. Upstream car/tire authors are optional companions, not ReSpin contributors. Scintilla listing stills are used with courtesy permission.

Discussion: https://www.beamng.com/threads/tire-wear-and-thermals-respin-%E2%80%94-discussion-feedback-compat.111238/
