# Compat Tires inventory

Generated for private tester hygiene (2026-09-19). Counts are approximate; re-count after regenerating clones.

## Families

| Family | Path / pattern | Notes |
| --- | --- | --- |
| Street size ladder | `vehicles/common/tires_ntf_street/` | Bulk of pack (~100 jbeams). Common F/R sizes. |
| GT3 NTF | `tires_{F,R}_gt3_NTF*.jbeam` | Hard / Medium / Soft / Supersoft + baseline. Scintilla meshes. |
| Sunstorm NTF | `tires_{F,R}_sunstorm_NTF_*.jbeam` | Hard / Medium / Soft / Supersoft. |
| ETKC GT3 NTF | `tires_{F,R}_etkc_gt3_NTF.jbeam` | **Smoke-before-advertise** with Pigniteon ETK Racing. |
| Scintilla configs | `vehicles/scintilla/*.pc` | **Two only** — `gt3_ntf_baseline` + `gt3_ntf_endurance` (mirrors GT3 pack Baseline / Endurance). |

## Standards

- **`numRays`: 16** on all pressure wheels (Convert-Tires forces 16).
- Names contain `NTF` so core classify routes them to NTF spectra.
- No meshes/textures — companion car mods supply those.

## Advertise carefully

- **Scintilla GT3 NTF configs** — primary tester path (confirmed).
- **ETKC / Pigniteon** — optional; smoke in-game before listing copy pushes it hard.
- Core thermals work on **stock** tires without this pack.
