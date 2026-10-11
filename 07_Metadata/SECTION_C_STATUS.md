# Section C — Collection Status

**Last updated:** 2026-10-07
**Archive root:** `D:\Cornell-7`
**Ledger:** `07_Metadata/ledger.csv` (+ `.jsonl`, + `ledger_failures.csv`)

---

## Integrity

The figures below describe the verified **October 3 baseline snapshot**. A dated addendum
with 12 later records is listed after the baseline tables.

| Check | Result |
|---|---|
| Documents archived | **126** |
| Distinct sources | **70** |
| Total size | **53.13 MB** |
| SHA-256 verified | 126 / 126 |
| Stale/mismatched metadata | 0 |
| Duplicate rows | 0 |
| Orphan files | 0 |
| Bot-wall / error pages | 0 |
| Obtained via Wayback | 7 |
| Recorded retrieval failures | 20 - see ledger_failures.csv |

**Last bulk addition:** full harvest of all 75 links from cornellseven.com/sources (2026-10-03).
36 new documents: 18x Cornell Daily Sun, 4x CBS, 2x ABC, 2x WaPo, 2x NYT-dir, 6x other outlets,
6x Cornell primary (SA PDFs, Task Force, SFL scorecard, IPD page, campus survey), AG press release.

**Deliberately not archived:** images of the survivor and screenshots of private text/Snapchat
messages. These were circulated without consent and re-hosting them perpetuates that harm.

## October 7 addendum

12 additional PDFs were located and SHA-256 recorded in
`07_Metadata/ADDITIONAL_SHA256SUMS_2026-10-07.txt`:

- 11 court-filed records from the separate Tompkins County case, *John Doe v. Cornell*,
  Index No. EF2026-0292, including the heavily redacted 99-page Cornell hearing-panel decision,
  the petition, Cornell's opposition, the September 23 dismissal order, the unsealing order,
  and related exhibits.
- New York Executive Order No. 64, signed October 1, 2026, appointing the NY Attorney General
  as special prosecutor.

The court-stamped Jane Doe complaint was reviewed to confirm NYSCEF Doc. 1 and the Sept. 16
filing stamp, but its duplicate PDF was not retained because it embeds a private Snapchat image.
See `01_Court/NEW_MATERIALS.md` for the source list and remaining retrieval leads.

## Collections by area

| Area | Docs |
|---|---|
| `01_Court/Complaint` | 1 |
| `02_Prosecutors/NY_AG` | 5 |
| `02_Prosecutors/Tompkins_DA` | 1 |
| `03_Cornell/Official_Statements` | 13 |
| `03_Cornell/Governance` | 5 |
| `03_Cornell/Public_Investigation_Materials` | 4 |
| `03_Cornell/FAQ_Versions` | 2 |
| `03_Cornell/Statements` | 2 |
| `03_Cornell/Task_Force` | 1 |
| `03_Cornell/Title_IX` | 1 |
| `04_Police` | 1 |
| `05_News/*` (all outlets) | 52 |
| `06_Archives/Third_Party` | 1 |
| `06_Archives` (Wikipedia wikitext) | 1 |

---

## Section C objectives

| Objective | Status |
|---|---|
| C1 — Court record | **Partial.** Complaint mirror held. NYSCEF docket + filed Title IX documents **not obtained** (403 CDN block). Manual-only. |
| C2 — Prosecutor record | ✅ Complete (DA Sept 28 statement PDF; NY AG special-processor statement + press index) |
| C3 — Cornell official record | ✅ Substantially complete (Nov 2024 → Oct 3 2026, incl. Task Force final report PDF) |
| C4 — Police record | **Partial.** CUPD About page + IPD statement (via CDSun). Daily Crime Log Oct 19 2024 entry **not obtained**. Manual-only. |
| C5 — Student governance | ✅ Complete (SA Resolutions 15/16/17 + index). Referendum results still outstanding. |
| C6 — Media | ✅ Broad (52 docs, 15+ outlets, wire-service copies preserved) |
| C7 — FAQ version history | **Core finding secured**; raw versions A and B still missing (Wayback 429). Manual-only. |
| C8 — Source verification | ✅ Complete (`08_Analysis/C8-SOURCE-VERIFICATION-NOTES.md`) |

---

## Analysis products

- `08_Analysis/C7-FAQ-VERSION-HISTORY.md` — the FAQ edit chronology and what changed
- `08_Analysis/C8-SOURCE-VERIFICATION-NOTES.md` — contested, corrected, and unverified claims
- `07_Metadata/MANUAL_RETRIEVAL_CHECKLIST.md` — ranked list of what only a human browser can get
- `07_Metadata/Test-BlockPage.ps1` — bot-wall detector used on every fetch

---

## Known scope limits

- Public records only. No attempt made to obtain sealed filings, grand-jury material, private Title IX records, or any identifying information about Jane Doe.
- Three Reuters articles are paywalled in every archive capture (HTTP 401) and are unobtainable.
- `cornellseven.com` is retained as a lead generator only — it contains at least one demonstrably false claim (see C8 §1).
