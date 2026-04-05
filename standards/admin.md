# Admin App Standards

**Applies to:** GigaFleet Admin, AgendaHospice Admin, GigaFleet Apps-Admin.
**Inherits from:** [Universal](universal.md), [Frontend](frontend.md)

## GigaDesk Framework

GigaDesk is the API — PrimeNG never bleeds to app code.

- **Never import AG Grid directly** — use `gd-data-table` with config
- **Never import PrimeNG directly** — use `gd-` prefixed controls
- **Never raw HTML controls** — use business controls (`gd-select`, `gd-date-picker`, `gd-toggle`)
- Features declare WHAT, framework renders HOW

### Component Prefixes

| Prefix | Where | Purpose |
|--------|-------|---------|
| `gf-` | frontend-ui lib | Cross-app (admin, portal, mobile) |
| `gd-` | admin shared controls | Admin-specific framework |

## Config-Driven Screens

Screens should be config-driven, not HTML templates:

- `DataTableConfig` — columns, actions, modes, pagination
- `ScreenConfig` — header, renderer, drawers, toolbar
- `RouteAnalysisConfig` — sections, interactivity, presets

Config = behavior. Options = appearance. Always separate, never mix.

## AG Grid Enterprise

- Licensed — use for all data tables
- Always through `gd-data-table` abstraction
- Column types: Text, Number, Currency, Date, Status, Badge, Avatar, etc.
- `IDataSource<T>` with signals for reactive data

## Layout Framework

- Admin screens use framework layout components — zero feature CSS
- Layout auto-detects children by type
- Drawer doubling is a framework pattern, not app concern
- Preview panel goes in the right drawer, not bottom drawer

## Buttons

- Never individual `<button>` tags in feature code
- Always `gd-icon-buttons` with config array
- Container decides collapse behavior (overflow, icons-only, hide)

## Setup Screens

- All setup screens include a search/filter bar
- Every entity gets the standard admin treatment:
  - Tutorial page, list page, editor page, overview page
  - Quick-view in right drawer
  - `public_api.ts` exports CoreModule + Cache + types

## Smart Elements

- Business layer uses smart elements only — no raw HTML
- Consistent look guaranteed across all features

## Font Size

- Font size control via CSS custom properties
- Never hardcode px values
