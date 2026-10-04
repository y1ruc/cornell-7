# C8 — Source Verification & Discrepancy Notes

Date of last pass: 2026-10-03
Archive: `D:\Cornell-7` — 90 documents, 62 sources, 43.75 MB, all SHA-256 verified, 0 orphans, 0 bot-walls.

This file records claims that are **contested, unverified, or corrected**. Do not cite anything here without reading the note.

---

## 1. CORRECTED — `cornellseven.com` misattributes Student Assembly Resolution 17

**Claim on cornellseven.com/sources:** that "Resolution 17 refers directly to the Crime Alert sent to the Cornell community on November 8, 2024", that it says the alert described a student "sexually assaulted and coerced into consuming ketamine", and that the resolution dates the incident to **October 25, 2024**.

**Verified against Cornell's own Office of the Assemblies:**

| Resolution | Actual title | Status |
|---|---|---|
| `sa-r17-2024-2025` | **Campus-Wide Community Restorative Day** | Acknowledged by the President; Sense-of-the-Body; presented 11/14/2024 |
| `sa-r17-2026-2027` | **Granting Free Cornell Health Counseling for Survivors of Sexual Assault** | In Discussion (passed by Assembly 10/01/2026) |

Archived: `03_Cornell/Governance/assembly-r17-2024-2025.html`, `assembly-r17-2026-2027.html`

**Conclusion: the cornellseven.com Resolution 17 narrative is false.** Neither resolution mentions a Crime Alert, ketamine, or Oct 25, 2024. The site is a third-party advocacy compilation, not a primary source. Its "Oct 25, 2024" incident date and its Crime Alert quotation must not be used.

**Do not carry forward the Oct 25, 2024 date.** The only dates supported by primary/near-primary sources are **Oct 19–20, 2024** (civil complaint) and **Nov 8, 2024** (CUPD report date per complaint).

---

## 2. UNRESOLVED — lawsuit filing date (Sept 14 vs Sept 16, 2026)

- **Sept 14, 2026** — Cornell Daily Sun (multiple articles), ABC News timeline, Spectrum News
- **Sept 16, 2026** — CNN via WPTZ, AP, ABC News timeline (internally inconsistent)

Only the NYSCEF docket stamp can settle this. Requires manual browser retrieval.

---

## 3. UNVERIFIED — "565-page" Title IX record set

- `cornellseven.com` states a **565-page** set of Cornell Title IX interview records surfaced by Oct 2.
- Associated Press (via ABC News, `05_News/AP/abc-ap-felt-like-bait.html`) says the **"Title IX documents filed in court"** are "only a portion of the entire investigation."
- CBS News says it obtained "hundreds of pages of interviews with Jane Doe, 20 witnesses and six of the seven men."

These are different characterizations of possibly different subsets. The page count is unconfirmed and the documents themselves are **not in the archive** — they are referenced in reporting but not obtained.

**Status: manual retrieval required (NYSCEF).**

---

## 4. PAYWALLED — Reuters (3 articles), confirmed to exist

URLs confirmed real and dated; every Wayback capture returns **HTTP 401**, and direct fetch returns 401. Content unobtainable.

- `reuters.com/legal/government/prosecutors-reopen-investigation-into-alleged-2024-gang-rape-cornell-university-2026-09-28/`
- `reuters.com/legal/government/what-we-know-about-cornell-university-rape-investigation-2026-10-01/`
- `reuters.com/legal/government/cornell-rape-allegations-spark-outrage-soul-searching-over-campus-culture-2026-10-02/`

Recorded as failures in `07_Metadata/ledger_failures.csv`. Note: `cornellseven.com` claims Reuters coverage; that claim is **corroborated** (real URLs exist) even though the text is unreachable.

---

## 5. ATTRIBUTION CHAIN — the "90% not consensual" text

This quotation travels widely but originates outside the archive:

1. **The New York Times** reported documents from the University record (the 565-page set).
2. **AP** republished it (archived at `05_News/AP/ap-1001-texts-wsls.html`, `ap-1001-texts-ny1.html`).
3. **New York Post** and others repeated it.

The phrase *"let's be clear that 90% of what happened that night was not consensual"* (Doe text message, Nov 3, 2024) is **AP/NYT reporting of a private document**, not a document in this archive. Attribute to AP/NYT, never to Cornell or to a court filing.

---

## 6. KEY PRIMARY-SOURCE FINDINGS added in this pass

- **CUPD investigator named**: Jeffrey Northrup. Nov 25, 2024 call to the DA's office memorialized in a note; he wrote that the DA investigator said prosecutors "all agreed that... criminal charges would not be pursued." Source: `05_News/Additional/abc-1003-da-declined-review.html`
- **Original report language** said "raped by 8-10 men at the Chi Phi fraternity house" — this **did not appear** in the condensed version CUPD gave the DA.
- **Drug arrest at the Chi Phi house ~22 hours before the alleged assault**: Oct 19, 2024, 1:03–1:41 a.m.; referred to Student Conduct. Cornell was aware of drug use there and did not impose interim suspension before the party that night. Source: `05_News/Cornell_Daily_Sun/cdsun-1003-cupd-drug-arrest.html`
- **Ketamine overdose** referenced in the released Title IX decision: "Ketamine was a substance used by multiple individuals in the Chi Phi house at the time, including [redacted] who had overdosed on or about Oct. 18, 2024."
- **Complaint names Delta Delta Delta** (Tri-Delta) as a defendant, alongside Cornell, Chi Phi, and seven men.
- **Snapchat "Chi Phi Actives" chain**, 1:42 a.m.: "Like you can walk in and whip it out." / "Shop still open?" / "Yeah." A photo of Doe was shared in the group.
- **Greek-life forum posts** Doe cited to police: "Are Chi Phi brothers Crips or Bloods because I hear they have been doing hell Gang Banging?" / "They do drugs and gang r*ped a sophomore. Report them."
- **Governance**: SA Resolutions 15, 16, 17 passed unanimously Oct 1, 2026. Dec 2025 SA referendum returned an independent judicial system with **91.7%** of >3,000 votes. Student conduct oversight moved from a University Assembly-run office to OSCS in **2021**. Names: SA President **Eeshaan Chaudhuri '27**, EVP **Hayden Watkins**; resolution targets VP **Ryan Lombardi**, VP **Kyle Kimball**, AVP Public Safety **David Honon** *(sic — verify spelling)*.
- **Timeline date conflict in AP vs ABC**: ABC timeline dates the DA reopening **Sept 27**; most outlets say **Sept 28**.

---

## 7. Third-party site caution

`06_Archives/Third_Party/cornellseven-sources.html` was the single most productive *lead generator* of this project (it surfaced the NYSCEF docIndex, Reuters URLs, Task Force PDF, and the real `assembly.cornell.edu` domain). But it produced at least one **demonstrably false** claim (see §1) and its document descriptions do not match primary reporting (§3).

**Use it to find leads. Never cite it as a source.**