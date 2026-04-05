# Universal Standards

**Applies to:** Every line of code in every project.

## Type Safety

- **NEVER use `any`** — find the proper type or use generics
- **NEVER cast** — no `as Type`, no `as unknown as T`. Fix the types.
  - Only exception: Firestore wire boundary with proper validation
- **NEVER use `@ts-nocheck` or `@ts-ignore`** — fix the actual error
- **NEVER weaken types or remove guards** to make code compile
- **NEVER use `.length`** — use `isEmpty()`, `size()`, `first()`, `last()` from lodash-es
- **NEVER use string literals for things that should be types** — use enums, const, type aliases
- Use `Dictionary<T>` not `Record<string, T>`
- Use `Id<T>` branded type when an ID is genuinely needed

## Error Handling

- **Every error must be visible** — no silent failures
- In catch blocks: `${err}` template literal, NEVER `(err as Error).message`
- Return `EMPTY` from rxjs, not `Observable<void>` or void
- Route errors through notification system (`setStatusAlert()` or equivalent)

## Naming

- **Readability over everything** — code reads like English
- Never use `payload` — name parameters meaningfully: `visible`, `radius`, `task`
- JSDoc for tooling only — never restate what the type signature says
- Comments almost never — if code needs a comment, rewrite the code

## Dates

- **NEVER use `toISOString()`** for dates — it converts to UTC and shifts the day
- Use `today()` / `formatLocalDate()` from core-utils
- This has caused production bugs — dispatchers saw wrong dates

## IDs

- Use `uuid v7` not v4 — v7 is time-sorted

## Collections

- Use `lodash-es` (tree-shakeable), never `lodash`
- `isEmpty()` for empty checks, never `.length`
- `first()` / `last()` instead of `[0]` / `[arr.length - 1]`

## Logging

- Use `consoleDebug()` from core-utils — never raw `console.debug()` in app code
- Boot-level logs in `main.ts` are the exception (debug system not yet initialized)
- Debug codes: unique per state, format `[PREFIX-XXYY]`

## Values

- Never hardcode values that exist in config
- Everything is a type (enum, const, type alias) — never naked string literals

## Program Integrity

- Zero warnings, zero errors — program integrity is primordial
- Build must be clean before committing
