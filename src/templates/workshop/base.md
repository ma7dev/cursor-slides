# Workshop Template Base Slides

This template provides reusable sections for hands-on workshops.

## Usage

Import sections using Slidev's `src:` frontmatter in your main slides file:

```yaml
---
src: ../src/templates/workshop/intro.md
---
```

## Included Sections

- **intro.md**: Opening slides with event title and partners
- **agenda.md**: Workshop agenda with timing
- **cursor-features.md**: Cursor core features overview
- **best-practices.md**: Common pitfalls and tips
- **demo.md**: Live demo placeholder slides
- **closing.md**: Resources and thank you slides

## Frontmatter Standard

```yaml
---
title: "Workshop Title"
event:
  date: 2025-MM-DD
  location: "Venue, City"
  type: workshop
  host: "Host Name"
  speakers:
    - name: "Speaker Name"
      role: "Title"
class: bg-[#0F0F0F] text-white
mdc: true
theme: ../src/slidev-theme-cursor
---
```

## Workshop-Specific Features

- Extended agenda with time blocks
- Hands-on demo sections
- Code examples and live coding
- Memory Bank deep dive
- Q&A and networking time

