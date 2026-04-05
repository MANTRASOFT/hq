# Frontend Standards

**Applies to:** All Angular/Ionic frontend applications (admin, mobile, portal).

## The Architecture: State → Context → Cache → Template

This is THE flow. No exceptions, no shortcuts.

```
Component dispatches action
  → State handles it (logic + persistence + side effects)
    → Cache derives view model (read-only selectors)
      → Component renders (select from cache, dispatch actions)
```

### Layer Responsibilities

| Layer | Does | Never Does |
|-------|------|-----------|
| **Action** | Declares intent | Contains logic |
| **State** | Handles logic, persistence, side effects | Touches DOM |
| **Cache** | Derives view models, memoized selectors | Has side effects |
| **Service** | Utility (DOM, HTTP, calculations) | Holds state |
| **Component** | Reads cache, dispatches actions, renders | Contains business logic |

### Boundary Violations (NEVER)

- Component reads sessionStorage → NO (state does that)
- State touches DOM → NO (service does that)
- Cache has side effects → NO (it's pure derivation)
- Directive calls Firestore → NO (state does that)

## NGXS Store Patterns

### Actions

```typescript
const topic = '[feature-name]';

export class RequestLoadItems {
  static readonly type = `${topic} Request Load`;
  constructor(public params?: { date?: string }) {}
}
```

- `const topic` always — lowercase-dash in brackets
- **Pass full objects**, never just IDs
- From user/view: `Request` prefix (`RequestCreateTask`)
- Internal/system: `Action` prefix (`ActionTasksLoaded`)
- **Never use `payload`** — name params: `task`, `visible`, `radius`

### State

- `select()` and `dispatch()` standalone functions — never inject Store
- `cancelUncompleted: true` on Observable-returning actions
- StateModel is **private** — never exported from the file
- Return `EMPTY` when @Action has non-observable code path

### Cache

- `@Selector()` decorator, never `createSelector`
- Cache transforms domain models → view models
- View models hold reference to domain object: `{ task: AppTask; isOverdue: boolean }`
- Templates never compare enums — cache provides pre-computed booleans
- `DataSource` pattern with signals for reactive data

### Store File Structure

Flat for simple features. Nested when multiple:
```
feature/store/
├── actions/feature.actions.ts
├── states/feature.state.ts
├── caches/feature.cache.ts
└── models/feature.models.ts
```

## Components

- **Anemic controllers** — select + dispatch + template. ZERO logic.
- Separate files always: `.ts`, `.html`, `.scss` — never inline
- `userIntent()` / `userIntentStub()` for user-facing actions
- `dispatch()` for load/select actions
- `declareLocalState` for UI state, not many individual signals
- `input()` / `output()` signal functions only for low-level/reusable components
- No `ngModel` — use typed `FormGroup`
- No `routerLink` — navigation via intents/actions

## CSS

- **CSS Grid** for all page layouts — never flexbox for structure
- `display: flex` only for inline elements (button row, icon + label)
- Children never set own width/height — parent grid controls it
- `:host { display: block; height: 100%; }`
- `overflow: hidden` on grid containers, `overflow: auto` only on the leaf that scrolls
- No `100vh` except shell root — everything else `100%`
- No `position: absolute` for layout
- All sizes via CSS custom properties
- CSS subgrid + `clamp()` for responsive
- **No hover-dependent UI** — dispatchers use tablets, all interactions tap-friendly

## Navigation

- Dynamically generated from org config
- `Organization.featureFlags` — which modules are enabled
- `OrgState.navOverrides` — customize labels/ordering
- User roles filter admin-only screens

## Data Access

- Never `@angular/fire` directly — always DAO services
- No dynamic imports except lazy-loaded routes

## Feature Structure

```
feature/
├── pages/           # route-level components
├── components/      # feature-specific components
├── modals/          # dialogs
├── store/           # actions, states, caches, models
├── public_api.ts    # exports: CoreModule + Cache + types only
├── feature.module.ts
├── feature.core.module.ts
├── feature.routes.ts
└── feature.components.module.ts
```

## Version-Specific Notes

| Feature | Angular 20 (GF, AH) | Angular 8 (AF) |
|---------|---------------------|----------------|
| Components | Standalone only | NgModule |
| Signals | Yes | No |
| select() | Returns Signal | Returns Observable |
| Imports | Standalone imports array | NgModule imports |
