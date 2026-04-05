# Mobile App Standards

**Applies to:** GigaFleet Mobile, AgendaHospice Mobile.
**Inherits from:** [Universal](universal.md), [Frontend](frontend.md)

## Key Differences from Admin

| Aspect | Admin | Mobile |
|--------|-------|--------|
| Components | Standalone | NgModule OK (business-logic module) |
| Framework | GigaDesk (`gd-`) | Ionic components |
| Grid | AG Grid Enterprise | Ionic lists, cards |
| State registration | Standalone | NgModule `forFeature()` |
| Network | Always online | Offline-capable |

## Ionic + Capacitor

- Ionic 8 for UI components
- Capacitor 7 for native plugins (camera, geolocation, background fetch)
- Tab-based navigation in driver module
- Platform-specific builds: `npx cap sync ios`, `npx cap sync android`

## Offline Patterns

- **Fire-and-forget writes** — optimistic state patching for poor connectivity
- Queue writes when offline, sync when back online
- Never block UI on network response for write operations
- Read operations can show loading state

## Formly Forms

- 82+ custom Formly templates (GigaFleet Mobile)
- Custom decorators for field types
- Form config-driven, not template-driven

## Context Pattern

- `MyAssignment` — current driver's assignment
- `CurrentRoute` — active route context
- Context switching drives what the driver sees
