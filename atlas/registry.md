# Project Registry

**This is the single source of truth for all projects, repos, and paths. All tools and skills reference this file.**

## GitHub Organizations

| Org | Owner | Products |
|-----|-------|----------|
| [Giga-Enterprise](https://github.com/Giga-Enterprise) | Pascal | GigaFleet |
| [agenda-hospice](https://github.com/agenda-hospice) | Pascal | AgendaHospice |
| [MANTRASOFT](https://github.com/MANTRASOFT) | Pascal | HQ, platform ops |
| [pdemilly](https://github.com/pdemilly) | Pascal | AgendaFleet, Mantrasoft libs, B2B, personal |

## All Projects

### GigaFleet

**Monorepo root:** `/home/pascal/projects/giga-fleet/` (repo: `Giga-Enterprise/giga-fleet`)

| Short | GitHub Repo | Local Path | Purpose |
|-------|------------|-----------|---------|
| `admin` | `Giga-Enterprise/giga-fleet-admin` | `giga-fleet/giga-fleet-admin` | Angular 20 admin app |
| `mobile` | `Giga-Enterprise/giga-fleet-mobile` | `giga-fleet/giga-fleet-mobile` | Ionic 20 driver app |
| `portal` | `Giga-Enterprise/giga-fleet-portal` | `giga-fleet/giga-fleet-portal` | Customer tracking portal |
| `demo` | `Giga-Enterprise/giga-demo` | `giga-fleet/giga-demo` | Demo app (no store) |
| `backend` | `Giga-Enterprise/giga-fleet-backend` | `giga-fleet/giga-fleet-backend` | Firebase Cloud Functions v2 |
| `libs` | `Giga-Enterprise/giga-fleet-libs` | `giga-fleet/giga-fleet-libs` | 13 @gigafleet/* packages |
| `cli` | `Giga-Enterprise/giga-fleet-cli` | `giga-fleet/giga-fleet-cli` | CLI tools |
| `scripts` | `Giga-Enterprise/giga-fleet-scripts` | `giga-fleet/giga-fleet-scripts` | Migration/seed scripts |
| `tests` | `Giga-Enterprise/giga-fleet-tests` | `giga-fleet/giga-fleet-tests` | E2E tests |
| `apps-admin` | `Giga-Enterprise/giga-apps-admin` | `giga-fleet/giga-apps-admin` | Platform/tenant administration |

**Issue tracker:** `Giga-Enterprise/giga-fleet` (all sub-projects)

**Also in monorepo:** `apps/`, `credentials/`, `docs/`, `scripts/`, `src/`

### AgendaFleet (legacy)

**Root:** `/home/pascal/projects/agenda-fleet/`

| Short | GitHub Repo | Local Path | Purpose |
|-------|------------|-----------|---------|
| `af-admin` | `pdemilly/agenda-fleet-admin` | `agenda-fleet/agenda-fleet-admin` | Angular 8 admin (porting reference) |
| `af-backend` | `pdemilly/agenda-fleet-backend-2` | `agenda-fleet/agenda-fleet-backend-2` | Shared backend (AF + GF) |
| `af-mobile` | local worktree of `agenda-fleet-mobile-3` | `agenda-fleet/agenda-fleet-mobile-3-hotfix` | Legacy mobile (hotfix branch) |
| `af-portal` | `pdemilly/agenda-fleet-client-portal2` | `agenda-fleet/agenda-fleet-client-portal2` | Customer portal v2 |
| `af-portal-v1` | `pdemilly/agenda-fleet-client-portal` | `agenda-fleet/agenda-fleet-client-portal` | Customer portal v1 |
| `af-cli` | `pdemilly/agenda-cli` | `agenda-fleet/agenda-cli` | Legacy CLI (to be unified) |
| `af-tower` | `pdemilly/agenda-fleet-tower-uws` | `agenda-fleet/agenda-fleet-tower-uws` | UWS tower/dispatch app |
| `af-docs` | `pdemilly/agenda-fleet-docs` | `agenda-fleet/agenda-fleet-docs` | Documentation |
| `af-tests` | `pdemilly/agenda-fleet-tests` | `agenda-fleet/agenda-fleet-tests` | Tests |
| `af-forms` | `pdemilly/agenda-fleet-forms` | `agenda-fleet/agenda-fleet-forms` | Forms module |

**Issue tracker:** `pdemilly/agenda-fleet-admin` (primary), `pdemilly/agenda-fleet-backend-2` (backend)

**Inactive/archived in same directory:** `agenda-backend-2`, `agenda-fleet-engine`, `agenda-fleet-home`, `agenda-fleet-import-db`, `agenda-fleet-mobile-3`, `agenda-fleet-mobile2`, `agenda-fleet-mobile-react`, `old/`, various third-party forks

### AgendaHospice

**Root:** `/home/pascal/projects/agenda-hospice/`

| Short | GitHub Repo | Local Path | Purpose |
|-------|------------|-----------|---------|
| `ah-admin` | `agenda-hospice/agenda-hospice-admin` | `agenda-hospice/agenda-hospice-admin` | Hospice admin app |
| `ah-backend` | `agenda-hospice/agenda-hospice-backend` | `agenda-hospice/agenda-hospice-backend` | Hospice backend |
| `ah-portal` | `agenda-hospice/agenda-hospice-client-portal` | `agenda-hospice/agenda-hospice-client-portal` | Patient/family portal |
| `ah-mobile` | `agenda-hospice/agenda-hospice-mobile` | `agenda-hospice/agenda-hospice-mobile` | Hospice mobile app |
| `ah-libs` | `agenda-hospice/agenda-hospice-libs` | `agenda-hospice/agenda-hospice-libs` | Shared hospice packages |
| `ah-demo` | `agenda-hospice/agenda-hospice` (monorepo) | `agenda-hospice/agenda-hospice-demo` | Demo app |
| `ah-docs` | `agenda-hospice/agenda-hospice-docs` | `agenda-hospice/agenda-hospice-docs` | Documentation |
| `ah-apps-admin` | `agenda-hospice/agenda-hospice` (monorepo) | `agenda-hospice/agenda-hospice-apps-admin` | Tenant administration |

**Issue tracker:** `agenda-hospice/agenda-hospice-admin` (primary)

**Note:** `ah-demo` and `ah-apps-admin` both point to `agenda-hospice/agenda-hospice` repo (monorepo pattern)

### B2B / Special Projects

**Root:** `/home/pascal/projects/giga/`

| Short | GitHub Repo | Local Path | Purpose |
|-------|------------|-----------|---------|
| `b2b` | `pdemilly/giga-fleet-b2b` | `giga/giga-fleet-b2b` | B2B integrations (separate Firebase projects) |
| `recycla` | no remote | `giga/giga-fleet-recycLA` | RecycLA-specific project |

### Platform

| Short | GitHub Repo | Local Path | Purpose |
|-------|------------|-----------|---------|
| `mantrasoft` | `pdemilly/mantrasoft` | `mantrasoft` | Shared platform libraries |
| `hq` | `MANTRASOFT/hq` | `mantrasoft-hq` | Team HQ — atlas, board, SOPs |

**Issue tracker:** `pdemilly/mantrasoft` (platform), `MANTRASOFT/hq` (ops)

## Pinned Issues (standard per product repo)

Every product should have 3 pinned issues: **Status**, **Session Queue**, **Architecture Decisions**

| Product | Status | Session Queue | Architecture |
|---------|--------|--------------|--------------|
| GigaFleet | [giga-fleet#533](https://github.com/Giga-Enterprise/giga-fleet/issues/533) | [giga-fleet#534](https://github.com/Giga-Enterprise/giga-fleet/issues/534) | [giga-fleet#535](https://github.com/Giga-Enterprise/giga-fleet/issues/535) |
| AgendaHospice | [ah-admin#76](https://github.com/agenda-hospice/agenda-hospice-admin/issues/76) | [ah-admin#77](https://github.com/agenda-hospice/agenda-hospice-admin/issues/77) | [ah-admin#78](https://github.com/agenda-hospice/agenda-hospice-admin/issues/78) |
| Mantrasoft | TBD | TBD | TBD |

## Operations

| What | Where |
|------|-------|
| Daily Board | [MANTRASOFT/hq#1](https://github.com/MANTRASOFT/hq/issues/1) |
| Project Overview | [MANTRASOFT/hq#2](https://github.com/MANTRASOFT/hq/issues/2) |
