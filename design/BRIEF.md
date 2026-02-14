# Design Brief — Pixeluis Personal Brand Website

> **For Gilfoyle:** This is your single source of truth. Follow the ASCII layouts
> exactly. Use the color tokens and font stack as specified. Where content is marked
> TBD, improvise with placeholder text that matches the vibe and flag it in your PR.
>
> **Reference site:** https://johnrush.me/ — study the layout, spacing, and dark
> mode aesthetic. We're building the same structure with Pixeluis branding.

---

## 1. Brand Identity

### Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `--color-bg` | `#0A0A0A` | Page background |
| `--color-bg-alt` | `#111111` | Section alternating background, cards |
| `--color-surface` | `#1A1A1A` | Sidebar, elevated surfaces |
| `--color-text` | `#FAFAFA` | Primary text |
| `--color-text-muted` | `rgba(250,250,250,0.5)` | Secondary/meta text |
| `--color-accent` | `#E07A5F` | Terracotta — buttons, active nav, highlights |
| `--color-accent-hover` | `#C4624A` | Hover state for accent |
| `--color-border` | `rgba(255,255,255,0.15)` | Dividers, card borders (dashed) |
| `--color-white` | `#FFFFFF` | Rare emphasis text |

> **Vibe:** Dark, minimal, high contrast. Think developer portfolio meets creative
> studio. The terracotta accent keeps it warm, not cold/corporate.

### Fonts
| Role | Font | Stack |
|------|------|-------|
| Headings | **Geist Mono** | `'Geist Mono', 'JetBrains Mono', monospace` |
| Body | **Geist Mono** | `'Geist Mono', 'JetBrains Mono', monospace` |
| Accent | **Geist Pixel** | `'Geist Pixel', monospace` (for special labels only) |

- Load Geist Mono from CDN or local woff2
- Everything monospace — headings, body, nav, buttons. Consistent like John Rush.
- Geist Pixel only for small labels/badges if needed

### Logo
- Use styled text: **PIXELUIS.** in Geist Pixel or Geist Mono
- No image logo needed — text-only like John Rush
- Favicon: generate a simple "P" or pixel icon from the text

---

## 2. Images

### Required (Luis to provide — mark TBD for now)
| File | Section | Notes |
|------|---------|-------|
| `avatar.webp` | Hero | Headshot/portrait (square, ~180x180) |
| `project-solohq.webp` | Projects | Solo HQ screenshot or logo |
| `project-avantsurf.webp` | Projects | Avant Surf screenshot or logo |
| `project-pixeluis.webp` | Projects | Pixeluis studio branding |

### Not yet provided (Gilfoyle should improvise)
- Use solid color blocks with project initials as placeholder cards
- Use a CSS gradient or emoji avatar as placeholder headshot
- All placeholders should look intentional, not broken

---

## 3. Page Layout (ASCII)

### Global Structure — Sidebar + Content (Single Page)

```
+---sidebar(250px)---+----------main-content(fluid)----------+
|                    |                                        |
|  PIXELUIS.         |     (scrollable content area)          |
|                    |                                        |
|  Home              |     ┌──────────────────────────┐       |
|  Projects          |     │  HERO                    │       |
|  About             |     ├──────────────────────────┤       |
|  Social Proof      |     │  PROJECTS                │       |
|  Podcasts          |     ├──────────────────────────┤       |
|  Contact           |     │  ABOUT / BIO             │       |
|                    |     ├──────────────────────────┤       |
|                    |     │  SOCIAL PROOF            │       |
|                    |     ├──────────────────────────┤       |
|                    |     │  PODCASTS                │       |
|  ──────────────    |     ├──────────────────────────┤       |
|  [Book a Call]     |     │  CONTACT / FOOTER        │       |
|                    |     └──────────────────────────┘       |
+--------------------+----------------------------------------+
```

- Sidebar: fixed left, dark surface bg, vertical nav links
- Nav links: uppercase monospace, opacity 0.5 → 1.0 on hover/active
- Active link: left border accent or full opacity
- CTA button at sidebar bottom: "BOOK A CALL" with accent bg
- Mobile (< 1024px): sidebar becomes top burger menu

---

### Section: HERO

```
+----------------------------------------------------------+
|  bg: --color-bg                                          |
|                                                          |
|  ┌──────────┐                                            |
|  │ [AVATAR] │  180x180, border: 2px solid accent         |
|  │  photo   │                                            |
|  └──────────┘                                            |
|                                                          |
|  Hi, I'm Luis.                          (h1, large)      |
|                                                          |
|  Building digital products & brands.    (subtitle, muted)|
|                                                          |
|  ┌─────────┐ ┌──────────┐ ┌──────────┐                  |
|  │ XX      │ │ XX       │ │ XX       │  (metric cards)   |
|  │ PROJECTS│ │ YEARS    │ │ BRANDS   │                   |
|  └─────────┘ └──────────┘ └──────────┘                   |
|                                                          |
|  • Creator of Solo HQ — AI agent orchestration           |
|  • Founder of Pixeluis — digital studio                  |
|  • Founder of Avant Surf — surf lifestyle brand          |
|                                                          |
|  [Newsletter] [Email] [X] [LinkedIn] [GitHub]            |
|  (social links as dashed-border buttons)                 |
+----------------------------------------------------------+
```

---

### Section: PROJECTS

