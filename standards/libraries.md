# Library Standards

**Applies to:** GigaFleet Libs, AgendaHospice Libs, Mantrasoft Platform.
**Inherits from:** [Universal](universal.md)

## Package Boundaries

- Each package is independently replaceable
- Zero runtime dependencies for core-models
- Frontend packages never import backend packages (and vice versa)
- `public_api.ts` is the only entry point — everything else is internal

## Build Tiers

Build in dependency order. A package only depends on packages in lower tiers.

### GigaFleet Libs (5 tiers)
```
Tier 1: core-models, core-utils
Tier 2: backend-core, frontend-auth, frontend-io
Tier 3: backend-dao, frontend-dao, frontend-maps
Tier 4: backend-auth, frontend-ui, backend-messaging, backend-bigquery
Tier 5: backend-seed
```

## Conventions

- JSDoc on public APIs — for editor tooling (hover, autocomplete)
- Never JSDoc on internal functions
- `IdentityObject` / `OrgBasedObject` patterns for domain models
- Promises for backend, Observables for frontend
- Feature packages: `models/`, `services/`, `index.ts`

## Linking

- Frontend apps use `file:` links to libs source — changes picked up on rebuild
- Backend uses tarballs — re-pack and reinstall after editing

```bash
# Frontend: edit lib → build lib → app picks up changes
cd giga-fleet-libs && npm run build -w packages/core-models

# Backend: edit lib → build → re-pack → npm install
cd giga-fleet-libs && npm run build -w packages/backend-dao
cd ../giga-fleet-backend && npm install
```

## Publishing

- GitHub Packages registry
- Tiered build order respected in CI
- Version bumps coordinated across packages
