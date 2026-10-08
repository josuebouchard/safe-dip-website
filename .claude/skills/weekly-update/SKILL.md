---
name: weekly-update
description: Find which weeks are missing from the Safe Dip website's Progress Log, Time & Effort Tracking, Weekly Meetings and Weekly Task Plan, then walk the user through writing them and publish through a Vercel preview. Use when the user says "weekly update", "what's missing", "update the site", or shares what the team worked on, a partner's weekly report, hours, photos or videos, or notes from the advisor meeting.
---

# Weekly website update

Each week the team records its work on three Build-section pages, plus the
Weekly Task Plan. Read `AGENTS.md` first for the site's general conventions;
this skill covers only the weekly procedure: **detect, interview, write,
publish**.

## Step 0 — Detect what is missing

Always start here, even if the user names a specific week. From the repo root:

```bash
python3 .claude/skills/weekly-update/missing.py            # today
python3 .claude/skills/weekly-update/missing.py --today 2026-10-20   # any date
```

Weeks run Monday to Sunday; Week 1 began on 08/24/2026, so week N starts on
08/24/2026 + 7 × (N − 1) days. The script reads the three pages and reports:

- **Progress Log** and **Time & Effort**: weeks that have ended and have no
  entry. The current week is optional until its Sunday.
- **Weekly Meetings**: weeks whose Monday has passed and have no minutes.
  Some weeks have no meeting (holidays), so ask; never assume one happened.
- Whether a **Weekly Task Plan** page exists yet.
- The **firmware commits** of each missing week (author date, all branches),
  as memory joggers for Josué's section.

Tell the user the result in a sentence or two, then ask which weeks to do.
Default: every missing week, oldest first, one week at a time.

## Step 1 — Interview, one week at a time

Open each week by saying what you will ask for, so the user knows what to
have ready. Gather the items in this order. **Never invent hours,
measurements, test results or meeting details**: if an item is missing, ask,
or leave it out and say so.

| # | Item | Where it comes from | Rule |
|---|---|---|---|
| 1 | Josué's work | The commit list from step 0, plus the user's own words | Summarize the results in plain language; confirm with the user |
| 2 | Adriano's work | Adriano's own report, relayed by the user | Never infer his work from anything else. No report means ask, not guess |
| 3 | Group sessions | The user | Joint testing, planning, shopping; leave out if there were none |
| 4 | Hours | The user, for Josué, Adriano and the group | If asked to *estimate* Josué's, derive it from commit times, state the method, and let the user adjust |
| 5 | Photos and videos | Files the user points to | Ask what each shows |
| 6 | Measured values | The user | Copy exactly as given, with units |
| 7 | Advisor meeting | The user | Did it happen; date, location and time; led by; the notes |

Use `AskUserQuestion` for short answers such as hours or "was there a meeting".

The site is public and the firmware repository is private. Describe firmware
work by what it achieved ("added homing on the limit switches"). Never paste
code, commit hashes, credentials, or private URLs.

Then **show the user the drafts** (the Progress Log paragraphs, the Time &
Effort lines, the minutes) and wait for their OK before writing any file.

## Step 2 — Write the entries

### Progress Log — `src/content/docs/build/progress-log.mdx`

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

### Time & Effort Tracking — `src/content/docs/build/time-and-effort.mdx`

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

### Weekly Meetings — `src/content/docs/build/weekly-meetings.mdx`

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

## Step 3 — Weekly Task Plan

Dr. Socarras requires the plan (Weeks 6 to 15, with owners) to be posted on the
site under the Project Timeline, and updated **every Sunday**: mark each task of
the past week Done, Partial or Slipped, record the actual work, and move
slipped tasks to a later week with a note. The original plan is never deleted.

- If step 0 reports **no Task Plan page**, tell the user and offer to create it
  from their spreadsheet (`EET4950_Weekly_Task_Plan_Safe_Dip.xlsx`, one row per
  task) as `src/content/docs/build/weekly-task-plan.mdx`, registered in the
  sidebar in `astro.config.mjs`.
- If it exists, ask the user for each task's outcome for the week; do not
  guess a status. Also ask for any pivots, and for the blockers that Dr. Socarras
  asks about at the Monday check-in.

## Step 4 — Check and publish

1. Work on a branch, for example `week-N-update`.
2. Run `npm run build`; it must finish without errors.
3. Check the new entries in a browser (`npx astro preview`): expand the new
   week, confirm every image loads, and confirm videos fit on screen.
4. Run `missing.py` again: the weeks just written must no longer be listed.
5. Push the branch so Vercel builds a preview, and give the user the branch
   name to review.
6. Only after the user approves: fast-forward `main` to the branch, push, and
   delete the branch locally and on GitHub.
