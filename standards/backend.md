# Backend Standards

**Applies to:** GigaFleet Backend, AgendaHospice Backend, AgendaFleet Backend.
**Inherits from:** [Universal](universal.md)

## Architecture: Action-Routed Callables

Single Cloud Function routes by action to module functions:

```typescript
export const tasksFn = onCall(async (request) => {
  return routeAction('TSK', 'tasksFn', action, {
    createTask: () => TasksModule.createTask(ctx, params),
    getTasks: () => TasksModule.getTasks(ctx, params),
  });
});
```

### Callable Groups

GigaFleet: `authFn`, `tasksFn`, `dispatchFn`, `routingFn`, `driversFn`, `adminFn`

### Module Pattern (4 files)

```
modules/feature/
├── feature.module.ts     # exported functions
├── feature.context.ts    # ModuleContext type
├── feature.types.ts      # params + response types
└── index.ts              # barrel exports
```

## Context Pattern

```typescript
type FeatureModuleContext = ModuleContext<'collection1' | 'collection2'>;
```

Context provides typed access to Firestore collections. Built by `buildFleetContext(org_id, caller)`.

## DAO Services

- Extend `CollectionWrapper` or `OrgBasedCollectionWrapper`
- Never raw Firestore queries in module functions
- DAO handles serialization, validation, typing

## Logging

- `consoleDebug()` with prefix codes: `[TSK002]`, `[DRV005]`
- Each module has unique 3-letter prefix
- Sequential numbering within module
- Error codes: `[TSKE01]` (E suffix for errors)

## BigQuery

- Use BigQuery for historical/analytical queries, not Firestore
- **ALWAYS partition-prune by `schedule_date`** — full table scans are expensive
- Cost: Firestore $0.06/100K reads vs BigQuery $5/TB

## Error Handling

- Validate inputs at callable boundary (assert + HttpsError)
- Typed error responses, never generic error strings
- Log the error with prefix code before throwing

## Authentication & Authorization

- `requireAuth(request)` on every callable
- `requireOrgId(data)` — org scoping
- Role-based: drivers see own data, admins/managers see all
- `extractCaller(request)` for audit trail

## Deployment

- Firebase Cloud Functions v2
- Memory/timeout configured per callable
- Individual deploy: `firebase deploy --only functions:tasksFn`
