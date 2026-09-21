#import "template.typ": config
#import "coverpage.typ": coverpage
#import "tables_of_content.typ":

#show: config


#coverpage(
  courseCode: "EET 4910",
  courseName: "Senior Design Proposal",
  projectName: [Safe Dip],
  subtitle: [A Safety-Oriented Hot-Dip Pick-and-Place System],
  professor: "Mayra Socarras",
  date: datetime(day: 27, month: 07, year: 2026),
)

// Intro pages are numbered using i
#counter(page).update(1)
#set page(numbering: "i")

#include "sections/00-abstract-ack.typ"

#include "tables_of_content.typ"

#pagebreak(weak: true)

// Now we set for body
#set heading(numbering: "1.1")
#counter(page).update(1)
#set page(numbering: "1")

// Include body typst files (use #chapters() instead of level one heading)
#include "sections/01-introduction.typ"
#include "sections/02-proposed-work.typ"
#include "sections/03-non-technical-issues.typ"
#include "sections/04-conclusion.typ"

// Now there should be no more chapters, only normal headings
#set heading(numbering: none)

#metadata(false)<marker:references-start>

= References

== Research

#bibliography(
  "citations.yaml",
  title: none,
  style: "institute-of-electrical-and-electronics-engineers",
  full: true,
)

== Datasheets

#bibliography(
  "datasheet-citations.yaml",
  title: none,
  style: "ieee",
  full: true
)

#metadata(false)<marker:references-end>

// Todo: fix appendix figures

#include "sections/99-appendix.typ"
