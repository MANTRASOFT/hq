# Mantrasoft Coding Standards

Company-wide coding standards. Every project's CLAUDE.md should reference the relevant standards here. Project-specific CLAUDE.md files add only what's unique to that project.

## Standards Hierarchy

```
universal.md          ← applies to ALL code everywhere
├── frontend.md       ← all Angular/Ionic frontends
│   ├── admin.md      ← admin apps (Angular 20, standalone, GigaDesk)
│   ├── mobile.md     ← mobile apps (Ionic, NgModule, offline)
│   └── portal.md     ← portal apps (minimal, customer-facing)
├── backend.md        ← all Firebase backends
└── libraries.md      ← shared npm packages
```

## How to Use

In each project's CLAUDE.md, reference the applicable standards:

```markdown
## Standards
Follow Mantrasoft coding standards:
- [Universal](https://github.com/MANTRASOFT/hq/blob/main/standards/universal.md)
- [Frontend](https://github.com/MANTRASOFT/hq/blob/main/standards/frontend.md)
- [Admin](https://github.com/MANTRASOFT/hq/blob/main/standards/admin.md)
```

## Version Awareness

| Product | Angular | NGXS | TypeScript | Node |
|---------|---------|------|-----------|------|
| GigaFleet | 20 | 21 | 5.9 | 22 |
| AgendaHospice | 19-20 | 21 | 5.x | 22 |
| AgendaFleet | 8 | 3.7 | 4.9 | 20 |

Standards account for these differences. Where a rule depends on a version, it's noted.
