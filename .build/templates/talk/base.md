# Talk Template Base Slides

This template provides minimal structure for standalone talks and presentations.

## Usage

Import sections using Slidev's `src:` frontmatter in your main slides file:

```yaml
---
src: ../src/templates/talk/intro.md
---
```

## Included Sections

- **intro.md**: Simple title slide
- **speaker.md**: Speaker introduction
- **closing.md**: Thank you and contact info

## Frontmatter Standard

```yaml
---
title: "Talk Title"
event:
  date: 2025-MM-DD
  location: "Venue, City"
  type: talk
  conference: "Conference Name"
  speakers:
    - name: "Speaker Name"
      role: "Title"
class: bg-[#0F0F0F] text-white
mdc: true
theme: ../src/slidev-theme-cursor
---
```

## Talk-Specific Features

- Minimal intro/outro
- Focus on content delivery
- Flexible structure for various topics
- Speaker-centric design