```
+----------------------------------------------------------+
|  ## Released Projects                     (section title) |
|                                                          |
|  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐        |
|  │ [logo/icon] │ │ [logo/icon] │ │ [logo/icon] │        |
|  │ Solo HQ     │ │ Avant Surf  │ │ Pixeluis    │        |
|  │ AI agent    │ │ Surf life-  │ │ Digital     │        |
|  │ command     │ │ style brand │ │ studio      │        |
|  │ center      │ │             │ │             │        |
|  └─────────────┘ └─────────────┘ └─────────────┘        |
|                                                          |
|  (3-column grid, responsive → 2 → 1 on smaller screens) |
|  (each card: dashed border, hover: translateY(-2px))     |
|  (card bg: --color-bg-alt)                               |
|                                                          |
|  ## Coming Soon                                          |
|  ┌─────────────┐ ┌─────────────┐                         |
|  │ [icon]      │ │ [icon]      │                         |
|  │ Project X   │ │ Project Y   │  TBD — Luis to fill    |
|  │ description │ │ description │                         |
|  └─────────────┘ └─────────────┘                         |
+----------------------------------------------------------+
```

---

### Section: ABOUT / BIO

```
+----------------------------------------------------------+
|  ## About                                                |
|  bg: --color-bg                                          |
|                                                          |
|  (2-3 paragraphs, monospace, muted text)                 |
|                                                          |
|  TBD — Luis to write bio. Themes to cover:               |
|  - Background (surfing, tech, entrepreneurship)          |
|  - What Pixeluis does (digital products & brands)        |
|  - Philosophy (building with AI agents, lean teams)      |
|  - Location / lifestyle                                  |
|                                                          |
|  Gilfoyle: improvise a 2-paragraph placeholder that      |
|  hits these themes. Flag as TBD in PR.                   |
+----------------------------------------------------------+
```

---

### Section: SOCIAL PROOF

```
+----------------------------------------------------------+
|  ## What People Say                                      |
|                                                          |
|  ┌──────────────────────────────────────────────┐        |
|  │ "Quote text here..."                         │        |
|  │                                              │        |
|  │ — Name, Title                                │        |
|  └──────────────────────────────────────────────┘        |
|                                                          |
|  (Testimonial cards, dashed border, stacked vertically)  |
|  (TBD — Luis to provide real testimonials)               |
|  (Gilfoyle: create 2-3 placeholder testimonials)         |
+----------------------------------------------------------+
```

---

### Section: PODCASTS

```
+----------------------------------------------------------+
|  ## Podcasts                                             |
|                                                          |
|  ┌─────────────────────────────────────────────┐         |
|  │ [▶] Episode Title                           │         |
|  │     Description / guest info                │         |
|  │     Duration: XX min                        │         |
|  └─────────────────────────────────────────────┘         |
|                                                          |
|  (List of podcast appearances or episodes)               |
|  (TBD — Luis to provide links/embeds)                    |
|  (Gilfoyle: create placeholder cards, 3-4 entries)       |
|  (Click → modal with YouTube/Spotify embed)              |
+----------------------------------------------------------+
```

---

### Section: CONTACT / FOOTER

```
+----------------------------------------------------------+
|  ## Get in Touch                                         |
|  bg: --color-bg-alt                                      |
|                                                          |
|  [Book a Call]  (accent bg button, links to booking)     |
|                                                          |
|  or reach me at:                                         |
|  email@pixeluis.com                                      |
|                                                          |
|  ──────────────────────────────────────                  |
|  © 2026 Pixeluis. All rights reserved.                   |
|  [X] [LinkedIn] [GitHub] [Instagram]                     |
+----------------------------------------------------------+
```

---

## 4. Copy & Content

| Section | Text |
|---------|------|
| Site title | PIXELUIS. |
| Hero headline | Hi, I'm Luis. |
| Hero subheadline | TBD — "Building digital products & brands" (placeholder) |
| About bio | TBD — Gilfoyle improvise (see themes above) |
| CTA button | BOOK A CALL |
| Nav labels | Home, Projects, About, Testimonials, Podcasts, Contact |
| Footer copyright | © 2026 Pixeluis. All rights reserved. |
| Footer socials | TBD — X, LinkedIn, GitHub, Instagram |

---

## 5. Responsive Breakpoints

| Breakpoint | Behavior |
|------------|----------|
| Desktop (> 1120px) | Fixed sidebar (250px) + fluid content |
| Tablet (768-1120px) | Burger menu, sidebar becomes overlay, 2-col grid |
| Mobile (< 768px) | Full-width, single column, burger menu, stacked sections |

---

## 6. Interactive Elements

| Element | Behavior |
|---------|----------|
| Nav links | Smooth scroll to section, active state on scroll |
| Project cards | Hover: translateY(-2px), border opacity increase |
| Social buttons | Dashed border, hover: full opacity |
| Podcast cards | Click → modal with embedded player |
| Book a Call | Links to external booking (TBD) or /booking page |

---

## 7. Special Features

| Feature | Details |
|---------|---------|
| Loading animation | Optional — subtle fade-in or pixel animation |
| Background effect | Optional — subtle matrix/particle effect like John Rush (low priority) |
| Dark mode only | No light mode toggle needed |

---

## 8. Tech Notes

- **Base:** Fork `starter-website` repo (Rails) into `pixeluis-website`
- **Repo:** `Gilfoyle-Solo-HQ/pixeluis-website`
- **Branch:** `gilfoyle/visual-design`
- **Same patterns as Maria Frisch** — sidebar nav, section-based scroll
- **CSS custom properties** for all color tokens
- **@font-face** for Geist Mono (woff2)

---

## Status

- [x] Colors decided (dark mode, terracotta accent)
- [x] Fonts decided (Geist Mono everywhere)
- [x] Layout wireframed (ASCII above)
- [x] Sections defined (Hero, Projects, About, Social Proof, Podcasts, Contact)
- [x] Responsive breakpoints defined
- [ ] Images gathered (Luis to provide avatar + project screenshots)
- [ ] Copy written (TBD sections marked for Gilfoyle to improvise)
- [x] **READY FOR GILFOYLE** — he can start with placeholders
