# Cursor Slides

Presentations for Cursor Saudi Arabia community events, powered by [Slidev](https://sli.dev/).

## Directory Structure

```
slides/
├── README.md                          # This file
├── build.sh                           # Build script for PDF generation
├── *.pdf                              # Generated PDFs (at root for easy access)
├── mds/                               # All slide markdown files
│   ├── 2025-05-riyadh-meetup.md
│   ├── 2025-07-riyadh-workshop.md
│   ├── 2025-10-riyadh-hackathon.md
│   ├── 2025-11-riyadh-ai-game.md
│   └── 2025-12-riyadh-meetup.md
└── src/                               # Shared source files
    ├── templates/                     # Presentation templates by type
    │   ├── meetup/                    # Community meetup template
    │   ├── workshop/                  # Hands-on workshop template
    │   ├── hackathon/                 # Hackathon event template
    │   └── talk/                      # Standalone talk template
    ├── components/                    # Vue components
    │   ├── Counter.vue
    │   └── GlowBackground.vue
    ├── slidev-theme-cursor/           # Custom Cursor theme
    ├── snippets/                      # Code snippets
    ├── assets/                        # All shared assets
    │   ├── logos/                     # Cursor, partners, sponsors
    │   ├── brand/                     # Cursor branding assets
    │   ├── speakers/                  # Speaker photos
    │   ├── misc/                      # Other shared assets
    │   └── events/                    # Event-specific assets
    │       └── {event-name}/
    ├── package.json                   # Slidev dependencies
    ├── netlify.toml
    └── vercel.json
```

## Quick Start

### List Available Events

```bash
./build.sh --list
```

### Start Development Server

```bash
./build.sh --dev 2025-12-riyadh-meetup
```

Then visit http://localhost:3030

### Generate PDF

```bash
# Single event
./build.sh 2025-12-riyadh-meetup

# All events
./build.sh --all
```

PDFs are generated at the root directory (e.g., `2025-12-riyadh-meetup.pdf`).

## Creating a New Event

1. **Create a new slide file** in `mds/`:

```bash
cp mds/2025-12-riyadh-meetup.md mds/2026-01-riyadh-workshop.md
```

2. **Update the frontmatter** with event details:

```yaml
---
title: "Your Event Title"
info: |
  "Event description"
event:
  date: 2026-01-15
  location: "Venue, Riyadh"
  type: workshop  # meetup | workshop | hackathon | talk
  host: "Host Name"
  speakers:
    - name: "Speaker Name"
      role: "Title"
class: bg-[#0F0F0F] text-white
mdc: true
theme: default
layout: cover
background: '#0F0F0F'
transition: slide-left
---
```

3. **Reference assets** from `assets/` (relative to build output):

```markdown
<img src="/assets/logos/cursor-horizontal-dark-bg-app-icon-full-color@4x.png" />
<img src="/assets/speakers/mazen_pfp.png" />
<img src="/assets/brand/cursor_riyadh_old.jpeg" />
```

Note: Use `/assets/` paths (not `/src/assets/`) since the build copies `src/*` to the build directory.

4. **Add event-specific assets** (if needed):

```bash
mkdir -p src/assets/events/2026-01-riyadh-workshop
cp your-asset.png src/assets/events/2026-01-riyadh-workshop/
```

5. **Preview and build**:

```bash
./build.sh --dev 2026-01-riyadh-workshop  # Preview
./build.sh 2026-01-riyadh-workshop         # Generate PDF
```

## Event Types & Templates

| Template | Use Case | Key Features |
|----------|----------|--------------|
| `meetup` | Community meetups | Intro, partners, community info, Q&A |
| `workshop` | Hands-on workshops | Agenda, demos, best practices, exercises |
| `hackathon` | Hackathon events | Rules, timeline, judging, prizes |
| `talk` | Standalone talks | Minimal structure, speaker-focused |

See `src/templates/{type}/base.md` for template documentation.

## Custom Components

### GlowBackground

Animated glowing background effect:

```html
<GlowBackground>
  <h1>Your Slide Title</h1>
  <p>Content here...</p>
</GlowBackground>
```

### Counter

Interactive counter component:

```html
<Counter :count="10" />
```

## Branding Guidelines

Follow Cursor's monochrome branding:

| Role | HEX | Usage |
|------|-----|-------|
| Primary bg | `#0F0F0F` | Main background |
| Card bg | `#171717` | Cards, modals |
| Border | `#252525` | Dividers, borders |
| Body text | `#FFFFFF` @ 80% | Paragraph text |
| Headlines | `#FFFFFF` @ 100% | Titles, CTAs |
| Accent | `#6E6E6E` | Icons, secondary |

## Asset Organization

| Directory | Contents |
|-----------|----------|
| `logos/` | Cursor logos, partner/sponsor logos |
| `brand/` | Cursor branding (stamps, QR codes, community) |
| `speakers/` | Speaker profile photos |
| `misc/` | Shared assets (awards, diagrams, etc.) |
| `events/{name}/` | Event-specific assets |

## Slidev Features Used

- **MDC syntax** (`mdc: true`) for enhanced markdown
- **v-click** for sequential reveals
- **v-motion** for animations
- **Mermaid** diagrams for flowcharts
- **Two-column layouts** for comparisons
- **Custom theme** with Cursor branding

## Links

- [Slidev Documentation](https://sli.dev/)
- [Cursor Saudi Arabia](https://cursor-sa.org/)
- [Cursor Official](https://cursor.com/)

## Contributing

1. Create a new branch for your event
2. Add your slides in `mds/`
3. Preview with `./build.sh --dev <event>`
4. Generate PDF with `./build.sh <event>`
5. Commit both `.md` and `.pdf` files

