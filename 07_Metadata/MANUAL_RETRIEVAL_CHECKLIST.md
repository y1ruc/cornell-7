# Manual Retrieval Checklist — What Only You Can Get

Automated retrieval is now exhausted. Below is every remaining gap, ranked, with exact instructions.

Everything else is already archived and hash-verified (90 docs / 62 sources / 43.75 MB).

---

## PRIORITY 1 — NYSCEF court docket (blocks the most)

Automated access to NYSCEF fails at the CDN (HTTP 403) no matter what headers are sent. This must be a real browser.

**Go to:** `https://iapps.courts.state.ny.us/nyscef/Cases` → search the county/index, or open the document index already recovered:

- Case: **Jane Doe v. Cornell University et al.**, NY County Supreme Court, **Index No. 161704/2026**
- Document index: `https://iapps.courts.state.ny.us/nyscef/ViewDocument?docIndex=w3cAcu0L42eUEEFc9PeClw==`

**Get these, in order:**

1. **The complaint** (the archive already has a Snopes mirror of it at `01_Court/Complaint/` — get the *court-stamped* original to confirm the filing date).
2. **The full docket sheet / case index** — every entry, with dates. This resolves the Sept 14 vs Sept 16 conflict.
3. **The Title IX documents filed in court** — AP states these exist in the record. This is the single most valuable missing item.
4. **The hearing panel decision / Title IX outcome documents**, if separately filed.
5. **Any related proceeding by a defendant challenging the disciplinary process** (AP references this; its index number is unknown).
6. Any **exhibits** to the complaint (the Snapchat screenshots, forum posts).

Save each as PDF into `01_Court\NYSCEF\` and tell me — I'll hash and ledger them.

---

## PRIORITY 2 — Wayback capture of the CUPD Daily Crime Log

The Cornell Daily Sun cites an **archived CUPD Daily Crime Log** showing a drug arrest at the Chi Phi house at 1:05 a.m. on Oct 19, 2024. I located the log but the earliest Wayback capture is **2024-12-02** — six weeks too late to contain the Oct 19 entry, and the page is a rolling window.

- Live log: `https://publicsafety.cornell.edu/reports-statistics/daily-crime-log/`
- Known captures: `20241202080545`, `20241215234339` (and 9 more)
- Wayback is currently returning **429** to my automated requests; open it manually in a browser.

Also try Cornell's public-records request process — `https://universityrelations.cornell.edu/resources/public-records-requests/`.

---

## PRIORITY 3 — Cornell FAQ edit versions A and B (the core of Section C)

This is the strongest finding in the archive and the raw originals are still missing. CDX gives 19 captures across 3 versions; I have version C only.

| Ver | First capture | Last capture | Status |
|---|---|---|---|
| A | `20260930025104` | `20260930035141` | **missing** — says CUPD shared "all investigatory information" |
| B | `20260930194335` | `20261001160540` | **missing** — disclosure sentence removed |
| C | `20261001181609` | `20261002234150` | **archived** ✓ |

**Open these two in a browser** (I get 429):

```
https://web.archive.org/web/20260930025104id_/https://statements.cornell.edu/2026/20260929-faq.cfm
https://web.archive.org/web/20260930194335id_/https://statements.cornell.edu/2026/20260929-faq.cfm
```

Try `id_` (raw) first, then the plain `/web/<ts>/<url>` form, then view-source.

Also worth one browser attempt: **archive.today** and **Memento TimeTravel** (both failed for me — TimeTravel's host didn't resolve).

---

## PRIORITY 4 — Watch / transcribe the Oct 3 Cornell video

Cornell posted a video on Oct 3 with the commitment page. I downloaded the MP4 but **nobody has watched it**.

- File: `03_Cornell/Official_Statements/20261003-video_thumbnail.jpg` and the `.mp4`
- Source page: `https://statements.cornell.edu/2026/20261003-commitment.cfm`
- Kaltura partner `520801`, entry `1_8d5fd6ka`

