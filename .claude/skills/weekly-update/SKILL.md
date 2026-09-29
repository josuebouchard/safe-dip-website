---
name: weekly-update
description: Add a week's entries to the Safe Dip website's Progress Log, Time & Effort Tracking, and Weekly Meetings pages, and publish them through a Vercel preview. Use when the user shares what the team worked on this week, a partner's weekly report, hours worked, photos or videos of progress, or notes from the weekly advisor meeting.
---

# Weekly website update

Each week the team records its work on three Build-section pages. Read
`AGENTS.md` first for the site's general conventions; this skill covers only
the weekly procedure.

## Weeks

- Weeks run Monday to Sunday. Week 1 began on 08/24/2026, so week N starts on
  08/24/2026 + 7 × (N − 1) days.
- Work belongs to the week it happened in. If the user's summary spans two
  weeks, check the previous week's entry before repeating anything.

## What to ask for — never invent

Before writing, make sure you have the following. If something is missing, ask
for it. Never fill in hours, measurements, test results, or meeting details on
your own.

- Hours for each person and for group work. If the user asks you to *estimate*
  their hours, base the estimate on the week's commit times in the firmware
  repository, say how you estimated it, and let them adjust it.
- Any measured values (currents, resistances, dimensions) exactly as given.
- For a meeting: the date, location and time, who led it, and the notes.

## 1. Progress Log — `src/content/docs/build/progress-log.mdx`

Add a new `<Accordion>` at the **top** of the list (most recent first):

```mdx
<Accordion title="Week N — MM/DD/YYYY–MM/DD/YYYY" subtitle="Short summary of the week's main results">

**Josué** — What was worked on, and the result.

**Adriano** — What was worked on, and the result.

**Group** — Work done together (omit if there was none).

</Accordion>
```

- Keep each person's paragraph concise: what was done and why it matters, not
  a commit-by-commit list.
- Photos and CAD shots: copy them into `src/assets/build/progress/week-N/`
  with descriptive file names, import them at the top of the file, and place
  each in a `<figure>` with `<Image>` and a `<figcaption>`. Group related
  images in `<div class="media-grid">`. Write specific `alt` text.
- Videos: copy them into `public/progress/week-N-<topic>.mp4` and embed them
  with `<video controls preload="metadata" playsinline class="progress-video"
  src="/progress/...">` inside a `<figure>`.
- Describe only what the source material says. Don't add details about how a
  test was run, or what a CAD feature is for, unless the user said so.

## 2. Time & Effort Tracking — `src/content/docs/build/time-and-effort.mdx`

Add a new `<EffortWeek>` at the top, and **move `open` to it** from the
previous week (only the newest week is expanded):

```mdx
<EffortWeek
	week="MM/DD – MM/DD, YYYY"
	weekNumber={N}
	open
	entries={[
		{ name: 'Adriano Duque Mena', hours: 0, text: '...' },
		{ name: 'Josué Bouchard', hours: 0, text: '...' },
		{ name: 'Group', hours: 0, text: '...' },
	]}
/>
```

The total in the subtitle is computed automatically. Each `text` is a
one-to-three-sentence summary of that person's Progress Log paragraph, and it
should justify the hours logged.

## 3. Weekly Meetings — `src/content/docs/build/weekly-meetings.mdx`

This page holds the minutes of the weekly **advisor** meetings with
Dr. Mayra Socarras, not team work sessions (those go in the Progress Log under
**Group**). Add a new `<Accordion>` at the top:

```mdx
<Accordion title="Week N — MM/DD/YYYY" subtitle="Main topics, comma-separated">

**Location:** Zoom, 5:00 PM
**Led by:** Dr. Mayra Socarras
**Purpose:** One sentence covering the meeting's aims.

**1. Topic**

- Point.

</Accordion>
```

- Meetings are usually on Zoom at 5:00 PM on Mondays, but confirm the location
  and time with the user rather than assuming.
- Write the minutes in a formal, professional register: full sentences,
  attribute requests and decisions to Dr. Socarras or the team, and record
  outcomes (for example, "Resolution: …") when an item has already been dealt
  with.

## 4. Check and publish

1. Work on a branch, for example `week-N-update`.
2. Run `npm run build`; it must finish without errors.
3. Check the new entries in a browser (`npx astro preview`): expand the new
   week, confirm every image loads, and confirm videos fit on screen.
4. Push the branch so Vercel builds a preview, and give the user the branch
   name to review.
5. Only after the user approves: fast-forward `main` to the branch, push, and
   delete the branch locally and on GitHub.
