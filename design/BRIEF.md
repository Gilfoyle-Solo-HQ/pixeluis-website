# Design Brief — Maria Frisch Website

> Fill in each section as you gather assets. When all required items are complete,
> this file becomes Gilfoyle's single source of truth for the visual implementation.
> Mark items with [x] when done.
>
> **For Gilfoyle:** Work with whatever is provided. If an asset is missing, use your
> best judgment — pick complementary placeholder colors, use Google Fonts that match
> the vibe, generate placeholder text, and use tasteful stock-style CSS gradients or
> solid blocks where images are missing. The goal is a polished, functional site
> regardless of how complete this brief is. Flag what you improvised in your PR
> description so Luis can review and swap in real assets later.

---

## 1. Brand Identity

### Colors
- [ ] Primary color: `#______`
- [ ] Accent color: `#______`
- [ ] Background color: `#______`
- [ ] Text color: `#______`
- [ ] Any additional colors:

### Fonts
- [x] Heading font: **Steletto Neue** (files in `design/fonts/`)
- [x] Body font: **Avenir** (macOS system font — use font stack: `"Avenir", "Avenir Next", "Nunito Sans", sans-serif`)
- [ ] Accent/special font (if any): ________________
- [x] Font files added to `design/fonts/`: Steletto Neue Regular + Bold (.otf)

> **Note for Gilfoyle:** Steletto Neue is a commercial font — the .otf files are in
> `design/fonts/`. Convert to .woff2 for web use and load via `@font-face`. Avenir is
> an Apple system font — use the font stack above so it falls back gracefully on
> non-Apple devices.

### Logo
Place logo files in `design/images/`. If no logo exists, Gilfoyle should use the brand name as styled text.
- [x] Logo file: `design/images/Logo(Light).svg`
- [ ] Favicon version: `design/images/favicon.*` (optional — Gilfoyle can derive from logo)
- [ ] Notes: ________________

---

## 2. Images

Files already in `design/images/`:

### Available
- [x] `maria-frisch.webp` — portrait/headshot
- [x] `maria-sitting.webp` — lifestyle photo
- [x] `maria-no-bg.png` — cutout (transparent background)
- [x] `all-family.webp` — family photo
- [x] `yoga-training.webp` — yoga/training photo
- [x] `teaching-ytt.webp` — teaching photo
- [x] `retreats-bg.webp` — retreats background
- [x] `contact-bg.webp` — contact section background
- [x] `Home-Section.webp` — home section image
- [x] `Logo(Light).svg` — logo

### Not yet provided (Gilfoyle should improvise)
- [ ] Podcast cover art
- [ ] Blog default thumbnail
- [ ] Booking page image

---

## 3. Copy & Content

### Homepage
- [ ] Site title / brand name: ________________
- [ ] Tagline / hero headline: ________________
- [ ] Hero subheadline (1-2 sentences): ________________
- [ ] About section (short bio, 2-3 sentences): ________________
- [ ] CTA button text: ________________ (e.g., "Book a Free Call")

### Navigation labels
- [ ] Home: ________________ (or keep "Home")
- [ ] Podcasts: ________________ (or keep "Podcasts")
- [ ] Blog: ________________ (or keep "Blog")
- [ ] Booking: ________________ (or keep "Book a Call")

### Footer
- [ ] Copyright name: ________________
- [ ] Social media links:
  - [ ] Instagram: ________________
  - [ ] LinkedIn: ________________
  - [ ] Other: ________________

---

## 4. Layout Preferences

- [x] **Navigation style:** Left vertical sidebar menu (from sample-1)
- [ ] **Overall vibe:** ________________ (e.g., warm & bohemian, clean & minimal, bold & modern)
- [ ] **Reference sites you like:** ________________
- [ ] **Anything to avoid:** ________________

---

## 5. Mockups & References

Add files to `design/mockups/` and list them here.

- [ ] Sketch mockup file: `design/mockups/________________`
- [ ] Exported screens (PNG/PDF) from Sketch:
  - [ ] ________________
  - [ ] ________________
- [x] HTML sample 1: `design/sample-1.html` (vertical nav reference)
- [x] HTML sample 2: `design/sample-2.html` (general visual direction)

---

## 6. External Service Config

These are needed for production but can be filled in last.

- [ ] **Kit (ConvertKit) form ID:** ________________
- [ ] **Polar.sh access token:** ________________
- [ ] **Polar.sh product ID(s):** ________________
- [ ] **Polar.sh webhook secret:** ________________
- [ ] **Custom domain:** ________________ (e.g., mariafrisch.com)

---

## 7. Consultation Topics (Final)

Update with real offerings. Seed data has placeholders.

| Name | Description | Price | Duration |
|------|-------------|-------|----------|
| ________________ | ________________ | $____ | ____ min |
| ________________ | ________________ | $____ | ____ min |
| ________________ | ________________ | $____ | ____ min |

---

## Status

- [x] Images gathered (10 files)
- [x] Fonts decided (Steletto Neue + Avenir)
- [x] Logo provided
- [ ] Colors decided
- [ ] Copy written
- [ ] Mockups added (Sketch file)
- [ ] **READY FOR GILFOYLE** — create GitHub issue when this is checked
