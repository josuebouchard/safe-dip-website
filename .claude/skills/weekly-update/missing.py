#!/usr/bin/env python3
"""Report which weeks are missing from the weekly pages.

Usage: missing.py [--today YYYY-MM-DD]
Set FIRMWARE_REPO to the firmware clone (default ~/Documents/senior-project-code).
"""
import os
import re
import subprocess
import sys
from datetime import date, datetime, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
BUILD = ROOT / "src/content/docs/build"
FIRMWARE = Path(os.environ.get("FIRMWARE_REPO", "~/Documents/senior-project-code")).expanduser()
WEEK1, LAST = date(2026, 8, 24), 15  # weeks run Monday to Sunday


def start(n):
    return WEEK1 + timedelta(weeks=n - 1)


def week_of(d):
    return (d - WEEK1).days // 7 + 1


assert week_of(date(2026, 9, 28)) == 6 and week_of(date(2026, 10, 4)) == 6


def recorded(page, pattern):
    return {int(n) for n in re.findall(pattern, (BUILD / page).read_text())}


def firmware_commits():
    """Firmware commits per week, by author date (rebases don't move them)."""
    if not FIRMWARE.is_dir():
        return {}
    log = subprocess.run(
        ["git", "-C", str(FIRMWARE), "log", "--branches", "--remotes", "--no-merges", "--format=%aI\t%s"],
        capture_output=True, text=True,
    ).stdout
    weeks = {}
    for row in set(log.splitlines()):  # branches that were rebased share commits
        stamp, _, subject = row.partition("\t")
        when = datetime.fromisoformat(stamp)
        weeks.setdefault(week_of(when.date()), []).append((when, subject))
    return weeks


today = date.fromisoformat(sys.argv[sys.argv.index("--today") + 1]) if "--today" in sys.argv else date.today()
now = week_of(today)
ended = range(1, min(now - 1, LAST) + 1)  # Sunday has passed
met = range(1, min(now, LAST) + 1)  # Monday has passed

pages = [
    ("Progress Log", recorded("progress-log.mdx", r'<Accordion title="Week (\d+)'), ended, "{0:%m/%d}–{1:%m/%d}"),
    ("Time & Effort", recorded("time-and-effort.mdx", r"weekNumber=\{(\d+)\}"), ended, "{0:%m/%d}–{1:%m/%d}"),
    ("Weekly Meetings", recorded("weekly-meetings.mdx", r'<Accordion title="Week (\d+)'), met, "Mon {0:%m/%d}"),
]

print(f"Today is {today:%a %Y-%m-%d}: week {now} ({start(now):%m/%d}–{start(now) + timedelta(days=6):%m/%d}).\n")
wanted = set()
for label, have, due, span in pages:
    missing = [n for n in due if n not in have]
    wanted.update(missing)
    names = ", ".join(f"{n} ({span.format(start(n), start(n) + timedelta(days=6))})" for n in missing)
    print(f"{label}: " + (f"missing {names}" if missing else "up to date"))

if 1 <= now <= LAST:
    print(f"\nWeek {now} is still in progress: its Progress Log and Time & Effort entries are optional until it ends.")
if not list(BUILD.glob("*task-plan*")):
    print("Weekly Task Plan: no page on the site yet.")

commits = firmware_commits()
for n in sorted(wanted):
    if commits.get(n):
        print(f"\nFirmware commits in week {n} (author date, all branches):")
        for when, subject in sorted(commits[n]):
            print(f"  {when:%a %m/%d %H:%M}  {subject}")
