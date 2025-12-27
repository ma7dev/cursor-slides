# Meetup Template Base Slides

This template provides reusable sections for community meetups.

## Usage

Import sections using Slidev's `src:` frontmatter in your main slides file:

```yaml
---
src: ../src/templates/meetup/intro.md
---
```

## Included Sections

- **intro.md**: Opening slides with event title and partners
- **community.md**: Cursor Saudi Arabia community info
- **speaker.md**: Speaker introduction template
- **closing.md**: Q&A and thank you slides

## Frontmatter Standard

```yaml
---
title: "Event Title"
event:
  date: 2025-MM-DD
  location: "Venue, City"
  type: meetup
  host: "Host Name"
  speakers:
    - name: "Speaker Name"
      role: "Title"
class: bg-[#0F0F0F] text-white
mdc: true
theme: ../src/slidev-theme-cursor
---
```

