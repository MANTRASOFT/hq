# AgendaFleet

Legacy fleet management platform. Powers FleetGenius, UWS, and CMAX customers. In maintenance mode — primary role is as porting reference for GigaFleet.

**GitHub Owner:** [pdemilly](https://github.com/pdemilly) (personal account)
**Local Path:** `/home/pascal/projects/agenda-fleet/`

## Sub-Projects

| Short Name | Repo | Local Path | Tech | Purpose |
|------------|------|-----------|------|---------|
| `af-admin` | [`agenda-fleet-admin`](https://github.com/pdemilly/agenda-fleet-admin) | `agenda-fleet/agenda-fleet-admin` | Angular 8 | Legacy admin app |
| `af-backend` | [`agenda-fleet-backend-2`](https://github.com/pdemilly/agenda-fleet-backend-2) | `agenda-fleet/agenda-fleet-backend-2` | Firebase Cloud Functions | Shared backend (AF + GF both use this) |
| `af-mobile` | `agenda-fleet-mobile-3-hotfix` | `agenda-fleet/agenda-fleet-mobile-3-hotfix` | Ionic | Legacy driver mobile app |
| `af-portal` | `agenda-fleet-client-portal2` | `agenda-fleet/agenda-fleet-client-portal2` | Angular | Legacy customer portal |
| `af-cli` | `agenda-cli` | `agenda-fleet/agenda-cli` | TypeScript | Legacy CLI (to be merged into unified CLI) |
| `af-tower` | `agenda-fleet-tower-uws` | `agenda-fleet/agenda-fleet-tower-uws` | — | UWS tower/dispatch app |
| `af-docs` | `agenda-fleet-docs` | `agenda-fleet/agenda-fleet-docs` | — | Documentation |

## Notes

- `af-backend` is shared — both AgendaFleet and GigaFleet customers hit this backend
- Legacy customers (UWS, CMAX) remain on jacklighter infra, new customers go GigaFleet-native
- AF admin is the primary porting reference for GF admin features
