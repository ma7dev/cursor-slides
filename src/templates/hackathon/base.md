# Hackathon Template Base Slides

This template provides reusable sections for hackathon events.

## Usage

Import sections using Slidev's `src:` frontmatter in your main slides file:

```yaml
---
src: ../src/templates/hackathon/intro.md
---
```

## Included Sections

- **intro.md**: Opening slides with event title and partners
- **rules.md**: Hackathon rules and guidelines
- **timeline.md**: Event timeline (intro, build, present)
- **judging.md**: Judging criteria and prizes
- **closing.md**: Presentation time and wrap up

## Frontmatter Standard

```yaml
---
title: "Hackathon Title"
event:
  date: 2025-MM-DD
  location: "Venue, City"
  type: hackathon
  host: "Host Name"
  duration: "6 hours"
  prizes:
    - "1st Place: Prize"
    - "2nd Place: Prize"
class: bg-[#0F0F0F] text-white
mdc: true
theme: ../src/slidev-theme-cursor
---
```

## Hackathon-Specific Features

- Build time countdown
- Team formation guidance
- Demo presentation format
- Prize announcement slides
- Unlimited credits messaging