It may be the outside-counsel announcement or an address by President Kotlikoff. Play it, and if there's a caption/transcript track, download it.

---

## PRIORITY 5 — Blocked media

These failed automated retrieval. Several are obtainable from a browser, or via a different mirror:

| Source | Status |
|---|---|
| **Reuters** ×3 | 401 paywall in every Wayback capture — genuinely unobtainable |
| **NYT** ×3 | `nytimes.com/2026/10/02/nyregion/cornell-rape-lawsuit-da-evidence.html` is the original reporting behind the AP "90%" piece. Paywalled; `05_News/NYT/` has what I could get |
| **Syracuse.com** (Gannett) | 403, no Wayback capture. "90% of what happened that night was not consensual" reprint |
| **Ithaca Journal** (Gannett) | HTTP 402 paywall |
| **apnews.com** ×4 | 403 directly — but AP copies are archived via WSLS/NY1/ABC/WCAX |
| **The Sun (UK)** | bot wall |
| **CBS58/CNN** | bot wall — CNN obtained via WPTZ instead |
| **Ithaca Voice** Oct 2 | 429 rate limit, retry |
| **Cornell OCR formal-complaints page** | 403 |
| **Cornell Policy 6.4 text** | 403 |

---

## PRIORITY 6 — Governance records (mostly done, minor gaps)

Already archived: SA Resolutions 15, 16, 17 (2026-2027) and R17 (2024-2025), the resolutions index, the Task Force final report PDF, and the SFL Social Event Policy PDF.

Still worth pulling from `assembly.cornell.edu`:

1. **Dec 2025 referendum result** (91.7% for an independent judicial system) — find the official results document.
2. **Oct 1, 2026 public hearing minutes / recording** — Willard Straight Hall, 4:45–6:30 p.m.
3. **Any Assembly statement beyond the Sept 30 one** I have.
4. **Faculty Senate** position, if any (Hochul's "outrage" was described as reaching the board).

Note: `sa.cornell.edu`, `senate.cornell.edu`, `studentassembly.cornell.edu` are all **dead**. The live domain is **`assembly.cornell.edu`**.

---

## Already handled — no action needed

- ✅ Complaint (Snopes mirror) — court original still preferred, see Priority 1
- ✅ DA's 9-page Sept 28 public statement (PDF, + DocumentCloud copy)
- ✅ NY AG special-processor statement + press-release index
- ✅ Cornell statements: Nov 26 2024, Sept 21, Sept 28, Sept 29 resources, Sept 29 FAQ (vC), Oct 3 commitment + video
- ✅ Presidential Task Force on Campus Sexual Assault — final report PDF (649 KB)
- ✅ IPD's "never reported to us" statement (via CDSun)
- ✅ CUPD "About" page
- ✅ CDSun ×8, ABC ×4, CBS ×5, AP ×3, CNN, NBC ×2, NYT ×3, WaPo, Newsweek, PBS ×2, WSKG, NPR, Fox, NY Post, Spectrum, Fox/WPTZ, Ithaca Voice, CNY Central ×2, Ithaca.com, WGHN, Chronicle (via Wayback), triblive, Fox/WHDH mirrors
- ✅ FAQ version history analysis (`08_Analysis/C7-FAQ-VERSION-HISTORY.md`)
- ✅ Source verification & discrepancy notes (`08_Analysis/C8-SOURCE-VERIFICATION-NOTES.md`)

---

## One correction to be aware of

`cornellseven.com` claims Student Assembly Resolution 17 refers to a Nov 8, 2024 Crime Alert and dates the incident **Oct 25, 2024**. I checked Cornell's own resolution database: **this is false.** The real `sa-r17-2024-2025` is "Campus-Wide Community Restorative Day"; `sa-r17-2026-2027` is "Granting Free Cornell Health Counseling for Survivors." Neither mentions a Crime Alert or ketamine.

The site was still useful as a lead generator, but don't cite it — details in `C8-SOURCE-VERIFICATION-NOTES.md` §1.