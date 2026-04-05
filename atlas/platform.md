# Mantrasoft Platform

Shared libraries and tooling used across all products (GigaFleet, AgendaFleet, AgendaHospice).

**GitHub:** [pdemilly/mantrasoft](https://github.com/pdemilly/mantrasoft)
**Local Path:** `/home/pascal/projects/mantrasoft/`

## Packages

| Package | Purpose |
|---------|---------|
| `@mantrasoft/core-models` | Shared domain models |
| `@mantrasoft/core-utils` | Shared utilities |
| `@mantrasoft/core-interfaces` | Cross-product interfaces |
| `@mantrasoft/backend` | Shared backend services and DAOs |
| `@mantrasoft/fleet-backend` | Fleet-specific backend (used by AF + GF) |
| `@mantrasoft/debug-cli` | Debug CLI tools |

## CLI (planned unification)

Currently three separate CLIs:
- `giga-fleet-cli` (GigaFleet)
- `agenda-cli` (AgendaFleet)
- Hospice has no dedicated CLI

**Plan:** Merge into `@mantrasoft/cli`, keep `ag` command name, cross-project aware. Issue: `Giga-Enterprise/giga-fleet#521`.
