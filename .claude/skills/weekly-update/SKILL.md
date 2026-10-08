---
name: weekly-update
description: Find which weeks are missing from the Safe Dip website's Progress Log, Time & Effort Tracking, Weekly Meetings and Weekly Task Plan, then walk the user through writing them and publish through a Vercel preview. Use when the user says "weekly update", "what's missing", "update the site", or shares what the team worked on, a team member's weekly report, hours, photos or videos, or notes from the advisor meeting.
---

# Weekly website update

Each week the team records its work on three Build-section pages, plus the
Weekly Task Plan. Read `AGENTS.md` first: it owns the site's conventions
(media folders and classes, name forms, the release flow), and this skill points
to it instead of repeating them. This skill covers the weekly procedure:
**detect, interview, write, publish**.

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
  as memory joggers for whoever worked on the firmware. The script looks for the firmware
  clone at `~/Documents/senior-project-code`; set `FIRMWARE_REPO` to point
  elsewhere. The semester calendar (Week 1's date, the last week) is at the top
  of `missing.py`.

Tell the user the result in a sentence or two, then ask which weeks to do.
Default: every missing week, oldest first, one week at a time.

### When several weeks are missing (catching up)

The team is sometimes a few weeks behind, so expect more than one week.

- Work oldest first, and keep each entry dated to **its own week** (and each
  meeting to its own date), never to today.
- Do the interview and drafts week by week, but put them on **one branch with
  one commit per week**, so the user reviews a single preview.
- Memory fades: if the user can't recall a week's details, don't guess. Skip
  that week for now; `missing.py` will keep listing it.
- In Time & Effort, only the **newest** week keeps `open`.

## Step 1 — Interview, one week at a time

Open each week by saying what you will ask for, so the user knows what to
have ready. Gather the items in this order. **Never invent hours,
measurements, test results or meeting details**: if an item is missing, ask,
or leave it out and say so.

**Keep the wording neutral.** Either team member, or someone else on their
behalf, may be the one answering, so never assume who it is and never say "you"
or "your work". Ask about each person by name ("What did Josué work on this
week?", "How many hours did Adriano work?"), ask about every person the same
way, and write the entries in the third person.

| # | Item | Where it comes from | Rule |
|---|---|---|---|
| 1 | Each member's work (Josué, then Adriano) | That member's own account: their report, or whoever is answering relaying it | Ask about each by name. Never infer anyone's work from anything else. No account means ask, not guess. Summarize the results in plain language and confirm |
| 2 | Group sessions | Whoever is answering | Joint testing, planning, shopping; leave out if there were none |
| 3 | Hours | Whoever is answering, asked for each person and for the group | Ask for each separately. If asked to *estimate*, say that commit times only show firmware work, so they are never the only basis for anyone's total; state the method and let the user adjust |
| 4 | Photos and videos | Files the user points to | Ask what each shows, and whose work it belongs to |
| 5 | Measured values | Whoever is answering | Copy exactly as given, with units |
| 6 | Advisor meeting | Whoever is answering | Did it happen; date, location and time; led by; the notes |

The commit list from step 0 can jog memory for firmware work, but it is not an
account of anyone's week: it leaves out reports, CAD, printing, planning and
everything else that leaves no commit.

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
- Photos, CAD shots and videos follow the media conventions in `AGENTS.md`
  (Images): files go in `src/assets/build/progress/week-N/` or
  `public/progress/`, each inside a `<figure>` with a `<figcaption>`, related
  images in a `media-grid`. Write specific `alt` text.
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
should justify the hours logged. Use the names exactly as above (this page's
established form). Old entries predate the Monday-to-Sunday convention (Week 1
here reads 08/23 – 08/30); leave them unless asked.

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
  task). The course template says to post it "under the Project Timeline",
  which on this site is Build → Final Timeline: ask whether they prefer a
  section of `final-timeline.mdx` or a page of its own right after it in the
  sidebar (`build/weekly-task-plan`, registered in `astro.config.mjs`).
- If it exists, ask the user for each task's outcome for the week; do not
  guess a status. Also ask for any pivots, and for the blockers that Dr. Socarras
  asks about at the Monday check-in.

## Step 4 — Check and publish

Follow the release flow in `AGENTS.md` (Deploying) on a branch such as
`week-N-update`, plus these weekly checks before pushing:

1. Check the new entries in a browser (`npx astro preview`): expand the new
   week, confirm every image loads, and confirm videos fit on screen.
2. Run `missing.py` again: the weeks just written must no longer be listed.
