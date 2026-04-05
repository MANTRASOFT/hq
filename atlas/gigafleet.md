# GigaFleet

White-label fleet management platform. Multi-vertical (fleet, hospice, gardening, etc.) — same core, different skins.

**GitHub Org:** [Giga-Enterprise](https://github.com/Giga-Enterprise)
**Local Path:** `/home/pascal/projects/giga-fleet/`
**Primary Issue Tracker:** `Giga-Enterprise/giga-fleet`

## Sub-Projects

| Short Name | Repo | Local Path | Tech | Purpose |
|------------|------|-----------|------|---------|
| `admin` | `giga-fleet-admin` | `giga-fleet/giga-fleet-admin` | Angular 20, NGXS 21, PrimeNG 20, AG Grid 35 | Dispatcher/admin web app |
| `mobile` | `giga-fleet-mobile` | `giga-fleet/giga-fleet-mobile` | Ionic 20, Angular 20, NGXS | Driver mobile app |
| `portal` | `giga-fleet-portal` | `giga-fleet/giga-fleet-portal` | Angular 20 | Customer-facing tracking portal |
| `demo` | `giga-demo` | `giga-fleet/giga-demo` | Angular 20 | Lightweight demo (no store) |
| `backend` | `giga-fleet-backend` | `giga-fleet/giga-fleet-backend` | Firebase Cloud Functions v2, Node 22 | Action-routed callables |
| `libs` | `giga-fleet-libs` | `giga-fleet/giga-fleet-libs` | TypeScript 5.9 | 13 shared @gigafleet/* packages |
| `cli` | `giga-fleet-cli` | `giga-fleet/giga-fleet-cli` | TypeScript, tsx | CLI tools (doc gen, deploy, seed, debug, compat) |
| `scripts` | `giga-fleet-scripts` | `giga-fleet/giga-fleet-scripts` | TypeScript | Seed, migration, maintenance scripts |
| `tests` | `giga-fleet-tests` | `giga-fleet/giga-fleet-tests` | TypeScript | E2E / integration tests |
| `apps-admin` | `giga-apps-admin` | — | — | Platform/tenant administration |

## Library Packages (@gigafleet/*)

### Build Order (5 tiers)

```
Tier 1: core-models, core-utils          (no internal deps)
Tier 2: backend-core, frontend-auth, frontend-io
Tier 3: backend-dao, frontend-dao, frontend-maps
Tier 4: backend-auth, frontend-ui, backend-messaging, backend-bigquery
Tier 5: backend-seed
```

## Status

- Admin: 40+ NGXS states, 13 operations + 25 setup screens, AG Grid everywhere
- Backend: 17 callable groups identical with AF, 6 callable entry points
- Mobile: scaffolded
- Portal: scaffolded
- Porting from AF: ~70% complete (95 AF-only features remain)
