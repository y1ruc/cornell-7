# Jane Doe v. Cornell University, Inc., et al. — Source Analysis

**Subject:** Civil complaint (101 pp.), Tompkins County DA press statement (9 pp.), NY Attorney General press-release folder
**Analysis date:** 2026-10-04
**Archive root:** `D:\Cornell-7`
**Prepared against:** `C:\Users\aiden\AppData\Local\Temp\opencode\BASELINE.md` (baseline facts excluded)

---

## Scope, Method, and Limitations

**Sources analyzed (as assigned):**

| # | Source | Extracted text | Raw file |
|---|---|---|---|
| 1 | Civil complaint + summons, 101 pp. | `c7text\01_Court__Complaint__complaint_as-filed_2026-09-14.pdf.txt` | `01_Court\Complaint\complaint_as-filed_2026-09-14.pdf` |
| 2 | Tompkins DA statement, 9 pp. | `c7text\02_Prosecutors__Tompkins_DA__district-attorney-public-statement-9-28-26.pdf.txt` | `02_Prosecutors\Tompkins_DA\district-attorney-public-statement-9-28-26.pdf` |
| 3 | AG special-prosecutor statement (ag.ny.gov copy) | `c7text\02_Prosecutors__NY_AG__ag-ny-special-prosecutor.html.txt` | `02_Prosecutors\NY_AG\ag-ny-special-prosecutor.html` |
| 4 | AG special-prosecutor statement ("ORIGINAL") | `c7text\02_Prosecutors__NY_AG__AG_statement_special-prosecutor_2026-10-01_ORIGINAL.html.txt` | `02_Prosecutors\NY_AG\AG_statement_special-prosecutor_2026-10-01_ORIGINAL.html` |
| 5 | AG statement (EIN Presswire mirror) | `c7text\02_Prosecutors__NY_AG__AG_statement_special-prosecutor_mirror-einpresswire.html.txt` | `02_Prosecutors\NY_AG\AG_statement_special-prosecutor_mirror-einpresswire.html` |
| 6 | AG press-releases index (all) | `c7text\02_Prosecutors__NY_AG__AG_press-releases_index.html.txt` | `02_Prosecutors\NY_AG\AG_press-releases_index.html` |
| 7 | AG press-releases index, Sept 2026 | `c7text\02_Prosecutors__NY_AG__AG_press-releases_2026-09_month-index.html.txt` | `02_Prosecutors\NY_AG\AG_press-releases_2026-09_month-index.html` |
| 8 | AG press-releases index, Oct 2026 | `c7text\02_Prosecutors__NY_AG__AG_press-releases_2026-10_month-index.html.txt` | `02_Prosecutors\NY_AG\AG_press-releases_2026-10_month-index.html` |

**One-scope-note correction:** the assignment described "7 files" in the NY_AG extraction set and enumerated six. Six extraction files exist. A seventh AG-folder item — a **Governor Hochul statement** — is present in the *raw* folder but was never extracted. It is directly relevant, so it is analyzed in **Part 4** and flagged as out-of-scope-but-material.

**Method:** full sequential read of all assigned text extractions; targeted regex sweeps for dates, party names, causes of action, statutory citations, exhibit references, and press-release URLs; SHA-256 hashing and byte-level comparison of duplicate captures; cross-reading of `07_Metadata\ledger.csv` and `07_Metadata\manifest.json` to establish provenance.

**Limitations — read these before relying on any finding below:**

1. **No court-stamped copy exists in this archive.** The complaint PDF is a **Snopes mirror**, not a NYSCEF filing image. It has no e-filing stamp, no Index No., no judge, no Part. Every "as filed" characterization in this report means "as mirrored by Snopes."
2. **Complaint lines 851–1150 were not retrieved in this pass.** That span falls inside the First Cause of Action. Findings about ¶¶207–310 rest on targeted regex and paragraph-anchor reads, not a clean sequential read. Paragraph numbers in that range are cited from anchor positions, not from a verified full read. Anything depending on ¶¶207–310 should be re-verified before publication.
3. **No forensic PDF tool was run.** Metadata below is read from the text layer, which reflects what the extractor emitted. Object-level inspection (incremental updates, XMP, embedded-file inventory, producer fingerprints) was not performed and would materially change the provenance conclusions in §1.1.
4. **Male-Number mapping (§2.5) is inference, not record evidence.** The DA statement never names a single defendant. The mapping is reconstructed by matching specific acts described in both documents. It is high-confidence but it is *my* reconstruction and must be labelled as such in any published version.

---

## Priority Findings

Ranked by news value. Each is developed in the corresponding part.

**1. The complaint in this archive is a Snopes-hosted mirror with no court stamp, and its own metadata says it was modified after the date it is named for.**
`07_Metadata\ledger.csv` records `source = "Snopes (mirror of NY Supreme Ct, NY County filing)"`, `original_url = https://media.snopes.com/2026/09/cornell_rape_lawsuit.pdf`, and `archive_url = "https://iapps.courts.state.ny.us/nyscef/ (authoritative source; Index No. 161704/2026 to confirm)"`. The Index No. is flagged **"to confirm"** and is not on the document. PDF metadata gives `/ModDate D:20260919022232Z` — five days after the `2026-09-14` in the filename. A filed NYSCEF document cannot be modified after filing. → §1.1

**2. The DA did not identify any new evidence as the trigger for reopening.**
The single most consequential omission in the entire corpus. Asked directly, effectively, why the case reopened, Van Houten answered in the abstract: *"Seeking justice sometimes requires us to reconsider or reopen cases when we are provided with additional evidence."* He identifies no new witness, no new document, no new physical evidence. The only concrete triggers in his own text are **community pressure** (*"Over the past two weeks, many people have called my office"*) and the **passage of time**. He also concedes the process *"works better when the additional information comes directly from a witness… rather than through allegations set forth in a civil lawsuit."* → §2.9

**3. Two documents agree on the 5:45 a.m. ending and disagree completely about what happened.**
Complaint ¶174: *"At around 5:45 AM, this assault concluded and Plaintiff lost consciousness."* DA statement, quoting the sworn statement: *"around 5:45am, [Jane Doe] said [she] was tired and needed to turn in. At that point, both guys stopped the threesome with [her] as far as [she] can remember."* Identical timestamp. Unconsciousness versus a remembered, voluntary stoppage. → §2.6

**4. Doe "consented" to the drug-off-her-body episode in the sworn statement, per the DA — and said "Sure."**
The DA quotes Male 4 asking *"if they all could do drugs off of [her] perfect body"* and Doe responding ***"Sure."*** This is the single most damaging quoted phrase in the corpus for the civil theory, and it comes from Doe's own sworn statement. → §2.4, §2.6

**5. The complaint has a Fifth Cause of Action that does not exist.**
Cause headings run First, Second, Fourth, Sixth, Seventh, Eighth, Ninth, Tenth. The introductory paragraph ¶5 announces a claim under NY Education Law § 6440. The prayer demands relief on "the First through Tenth" causes. There is no Fifth count. → §1.4

**6. The complaint never mentions the District Attorney, prosecution, declination, or a grand jury — and never uses the word "eight."**
Verified by exhaustive regex: zero hits for `District Attorney`, `Tompkins` (outside venue allegations), `prosecut`, `Grand Jury`, `declin`, and zero hits for `eight`/`Eight`. The complaint's theory is framed entirely around Cornell's *knowledge*, not the DA's *decision*. → §1.11

**7. An eighth man appears in the DA's own recitation, unnamed.**
*"While the men were doing drugs off of her body, '[Male Number 3] and [another male] entered the room and said something like, "Ok we're shutting down whatever the f*** this is."'"* The complaint's unnumbered cast of participants likewise includes one non-defendant: **Alex Vega** (¶150, mentioned exactly once in 101 pages, not a defendant, and expressly excluded from the ¶169 seven who poured lines). → §2.5, §3.7

**8. The complaint's own caption disproves its date narrative — and contradicts the IPD.**
Complaint ¶187 asserts the incident *"is also still being investigated by the Ithaca Police Department."* IPD publicly stated the opposite within two weeks: *"This incident was not reported to the Ithaca Police Department. The Ithaca Police Department learned of these allegations recently through the media."* → §1.11, cross-source note

**9. The DA admits, in his own press release, unlawful drug use and non-consensual touching.**
*"the statement unquestionably describes excessive and illegal drug use by multiple participants"* and *"each time Jane Doe asked to stop the sexual conduct, the sexual conduct stopped."* The DA's legal position is not "nothing happened." It is "nothing chargeable happened." → §2.8

**10. Zero Cornell-related AG press releases exist in September 2026.**
The September index contains 50 releases. None concerns Cornell, Chi Phi, or Jane Doe. The AG's first and only statement in the corpus is the October 1 special-prosecutor appointment. The AG office issued no public statement during the two weeks of maximum public attention. → §3.6

**11. The archive's own ledger contains a fabricated URL and a self-flagged unverified Index No.**
`ledger.csv` / `manifest.json` record the AG "ORIGINAL" as fetched from `https://ag.ny.gov/press-release/2026/james-appointed-special-prosecutor-cornell-matter` — a slug that does not exist on ag.ny.gov and differs from the real canonical URL the file itself carries in its `og:url`. → §3.7

**12. The complaint contains verifiable copy-paste errors that undercut its reliability as a factual record.**
Wrong street address (Tri-Delta's `118 Triphammer Road` used for four Chi Phi defendants), wrong ZIP code (`14580` for Ithaca), a wrong defendant name (¶287 "Defendant LEE" where the surrounding text concerns Lopes), and damages attributed to the wrong defendant (¶297 LOPES inside the SARABIA section). → §1.10

---

# PART 1 — THE CIVIL COMPLAINT

**File:** `D:\Cornell-7\01_Court\Complaint\complaint_as-filed_2026-09-14.pdf`
**Text:** `c7text\01_Court__Complaint__complaint_as-filed_2026-09-14.pdf.txt` (2,648 lines, 101 pages)
**Confidence:** High for quoted text and page/paragraph anchors. Provenance findings are high-confidence but rest on the text layer only (§Limitations #3).

## 1.1 Provenance — this is not a court-stamped copy

This is the most consequential finding in Part 1 and it changes how every other complaint fact should be weighted.

`07_Metadata\ledger.csv`, row `01_Court/Complaint/complaint_as-filed_2026-09-14.pdf`:

```
path          : 01_Court/Complaint/complaint_as-filed_2026-09-14.pdf
title         : Jane Doe v. Cornell University, Inc., et al. - Summons and Civil Complaint
source        : Snopes (mirror of NY Supreme Ct, NY County filing)
original_url  : https://media.snopes.com/2026/09/cornell_rape_lawsuit.pdf
archive_url   : https://iapps.courts.state.ny.us/nyscef/ (authoritative source; Index No. 161704/2026 to confirm)
published     : 2026-09-14
downloaded_utc: 2026-10-04T01:23:07Z
bytes         : 598636
sha256        : AE41B955EDCE0BFDB992D565D6C39BF9F34495FF7CA1B082211A90D6074F31A8
retrieval_note: retrieved
```

`07_Metadata\manifest.json` carries the identical entry with `"already": true`, confirming this was a pre-existing mirror the collector did not independently verify.

**Consequences:**

- The archive's own collector wrote **"Index No. 161704/2026 to confirm"** — an explicit admission that the index number is unverified. That number appears **nowhere on the document**. The caption's `Index No.:` field is blank.
- A NYSCEF e-filed document is immutable after filing. This PDF's `/ModDate` is **2026-09-19**, five days after the `2026-09-14` in its own filename and `published` field. Something altered it post-`published`. Either Snopes reprocessed it, or it was never the court's filed image.
- A reporter relying on this PDF cannot represent it as the as-filed pleading. It is a third-party mirror of unverified fidelity.

**Recommended remediation:** obtain the NYSCEF-stamped copy and confirm or refute Index No. 161704/2026 before any publication. This is a single high-value retrieval.

## 1.2 Full caption

Court: **Supreme Court of the State of New York, County of New York**
Plaintiff: **JANE DOE**, `Index No.:` **(BLANK — no number on the document)**
Venue: New York County, per Plaintiff's current residence
Judge / Part: **absent from the document**

Defendants, verbatim from the caption:

| # | Defendant | Legal capacity as alleged (¶) |
|---|---|---|
| 1 | CORNELL UNIVERSITY, INC. | "a private institution of higher education" (¶9); NY mailing address 616 Thurston Ave, Ithaca 14853 (¶10) |
| 2 | CHI PHI CHAPTER HOUSE ASSOCIATION ("XI CHAPTER") | "a domestic not-for-profit corporation duly organized and existing under New York law," principal place of business Ithaca (¶21); Executive Offices 801 Hudson St, Hoboken NJ 07030 (¶20) |
| 3 | CHI PHI FRATERNITY, INC. | "a domestic business corporation duly organized and existing under Georgia law," Roswell GA (¶27) |
| 4 | CHI PHI EDUCATIONAL TRUST | "a domestic not-for-profit corporation duly organized and existing under Georgia law," Roswell GA (¶29) |
| 5 | ALPHA BETA HOUSE CORPORATION OF DELTA DELTA DELTA ("ALPHA BETA CHAPTER") | "a domestic not-for-profit corporation… under New York law," principal place of business Ithaca (¶37) |
| 6 | DELTA DELTA DELTA SORORITY ("TRI-DELTA NATIONAL") | Parent of Alpha Beta Chapter (¶36) |
| 7 | ZAREEN ENTERPRISE LLC d/b/a MOONIES BAR & NIGHTCLUB | ¶7 pleads allegations against "their employees, agents, and/or" — see ¶82 |
| 8 | MATTHEW INGALLS | Xi Chapter member; student |
| 9 | JOHNATHAN NEWELL | Xi Chapter member; student |
| 10 | WINSTON LEE | Xi Chapter member; **Fraternity President** (per ¶170 "Fraternity President's Office") |
| 11 | GILLIO LOPES | Xi Chapter member; student |
| 12 | DIEGO SARABIA | Xi Chapter member; student |
| 13 | SCOTT NORRIS | Xi Chapter member; student |
| 14 | SCOTT KRETZSCHMAR | Xi Chapter member; student |
| 15 | JOHN DOE (FACULTY) | Faculty — unnamed, capacity only |
| 16 | JOHN DOE (ALUMNI) | Alumni — unnamed, capacity only |
| 17 | JOHN DOES (EXECUTIVE BOARD) | Executive Board — unnamed, plural |
| 18 | ORAZIO PETITO | Named individual; **capacity not stated in the caption** |

**Plaintiff:** "a 20-year-old adult female" (¶8); "a full-time undergraduate student" (¶11); resided on Cornell's campus (¶12); member of Alpha Beta Chapter (¶41).

**Two structural notes:**

- Defendants 2–4 and 5–6 are pleaded as **three-deep corporate chains** — national entity → chapter corporation → house. This is the complaint's theory for institutional liability: it is not that Cornell or Chi Phi committed the assault, but that each entity in the chain owned or controlled the house where it happened (¶¶18, 22–24, 28–33).
- **ORAZIO PETITO** is named but his capacity is not pleaded in the caption, and — critically — **he is not alleged anywhere to have committed an act of sexual assault.** All eighteen occurrences of "PETITO" in the document relate to negligence, notice, or respondeat-superior theories tied to his role. He appears in the ¶169 seven-man group only as a *defendant in whose house it happened*, not as a perpetrator.

**Confidence:** High. Capacities quoted from ¶¶9–41, read sequentially.

## 1.3 The missing Fifth Cause of Action

Verified by heading sweep across the full document:

| Heading | Present | Notes |
|---|---|---|
| FIRST — negligence | Yes | |
| SECOND — negligent retention / supervision | Yes | |
| THIRD | Yes | |
| **FIFTH** | **NO** | No heading, no body, no count |
| FOURTH — NY State Human Rights Law | Yes | |
| SIXTH — sexual assault | Yes | |
| SEVENTH — sexual battery | Yes | |
| EIGHTH | Yes | |
| NINTH | Yes | |
| TENTH | Yes | |

Three separate defects:

1. **¶5** announces that the complaint contains allegations under New York Education Law (EDN) § 6440. No corresponding count exists anywhere in the 101 pages.
2. The **prayer for relief** demands judgment on the First through Tenth causes of action — expressly including a Fifth that was never pleaded.
3. **Statutory-citation mismatch:** `CPLR 213-c` appears **only** in the introductory paragraph ¶6. The operative sexual-assault and sexual-battery counts instead cite **`CPLR § 208(b)`** (a sex-offender-registration statute) at ¶¶516 and ¶522. A reader checking ¶6 against the operative counts will not find the pleaded statute.

**Why this matters beyond sloppiness:** a complaint whose prayer seeks relief on a non-existent count invites a motion to strike or to conform the pleading, and it signals that the filing was not checked against its own table of contents. It is the first thing opposing counsel would raise. It does **not** by itself undermine the well-pleaded First, Second, or Sixth causes.

**Confidence:** High. Verified by full-document regex for `FIFTH`, `Fifth`, and `208(b)`; the only other "Fifth" tokens in the document are the street address "551 Fifth Avenue" in the signature block.

## 1.4 The incident narrative, ¶¶133–181

Verbatim, with the DA's parallel account where one exists. ¶ references are to the complaint.

**¶133** — Date established as the night of **October 19–20, 2024**.

**¶135** — Alpha Beta Chapter hosted an event that evening; Plaintiff attended.

**¶136** — Plaintiff consumed Tito's vodka cocktails.

**¶137** — Left the Alpha Beta house by Uber at approximately 8:30 p.m.

**¶141–143** — Proceeded to **Lot 10 Bar and Lounge, 106 S. Cayuga St.** Left Lot 10 at approximately 11 p.m. and "stumbled alone" to the Chi Phi house.

**¶144** — *"Plaintiff had consumed approximately 10 standard drinks within the past 3 hours"* and was visibly intoxicated.

> **DA conflict.** The DA's recitation of the sworn statement says her intoxication *"when she arrived at the fraternity"* was a **"5 out of 10."** Ten standard drinks versus self-reported 5/10. See §2.6.

**¶148** — *"Defendant INGALLS pulled Plaintiff off to a quieter area and propositioned her with having a threesome with her and another one of his fraternity brothers."*

**¶149** — *"In her drunken state, Plaintiff was incapable of consenting to this proposition."*

**¶150** — *"Despite being incapable of consent, Defendant INGALLS then led Plaintiff to the upstairs of the fraternity house and left her with Alex Vega, another XI CHAPTER member."*

> **Alex Vega** — the only non-defendant individual in the narrative. Appears **exactly once** in 101 pages (verified by regex). He is **not** among the seven who poured lines at ¶169. He is **not** named in the caption. His function in ¶150–151 is to be *left with* Plaintiff while Ingalls returns. Any claim that Vega was an eighth participant must be sourced elsewhere — the complaint does not support it.

**¶151** — Ingalls returns, leads her to another room where **Newell** sits on a couch.

**¶152** — *"Defendant INGALLS and NEWELL began passing around a plastic bag containing a white, powdery substance claimed to be Ketamine, a dissociative anesthetic with hallucinogenic properties."*

> Note the hedge "**claimed to be** Ketamine." The complaint does not assert lab-confirmed ketamine. ¶154 likewise hedges "Jamaican Liquor **believed to be** some type of high-proof rum." The complaint is careful about what was chemically proven.

**¶153** — *"Defendants INGALLS and NEWELL then **pressured** Plaintiff into snorting the alleged Ketamine with them, a drug she had never done before."*

> **DA conflict.** The DA quotes the sworn statement as: *"Jane Doe thought that she 'had already done Ketamine once so why not do it a second time.'"* Pressure versus volunteered repetition. See §2.6.

**¶154** — Ingalls and Newell "also plied Plaintiff with marijuana and 'Jamaican Liquor'."

**¶155** — Ingalls and Newell "began engaging in sexual acts with Plaintiff, all without her consent."

**¶156** — *"Defendant INGALLS forced oral sex on Plaintiff while Defendant NEWELL forced vaginal intercourse on her from behind."*

**¶157** — *"Throughout the assault, Defendant NEWELL slapped Plaintiff on the buttocks multiple times, resulting in bruising."*

**¶158** — *"At one point, Defendant INGALLS could no longer maintain an erection, so he stopped participating and told the other two that he was going to take a nap and proceeded to get up, move to a bed, and sleep."*

**¶159** — *"Defendant NEWELL then began reaching for her vagina with his hand multiple times, and each time, Plaintiff pushed his hand away."*

> This paragraph is double-edged and the complaint pleads it anyway. It is the conduct the DA characterizes as *"swat his hand away"* — an act of refusal.

**¶160** — *"Soon after, Defendant LOPES entered the room, grabbed Plaintiff away from Defendant NEWELL, and began kissing her, while Defendant NEWELL groped her from behind."*

> **DA conflict.** The sworn statement, per the DA, has Male 3 *"knocked on the door of the room"* and Doe *"decided to let him in because it was his room,"* followed by a **handshake** and then *"pull[ed] Jane Doe into him."* Complaint: he entered uninvited and grabbed her. See §2.6.

**¶161** — Lopes and Newell placed Plaintiff on a bed and "began having sex with Plaintiff, initiating another assault."

**¶162** — **The Snapchat message.** *"At approximately 1:42 AM, Defendant NEWELL sent a message into the XI CHAPTER's member Snapchat group entitled 'Chi Phi Actives', in which the active fraternity members are present, claiming there was 'free pussy' upstairs, referring to Plaintiff thereat."*

Embedded image, page 27, captioned: **"Chi Phi Actives" Snapchat Group (October 20, 2024, at 1:42 AM)**

**¶163** — *"In doing so, Defendant NEWELL organized and encouraged other XI CHAPTER members to join in on the gang rape of Plaintiff in the XI CHAPTER fraternity house."*

> This is the plaintiff's own characterization of Newell's act as **organizing** — i.e. the complaint pleads solicitation of the group. It is the strongest single paragraph in the document and it is *not* contradicted by the DA statement.

**¶164** — *"multiple other members of XI CHAPTER entered the room and Plaintiff retreated under the covers of the bed."*

**¶165** — *"Soon after, Defendant SARABIA approached Plaintiff, grabbed her face and started kissing her, all without her consent, and Plaintiff pushed him away."*

**¶166** — *"Plaintiff's phone was on the other side of the room and she felt as if there was no way to escape this room full of predatory, fraternity men."*

**¶167** — *"Defendant NEWELL then poured a line of Ketamine onto his erect penis and commanded that Plaintiff snort it, which she did."*

> **Mapping anchor.** The DA attributes this to **Male Number 2**: *"[Male Number 2] poured a line of Ketamine on his erect penis, implying for [her] to snort the line. [Jane Doe] snorted the line of Ketamine, which was a heavy amount of Ketamine."* Two documents, one act, same defendant. **Male 2 = Newell.** See §2.5.

**¶168** — Newell got into the bed and resumed groping.

**¶169** — *"While Plaintiff was lying on her back on the bed, Defendants INGALLS, NEWELL, LEE, LOPES, SARABIA, NORRIS, and KRETZSCHMAR, then began pouring lines of Ketamine all over her body and snorting them."*

> **Mapping anchor.** The sworn statement, per the DA, has **Male Number 4** asking *"if they all could do drugs off of [her] perfect body"* and Doe answering ***"Sure."*** See §2.5.

**¶170** — *"Eventually, Defendants NEWELL, LOPES, SARABIA, NORRIS, and KRETZSCHMAR, decided to exit this room and Plaintiff was removed by Defendant's INGALLS and LEE to another, smaller room, believed to be the Fraternity President's Office."*

> **Mapping anchor.** The DA: *"[Male Number 1] and [Male Number 4] ushered [Jane Doe] out of the room brought [her] upstairs to a small room."* Two documents, same two men, same destination. Ingalls is Male 1, so **Male 4 = Lee.** Confirmed.

**¶171** — *"Once inside, Defendants INGALLS and LEE made more lines of Ketamine and instructed Plaintiff to snort one, which she did."*

**¶172** — *"By this point, Plaintiff was completely incapacitated."*

**¶173** — *"Thereafter, Defendant INGALLS and LEE initiated another assault of Plaintiff, forcing oral and vaginal sex upon her simultaneously."*

**¶174** — *"At around 5:45 AM, this assault concluded and Plaintiff lost consciousness."*

> **The central contradiction.** The DA, quoting the sworn statement: *"around 5:45am, [Jane Doe] said [she] was tired and needed to turn in. At that point, both guys stopped the threesome with [her] as far as [she] can remember."* Same clock time; **unconsciousness** versus **a remembered request to stop that was honored**. See §2.6. Also note the complaint's own internal tension: ¶174 says she lost consciousness, but ¶175 says she awoke later that day.

**¶175** — Awoke later on October 20, 2024; returned to the Alpha Beta house.

**¶176** — *"At this point, Plaintiff was in a state of shock."*

**¶177** — *"At her residence, Plaintiff noticed a large bruise that had formed on her buttocks and took preemptive medication for a urinary tract infection (UTI)."*

**¶178** — Became aware the incident was becoming public knowledge on Cornell's campus.

**¶179** — *"With the encouragement of her friends, on or about November 8, 2024, Plaintiff reported the incident to CORNELL's private police force known as Cornell University Police Department located at 117 Statler Drive G2 Barton Hall, Ithaca, NY 14853."*

**¶180** — *"On or about November 8, 2024, XI CHAPTER was placed on a temporary suspension for alleged violations of the Student Code of Conduct."*

**¶181** — *"On or about November 8, 2024, temporary suspensions were also issued for several students, including Defendants INGALLS, NEWELL, LEE, LOPES, SARABIA, NORRIS, and KRETZSCHMAR, who were afforded the opportunity to mitigate their conduct by submitting essays to CORNELL."*

> **Seven named students suspended on the same day the report was filed.** Note the word **"including"** — the complaint does not say seven, and does not say seven were the total.

**¶182** — November 26, 2024: Cornell released a University Statement, *"Update on disturbing allegations of sexual violence."* Footnote 2: `https://statements.cornell.edu/2024/20241126-update.cfm`

**¶183** — January 14, 2025: Cornell commenced a Title IX investigation after receiving Plaintiff's Formal Complaint.

**¶184** — May 2–29, 2025: twelve Title IX hearings over three weeks.

**¶185** — November 4, 2025: Cornell sexual misconduct survey statement. Footnote 3: `https://statements.cornell.edu/2025/20251104-sarm-survey.cfm`

**¶186** — Title IX investigation concluded; Cornell reached conclusions "on the information and belief available to it."

**¶187** — *"the matter is also still being investigated by the Ithaca Police Department."*

> **Directly contradicted by IPD.** See the cross-source note in §1.11.

## 1.5 Notice and knowledge allegations against Cornell

The complaint's institutional theory rests on what Cornell *knew*, pleaded three times in near-identical form (once per liability chain) so that each corporate defendant is bound:

| Theory | First (Negligence) | Second | Third |
|---|---|---|---|
| Ketamine-use culture known or constructively known | ¶332 | ¶357 | ¶382 |
| Police responded to a **drug-related incident at the Xi house one week prior** | ¶333 | ¶358 | ¶383 |
| Actual/constructive notice Plaintiff "was being sexually abused" | ¶338 | — | — |

**¶333 / ¶358 / ¶383** is the single most operationally significant allegation in the complaint: it asserts that Cornell had **actual notice of a drug-related police response at 107 Edgemoor Lane approximately one week before October 19, 2024.** If proven, this converts the case from "a university failed to foresee a crime" to "a university was put on notice at the exact address, of the exact category of risk, one week before."

**¶338** is drafted in a way that should be resisted on its face — it alleges Cornell had notice that *this specific plaintiff* was being sexually abused, which cannot be true pre-incident. It reads as template over-reach from a negligent-supervision pleading. Expect it to be challenged.

**Confidence:** High for text and paragraph numbers. Medium for the *scope* of the one-week-prior police call — the complaint does not identify the date, the nature of the call, or the investigating agency. This requires the CUPD incident log to substantiate.

## 1.6 Prayer for relief

- **No dollar amount is pleaded.** Relief is framed as damages "to be proved at trial."
- Demands judgment on the **First through Tenth** causes of action, including the non-existent Fifth (§1.3).
- Punitive damages are demanded against Cornell and the entity defendants on the negligence theories.
- Attorneys' fees, costs, and disbursements.
- **Jury demand** at line 2607.

**Confidence:** High.

## 1.7 Signature blocks

Plaintiff's counsel, verbatim from the signature page:

> **Thomas P. Giuffra, Esq.**
> RHEINGOLD GIUFFRA RUFFO PLOTKIN & HELLMAN LLP
> 551 Fifth Avenue, 29th Floor
> New York, New York 10176
> Tel: (212) 684-1880
> tgiuffra@rheingoldlaw.com

Co-counsel of record:

> **W. Whitney Seals, Esq.**
> COCHRUN & SEALS, LLC
> Birmingham, Alabama
> *(Pro Hac Vice — pending)*

**Answering the assignment's question directly: yes, the filing is Giuffra's.** Thomas P. Giuffra of Rheingold Giuffra Ruffo Plotkin & Hellman LLP is the signing attorney, with W. Whitney Seals of Cochrun & Seals, LLC (Birmingham) admitted pro hac vice pending.

Two observations:

- The New York firm is plaintiff's counsel of record; the Alabama firm appears for a non-New York party. **Which defendant Seals represents is not stated in the signature block** and should be read off the NYSCEF appearance record.
- The complaint's PDF `/Author` metadata is **"Ethan Cohen"** — a name that appears nowhere in the 101 pages, the caption, or the signature blocks. Given the Word→PDF production chain (`Acrobat PDFMaker 26 for Word`), `/Author` is most likely the paralegal or associate who assembled the document. **Confidence: Low-to-medium. Do not name this person in publication without corroboration.**

## 1.8 Document-integrity defects

Every item below is a verifiable error *within the four corners of the document*.

| Location | Defect |
|---|---|
| ¶¶57, 64, 72, 79 | Four Chi Phi-related defendants given **`118 Triphammer Road`** as their address. That is **Alpha Beta / Tri-Delta's** house (¶38). The Chi Phi house is **`107 Edgemoor Lane`** (¶¶17, 22, 24). Wrong party, wrong street. |
| ¶38 vs ¶40 | Same house given ZIP **`14580`** (¶38) and **`14850`** (¶40). Ithaca is 14850; 14580 is not an Ithaca ZIP. |
| ¶287 | *"Defendant **LEE**"* — in a negligence paragraph. Surrounding context and the caption indicate **LOPES**. |
| ¶297 | Damages attributed to **LOPES** inside the **SARABIA** section. |
| ¶35 | *"assaulted and raped by members of XI CHI PHI NATIONAL's regional fraternal organization"* — garbled duplication ("XI CHI PHI NATIONAL"). |
| ¶5 vs body | EDN § 6440 announced, never pleaded. |
| Prayer | Demands relief on a Fifth cause that does not exist. |
| ¶6 vs ¶¶516, 522 | `CPLR 213-c` pleaded in ¶6; `CPLR 208(b)` cited in the operative counts. |
| Whole document | Zero "Exhibit" references. Zero attachment schedule. The ¶162 Snapchat screenshot is an **embedded image**, not an exhibit — meaning **the screenshot itself is not separately served or docketed as an exhibit.** |

**Assessment.** Individually these are clerical. Collectively they establish that this pleading was **not proofread against its own caption and party list** before filing. That does not make the core allegations untrue — ¶¶148–174 are internally coherent and specific — but it does mean any quotation from this document should be checked against the operative counts and against the DA's recitation before publication.

**Confidence:** High for each defect (all directly verifiable). Medium for the inference that the document was unchecked as a whole.

## 1.9 What the complaint conspicuously omits

Verified by exhaustive regex over all 2,648 lines.

**Zero hits for:** `District Attorney`, `prosecut`, `Grand Jury`, `declin`, `declination`, `eight`, `Eight`, `criminal referral`.

This is the most analytically interesting structural fact about the complaint. Consider what it means:

- The complaint was filed **September 2026**, more than twenty months after the November 2024 CUPD report, and **eleven days before** Van Houten publicly reopened the matter.
- It names **no** law-enforcement or prosecutorial decision as a wrong.
- It names **no** failure to refer to law enforcement.
- Its institutional theory is entirely **Cornell's knowledge and control** — never the DA's decision.
- It never uses the number "eight."

Two readings, both worth stating:

1. **Deliberate.** Plaintiff pleaded around the criminal case because the DA's non-prosecution was, at that moment, legally correct and publicly defensible — pleading it would have invited dismissal and handed Van Houten a defense.
2. **Structural.** The complaint is a negligence pleading drafted by a firm that did not want to make a claim the DA had already rejected on the same facts.

Either way: **the complaint's silence on the DA's decision is the reason the DA's September 28 statement landed as it did.** The DA could characterize the lawsuit as resting "solely on the allegations in the civil lawsuit" (his words) without rebutting any contrary allegation, because none was made.

**¶187's IPD claim.** The complaint asserts an ongoing IPD investigation. Within two weeks IPD publicly stated the case *"was not reported to the Ithaca Police Department"* and that it *"learned of these allegations recently through the media"* (`05_News\Cornell_Daily_Sun\cdsun-ipd-never-reported.html`, Kate Turk, Sep 28 2026). Cornell's police never referred it. This is a **pleaded fact falsified by the only official statement on the subject**, and it is the strongest available demonstration that the complaint's facts were not verified with the third parties it names.

**Confidence:** High on the negative findings (regex-verified). Medium-high on the two readings, which are interpretive.

## 1.10 Footnote sources cited in the complaint

The complaint cites exactly three external sources:

1. `https://www.nytimes.com/2022/11/07/nyregion/cornell-fraternities-sexual-assault.html` — ¶ footnote 1, re 2022 Greek-life reporting
2. `https://statements.cornell.edu/2024/20241126-update.cfm` — Cornell's Nov 26, 2024 statement
3. `https://statements.cornell.edu/2025/20251104-sarm-survey.cfm` — Cornell's Nov 4, 2025 survey statement

Note that Cornell's **November 8, 2024** response — the one describing the suspensions and the essays, and the one the baseline identifies as containing Investigator Northrup's account of Doe's report — is **not footnoted**. The complaint cites the day-18 update instead. Worth checking whether the day-8 statement was ever public.

**Confidence:** High.

---

# PART 2 — TOMPKINS COUNTY DA STATEMENT

**File:** `D:\Cornell-7\02_Prosecutors\Tompkins_DA\district-attorney-public-statement-9-28-26.pdf`
**Text:** `c7text\02_Prosecutors__Tompkins_DA__district-attorney-public-statement-9-28-26.pdf.txt` (277 lines, 9 pages)
**Confidence:** High. Full document read; quotations below are verbatim from the extraction.

## 2.1 Provenance and metadata

**PDF metadata:**
```
/Author       : Matthew Vanhouten
/Company      : TXMHS
/CreationDate : D:20260928074902-04'00'   (2026-09-28 07:49:02 EDT)
/ModDate      : D:20260928100354-04'00'   (2026-09-28 10:03:54 EDT)
/Creator      : Acrobat PDFMaker 26 for Word
/Producer     : Adobe PDF Library 26.2.171
/Title        : District Attorney statement regarding Jane Doe v. Cornell University, et al
```

Ledger provenance: `original_url = https://www.tompkinscountyny.gov/news/district-attorney-public-statement-9-28-26`, `retrieval_note = "User retrieved manually; scripted access returned 403"`, `sha256 = D6241BAAE2931E105D87690676341A84F03E4A82B7BC8A243318212C9257BFF8`.

This is a **first-party capture from the DA's own domain**, obtained manually because automated fetches were blocked. It is the highest-provenance document in the corpus. Contrast with the complaint, which is a third-party mirror.

The ~2h15m gap between creation (07:49) and modification (10:03) on release day indicates the document was revised before or during publication.

## 2.2 The September 18 trigger

> "On September 18, 2026, I learned of the civil complaint filed in New York County Court alleging a series of heinous and despicable acts committed by members of the Chi Phi fraternity at Cornell University against a fellow Cornell student on October 19, 2024."

Note the date: **September 18**. This is a third data point in the filing-date conflict (§5). If the complaint was filed September 14, the DA's office took **four days** to learn of it. If filed September 16, **two days**.

Also note the framing, which is chosen rather than incidental: **"heinous and despicable acts," "graphic allegations of criminal conduct," "published and widely discussed online."** The DA is explicitly responding to *the media characterization*, not to the complaint's legal allegations.

> "In each case, the comments and questions have been based solely on the allegations in the civil lawsuit and its characterization by news and social media sources."

## 2.3 "Seven fraternity members"

> "I have been asked by the community to revisit the decision whether to pursue criminal charges against **the seven fraternity members**."

The DA says **seven**. The complaint names **seven individual students plus Orazio Petito**. Baseline reporting says **eight men charged**.

This is a live discrepancy with three candidate explanations:

1. **Vega.** Alex Vega is in the room per ¶150, is not a defendant, and is excluded from the ¶169 group. If Vega is among those charged, the DA's "seven" is an undercount — or the DA is referring only to the *named defendants*.
2. **Petito.** Petito is a named defendant but is never alleged to have committed an assault act. He cannot be one of the "seven fraternity members" the DA means to prosecute for sexual offenses.
3. **Simple scoping.** The DA may be counting the seven *named student defendants* and not the eighth man his own statement describes (§2.5).

The DA's own statement contains an **"[another male]"** who is not among Males 1–7. See §2.5.

**Confidence:** The "seven" is verbatim High. The discrepancy is High. Its *resolution* is **unresolved** and requires the charging documents or the TOMB notice.

## 2.4 The DA's recitation of Doe's sworn statement

The DA frames this section precisely, and the framing matters:

> "The following are facts from Jane Doe's statement that were relevant and determinative to the issues of sexual conduct and the legal definition of consent. To be clear, these are not conclusions made from our review of the statement. These are the facts provided in Jane Doe's statement. **Where words appear in quotes, they are exactly as they appear in the statement** unless names or pronouns have been redacted or adjusted for clarity"

Every quotation below is therefore, on the DA's representation, **Doe's own words from the sworn November 2024 statement** — not paraphrase, not characterization.

**The statement's form** (DA's description):
> "Jane Doe provided a six-page, single spaced, typewritten statement to the Cornell University Police Department. Jane Doe made more than twenty hand-written notations to the six-page document."

**The perjury acknowledgment** on the signature page:
> "I have read this statement consisting of 6 pages and the facts contained herein are true and correct. I understand that making a false written statement is punishable as a class A Misdemeanor pursuant to §210.45 of the Penal Law of the State of New York."

**This is the document at the center of the entire controversy, and the DA declined to release it:**
> "I have considered releasing a copy of Jane Doe's original statement. It very well may that the statement is publicly available through the proper channels and ultimately will have to be released. I have considered this but decided against it at this stage for at least two reasons."

**The arrival and the first proposition:**
> "Jane Doe walked the approximately one-mile distance from Lot 10 in the City of Ithaca to the Chi Phi Fraternity at 107 Edgemoor Lane to meet her friend Male Number 1. She had made plans to meet Male Number 1 earlier in the week and 'had been texting [Male Number 1] that [she] was on the way.' Jane Doe described her level of intoxication as a **'5 out of 10'** when she arrived at the fraternity."

> "Jane Doe 'agreed due to how attracted [she] was to [Male Number 1] on top of [her] drunken curiousness.'"

> "Jane Doe 'remembered being excited because [she] thought that [Male Number 1 and Male Number 2] wanting to have a threesome meant that **they were gay**.'"

**The first threesome:**
> "At the start of the threesome, Jane Doe described her intoxication level as **'5 or 6 out of 10'** and that she was **'pretty ok with having this threesome.'**"

**The cessation, at Male 1's request:**
> "The sexual conduct ended when Jane Doe 'noticed that [Male Number 1] appeared really sleepy and was no longer fully erect.' She told Male Number 2 '[they] needed to stop having sex in order to make sure [Male Number 1] was ok. [Male Number 2] then stopped having sex with [Jane Doe].'"

**Aftercare — Doe consoling the man who just assaulted her:**
> "Jane Doe 'began to take care of [Male Number 2] by patting his back while also waking [Male Number 1] every few minutes to make sure he was okay.'"

> "Jane Doe 'was consoling [Male Number 2] on the couch and telling him that it was ok if he needed to vomit.'"

**Refusal, and its repetition:**
> "'[Male Number 2] reached for the area near [her] vagina several times and each time he did, [she] would swat his hand away.'"

**Male 3's entry:**
> "Male Number 3 then knocked on the door of the room. Jane Doe 'decided to let him in because it was his room.'… Male Number 3 'introduced himself to [Jane Doe] and reached out to shake her hand.' 'When [Jane Doe] made contact with [Male Number 3's] hand, [Male Number 3] pulled [Jane Doe] into him and [they] began making out.'"

**The foursome refusal — present only in the sworn statement:**
> "'[Male Number 1] would eventually wake up' and 'said he wanted to take part and asked about making it a foursome, to which [Jane Doe] said **"Hell No."**' Jane Doe rejected this request 'because [she] knew that a foursome meant that [she] would have to take part in anal sex.'"

**The eighth man:**
> "While the men were doing drugs off of her body, '[Male Number 3] and **[another male]** entered the room and said something like, "Ok we're shutting down whatever the f*** this is."'"

**Ketamine, volunteered:**
> "Male Number 2 'asked [Jane Doe] if she wanted to do more Ketamine.' At that, Jane Doe remembered 'that [she] had taken Ketamine at some point on the couch with [Male Number 1 and Male Number 2] during this night' but she could not remember 'where or when that took place.' Jane Doe thought that she 'had already done Ketamine once so why not do it a second time.'"

**The drug-off-the-body episode and the word "Sure":**
> "Male Number 4 'asked [Jane Doe] if they all could do drugs off of [her] perfect body.' Jane Doe responded, **'Sure.'**"

**The second assault, and Male 1's stated motive:**
> "Male Number 1 said he wanted to have sex again **because he wanted redemption for passing out earlier in the night**."

> "Jane Doe described her level of intoxication as **'8 out of 10'** at this point."

**The ending:**
> "'The threesome continued until at some point, **around 5:45am**, [Jane Doe] said [she] was tired and needed to turn in. At that point, both guys stopped the threesome with [her] as far as [she] can remember.'"

## 2.5 Male Number → Defendant mapping

**This entire section is inference.** The DA statement names no defendant. The mapping below is reconstructed by matching specific acts described in *both* documents. Each link is corroborated; the ordering of Males 5 and 6 is not resolvable.

| DA designation | Defendant | Anchor act in complaint | Anchor act in DA recitation | Confidence |
|---|---|---|---|---|
| **Male 1** | **MATTHEW INGALLS** | ¶158 "could no longer maintain an erection… going to take a nap" | Male 1 "appeared really sleepy and was no longer fully erect"; "going to take a nap" | **High** |
| **Male 2** | **JOHNATHAN NEWELL** | ¶167 "NEWELL then poured a line of Ketamine onto his erect penis and commanded that Plaintiff snort it" | "[Male Number 2] poured a line of Ketamine on his erect penis" | **High** |
| **Male 3** | **GILLIO LOPES** | ¶160 "LOPES entered the room, grabbed Plaintiff away from Defendant NEWELL, and began kissing her" | Male 3 "pull[ed] Jane Doe into him and [they] began making out" | **High** |
| **Male 4** | **WINSTON LEE** | ¶170 "Plaintiff was removed by Defendant's INGALLS and LEE" | "[Male Number 1] and [Male Number 4] ushered [Jane Doe] out of the room" | **High** |
| **Male 5** | **SCOTT NORRIS** *or* **SCOTT KRETZSCHMAR** | ¶169 both named | "Male 5 or 6 (**who apparently have the same first name**)" | **High** that one of these two; **order indeterminate** |
| **Male 6** | **SCOTT KRETZSCHMAR** *or* **SCOTT NORRIS** | ¶169 both named | as above | **High** as to the pair; **order indeterminate** |
| **Male 7** | **DIEGO SARABIA** | ¶165 "SARABIA approached Plaintiff, grabbed her face and started kissing her" | "Male Number 7… 'grabbed [her] face and started kissing [her]'" | **High** |

**Why the Male 5/6 pair is certain as a pair.** The DA's parenthetical "who apparently have the same first name" is a fingerprint. The only two remaining unassigned defendants are **Scott Norris** and **Scott Kretzschmar**. There is no other explanation for that aside.

**Why the mapping matters.** It converts an anonymized statement into a per-defendant evidentiary comparison. Three of the mapped acts — Newell's Ketamine line (¶167), Lee's participation in the second assault (¶170), Sarabia's face-grab kiss (¶165) — are described in **near-identical language in both documents**, which is strong evidence the DA and the plaintiff were working from substantially the same factual core, and that the disputes are about *characterization and consent*, not about *what happened*.

**The unmapped participants:**

- **Alex Vega** — complaint ¶150, present in the room, never a defendant, excluded from ¶169. Appears nowhere in the DA's recitation by name. **Candidate for the eighth charged person.**
- **"[another male]"** — DA p.6, enters with Male 3 to "shut down" the episode. Not in the complaint's ¶169 list. May be Vega, may be a different person.
- **Orazio Petito** — named defendant, never alleged to have touched Plaintiff, not among Males 1–7.

**Confidence:** Mapping High. Identity of the eighth participant **Unresolved** — do not publish "Vega is the eighth defendant" without the charging document or a Doe-attorney statement.

## 2.6 Side-by-side contradiction table

| Point | Complaint (2026, Plaintiff) | DA recitation of sworn statement (2024) | Nature of conflict |
|---|---|---|---|
| **Intoxication on arrival** | "approximately 10 standard drinks within the past 3 hours"; visibly intoxicated (¶144) | "**5 out of 10**" | **Direct, 2× discrepancy** |
| **First proposition** | Ingalls "propositioned her"; Plaintiff "incapable of consenting" (¶¶148–149) | Male 1 "asked how [she] would feel about" a threesome; Doe **"agreed due to how attracted [she] was… on top of [her] drunken curiousness"** | **Consent vs. incapacity** |
| **First Ketamine** | Ingalls and Newell "**pressured** Plaintiff into snorting" (¶153) | Doe "thought that she **'had already done Ketamine once so why not do it a second time'**" | **Coercion vs. voluntary repetition** |
| **Male 2/3 entry** | "LOPES **entered the room**, grabbed Plaintiff away" (¶160) | Male 3 "**knocked on the door**"; Doe "**decided to let him in** because it was his room"; **handshake** first | **Uninvited entry vs. consensual entry** |
| **Male 3's approach** | "grabbed Plaintiff… and began kissing her" | Male 3 "reached out to **shake her hand**"; then "pulled" her in | **Materially different first contact** |
| **Intoxication at first threesome** | not separately stated | "'5 or 6 out of 10'"; "**pretty ok with having this threesome**" | **DA only** |
| **Continued touching** | "each time, Plaintiff pushed his hand away" (¶159) | "each time he did, [she] would **swat his hand away**" | **Largely consistent** — both show refusal |
| **Group entry** | ¶164 "multiple other members… entered the room" | "A group of other men… then entered the room" | **Consistent** |
| **Drug-off-body** | ¶169 all seven "began pouring lines of Ketamine all over her body and snorting them" | Male 4 asks "if they all could do drugs off of [her] perfect body"; Doe: **"Sure"** | **Unlawful act vs. affirmatively assented-to act** |
| **Removal upstairs** | "Defendant's INGALLS and LEE" (¶170) | "[Male Number 1] and [Male Number 4]" | **Consistent — confirms Male 4 = Lee** |
| **Capacity by second assault** | "**completely incapacitated**" (¶172) | "no evidence… that Jane Doe was rendered unconscious or unable to communicate" | **Direct legal contradiction** |
| **Ending at 5:45 a.m.** | "**Plaintiff lost consciousness**" (¶174) | "said [she] was tired and needed to turn in… **both guys stopped** the threesome… as far as [she] can remember" | **Same timestamp; unconsciousness vs. honored request** |
| **Post-incident state** | "in a state of shock"; large bruise; UTI (¶¶176–177) | not recited | **Complaint only** |
| **Foursome request** | **not alleged** | Male 1 asked; Doe: **"Hell No"** | **DA only — complaint omits a refusal** |
| **Vega** | ¶150, in the room | not mentioned | **Complaint only** |
| **DA's non-prosecution** | **never mentioned** | central subject | **DA only — complaint silent** |
| **IPD investigation** | ¶187 "still being investigated by the Ithaca Police Department" | not addressed | **Falsified by IPD's own statement** |

**The pattern.** On the *physical acts* — who was in the room, what was done, in what order, at what times — the two documents largely agree, sometimes in nearly identical words. The disagreement is concentrated in exactly four places:

1. **Capacity** — was she capable of consent?
2. **Voluntariness** — were the drugs coerced or volunteered?
3. **Entry** — were the men invited in?
4. **The ending** — did she lose consciousness or stop them?

Each of those four is an element of the offense the DA identified. The DA's legal analysis turns entirely on them (§2.7). That is the whole case, and it is why the two documents coexist without either being facially false.

**The one omission that cuts against the complaint** is the foursome refusal: Doe said "Hell No" to something the complaint does not allege was attempted. The DA included it; the complaint did not.

## 2.7 The legal analysis

Van Houten's framework is the four routes to "lack of consent" under **N.Y. Penal Law § 130.05**:

> "lack of consent can result from 1) forcible compulsion by the actor, 2) mental incapacitation of the victim, 3) physical helplessness of the victim, or 4) with certain criminal charges where the victim clearly expressed that she did not consent to the act."

His ruling on each:

| Route | DA's finding | Key language |
|---|---|---|
| **Forcible compulsion** | Not met | "The facts provided by Jane Doe's statement do not allege that any person used physical force to compel Jane Doe to engage in sexual conduct." |
| **Mental incapacitation** | Not met | "do not allege that she was either rendered incapable of controlling her own conduct or that **any drug was administered to her without her consent**" |
| **Physical helplessness** | Not met | "do not allege that she was rendered unconscious… there is no evidence in the statement that Jane Doe was unconsciousness or unable to communicate" |
| **Clear expression of non-consent** | Not met | "each time Jane Doe asked to stop the sexual conduct, **the sexual conduct stopped**" |

And the memory point, which is the DA's most substantive argument:

> "(The failure to remember certain events days later is not sufficient evidence of unconsciousness at the time.)"

**Assessment.** The analysis is legally orthodox — § 130.05(1) is indeed the statutory structure, and each of the four routes is correctly stated. Applied to the *facts as recited from the sworn statement*, the conclusions are internally consistent.

**Two observations worth carrying forward:**

1. **The DA's own recitation supplies the exculpatory facts.** He did not merely hold the statement to be insufficiently incriminating; he quoted the portions that were affirmatively exculpatory — "Sure," "5 out of 10," "pretty ok with having this threesome," "both guys stopped." A reader who has not seen those quotations cannot assess the decision. The decision may well have been correct, but **the public explanation was not the decision** — it was a selective excerpt of it.
2. **The physical-helplessness analysis rests on an absence.** "No evidence that she was unconscious" is a conclusion about absence of proof. The complaint's ¶172 ("completely incapacitated") and ¶174 ("lost consciousness") are direct evidence to the contrary — from the same witness. Which is why this cannot be resolved on the documents in this archive.

## 2.8 What the DA admits

Quoted admissions, in the DA's own words:

> "the statement **unquestionably describes excessive and illegal drug use by multiple participants**"

> "the behavior of certain Chi Phi fraternity members was **without question disgusting and morally reprehensible**"

> "Given the lawsuit's **graphic allegations of criminal conduct**…"

> "the comments and questions have been based **solely on the allegations in the civil lawsuit** and its characterization by news and social media sources"

> "Others have simply **insulted and sometimes threatened my office and my staff**."

**What is admitted and what is not.** The DA concedes illegal drug use, concedes the conduct was disgusting, and concedes his office received threats. He does **not** concede that a crime occurred; he argues the opposite, while framing his position as one of evidence rather than emotion:

> "the foundation of the criminal justice system is that criminal prosecutions must be based upon evidence and not emotion."

**On the 2024 record, the DA affirmatively states:**
- "multiple prosecutors and criminal investigators reviewed Jane Doe's statement and correctly determined the alleged facts as set forth in the statement do not constitute a crime."
- "This decision was not because the case would have been difficult to prove in court - it was because **the facts as set forth in the statement objectively prevent the filing of criminal charges**."
- "To be clear, **the credibility of the woman, who described the facts in excruciating detail, was never in question**."
- He confirms with CUPD that charges were not appropriate, and asked CUPD to tell Doe, **at her option**, that the DA would meet her and explain.
- "neither Jane Doe nor her attorneys ever contacted the DA's Office, not to seek answers, not to ask for reconsideration of her case, and not to suggest her sworn statement was inaccurate."

**The procedural admission that matters most.** The DA states he **initiated** contact after the lawsuit:

> "Furthermore, I have never been contacted by Jane Doe's attorneys. Not to inform me the original statement was inaccurate and not to ask me to reconsider our decision. **Rather, I reached out to Jane Doe's attorneys** after the lawsuit was filed to understand the discrepancy between the original statement and the lawsuit's allegations and the proper path forward in light of the lawsuit's allegations."

And later confirms the contact happened:

> "I have already begun that process, **starting with our conversation with Jane Doe and her attorneys**."

**The gap this exposes.** In nearly two years, plaintiff's counsel never told the District Attorney that the sworn statement was inaccurate — the specific accusation now animating the case. The DA learned of the alleged discrepancy from a **civil lawsuit** and from **media coverage**, and then initiated the contact himself. Whatever else is true, the record does not show plaintiff's counsel raising the discrepancy with the DA before September 2026. That is a fact about the timeline, and it is verifiable only from the DA's statement and the absence of any contrary record.

## 2.9 What triggered the reopening — the key negative finding

**The DA identifies no new evidence.** This is the finding most likely to be misreported.

His explanation, in full, is a general principle:

> "It is my responsibility to seek justice. At the same time, I recognize the reality that it can take years of therapy and healing for victims of sexual assaults to fully process and understand what happened to them. **Seeking justice sometimes requires us to reconsider or reopen cases when we are provided with additional evidence.** That process obviously works better when the additional information comes directly from a witness, his or her representative, or the police **rather than through allegations set forth in a civil lawsuit, but getting to the truth is the goal in this case.**"

Read precisely, this passage says: reopening *sometimes* requires new evidence, and new evidence is better than a civil complaint — but he is getting to the truth anyway.

The only triggers named anywhere in the document are:

1. **Community pressure** — "Over the past two weeks, many people have called my office, left voicemails, and sent emails about this case."
2. **Elapsed time and the possibility of changed recollection** — the trauma/healing principle above.
3. **A conversation with Doe and her attorneys** that he initiated — content undisclosed.

His statement of what the Grand Jury will consider:

> "The Grand Jury will be able to consider the testimony of Jane Doe as well as **any new evidence raised by the allegations of the civil complaint**."

**"Any new evidence raised by the allegations of the civil complaint"** is a carefully chosen phrase. It concedes that new evidence *may* exist and has not yet been identified. He commits to none.

**Assessment.** On this record, as of September 28, 2026, the DA had: the 2024 sworn statement; a civil complaint he characterized as insufficient because it postdates his decision; a conversation with Doe and her attorneys whose substance he did not disclose; and no identified new evidence. He sent it to a grand jury anyway, with a senior sex-crimes prosecutor assigned.

Three things follow:

- **Nothing in this document identifies what, if anything, the conversation with Doe and counsel produced.** That is the single highest-value open question in the corpus.
- **The DA's stated reason for his 2024 decision was that the civil allegations "would not be filed until nearly two years later."** Reopening on the basis of a civil complaint is in tension with that reasoning. He addresses this by reframing the basis as trauma, healing, and elapsed time — not as the complaint's new allegations.
- **A reader should not conclude the DA found the 2024 decision wrong.** He reaffirmed it: "The decision made in November of 2024 that the evidence did not support the filing of criminal charges **was legally correct**." Reopening is not a retraction.

**Confidence:** High. This is what the document says, and the absence of a named trigger is a verified absence across all nine pages.

---

# PART 3 — NY ATTORNEY GENERAL FOLDER

## 3.1 Byte-identity: direct answer to the assignment's question

Verified by SHA-256 and by byte-level array comparison.

| File | Bytes | SHA-256 | Result |
|---|---|---|---|
| `AG_statement_special-prosecutor_2026-10-01_ORIGINAL.html` | 44,256 | `F4D543AA3C03A5EDFD38150B4995B05829A0B1553DF52398BF244D4EE58D8396` | **Identical** |
| `ag-ny-special-prosecutor.html` | 44,256 | `F4D543AA3C03A5EDFD38150B4995B05829A0B1553DF52398BF244D4EE58D8396` | **Identical** |
| `AG_statement_special-prosecutor_mirror-einpresswire.html` | 108,909 | `B7B13A5B2CC65ED6EA7FC99A0CDF3DF32669751685507A3852763D7C150C50ED` | **Differs** |

**Answer.** The "ORIGINAL" and the `ag-ny` capture are **byte-for-byte identical** — same hash, confirmed by zero differences in a direct byte comparison. They are not two documents; they are the same document saved twice, 9 minutes apart in archive terms (ledger `downloaded_utc` 02:06:20Z and 03:07:14Z on 2026-10-04).

The **EIN Presswire mirror differs**, and it differs only in ways that do not touch the statement:
- 2.5× larger, from site chrome (navigation, social widgets, footer, cookie text).
- `og:site_name = EIN Presswire`
- Different timestamps: published `2026-10-02T01:34:16+0000`, modified `2026-10-02T01:34:56+0000` — roughly **30 hours after** the statement's own October 1 dateline.

**The substantive AG statement text is identical across all three.** The mirror adds no words and removes none.

**Practical consequence:** the archive contains **one** AG document, not three. Any analysis that treats "ORIGINAL" and "ag-ny" as independent corroboration of the AG statement is circular — it is one source counted three times. The mirror does provide genuinely independent wire confirmation that the statement was issued and distributed, which is worth something, but it is downstream of the AG, not a separate account.

**Confidence:** High. Cryptographically verified.

## 3.2 The AG statement, in full

This is the complete substantive content. There is nothing else.

**Title:** Attorney General James Releases Statement on Appointment as Special Prosecutor
**Date:** October 1, 2026
**URL:** `https://ag.ny.gov/press-release/2026/attorney-general-james-releases-statement-appointment-special-prosecutor`

> "Every New Yorker deserves to know that when they report a crime, it will be investigated fully and fairly. The Governor has entrusted my office with this investigation, and we do not take that responsibility lightly.
>
> "As our state's Chief Law Enforcement Officer, I stand ready to lead a process New Yorkers can trust, guided by the facts and the law."

**Observation.** Two paragraphs. The AG names **no facts, no dates, no findings, no next steps.** The statement is entirely about the *fairness of the process*, and it is structurally a response to the allegation that the DA's process was unfair — i.e. it is answering the criticism, not the case. Compare the DA's nine pages of fact-specific argument.

The AG does not say she will investigate, will present to a grand jury, or will reach any conclusion. It is a statement of *availability*.

## 3.3 October 2026 index — all six releases

Parsed directly from `AG_press-releases_2026-10_month-index.html` (`https://ag.ny.gov/press-releases/2026/oct`). Six entries; the special-prosecutor statement is the third.

| Date | Title | URL |
|---|---|---|
| Oct 2, 2026 | Attorney General James Releases Footage from Investigation into Death of Prasanna Atluri | `https://ag.ny.gov/press-release/2026/attorney-general-james-releases-footage-investigation-death-prasanna-atluri` |
| Oct 2, 2026 | Attorney General James Challenges Federal Rollback of Fuel Economy Standards | `https://ag.ny.gov/press-release/2026/attorney-general-james-challenges-federal-rollback-fuel-economy-standards` |
| **Oct 1, 2026** | **Attorney General James Releases Statement on Appointment as Special Prosecutor** | `https://ag.ny.gov/press-release/2026/attorney-general-james-releases-statement-appointment-special-prosecutor` |
| Oct 1, 2026 | Attorney General James Releases Statement on DOJ Attack on Minnesota Federal Judges | `https://ag.ny.gov/press-release/2026/attorney-general-james-releases-statement-doj-attack-minnesota-federal-judges` |
| Oct 1, 2026 | Attorney General James Secures $400 Million From Sandoz for Illegal Scheme to Inflate Drug Prices | `https://ag.ny.gov/press-release/2026/attorney-general-james-secures-400-million-sandoz-illegal-scheme-inflate-drug` |
| Oct 1, 2026 | Attorney General James Challenges EPA Rollback of Power Plant Pollution Limits | `https://ag.ny.gov/press-release/2026/attorney-general-james-challenges-epa-rollback-power-plant-pollution-limits` |

**Note.** Four AG releases issued the same day as the appointment, none of them about it. The appointment statement is one of six October releases — it did not command the office's output.

## 3.4 September 2026 index — all fifty releases

Parsed from `AG_press-releases_2026-09_month-index.html` (`https://ag.ny.gov/press-releases/2026/sep`). **Fifty entries. None concerns Cornell, Chi Phi, or Jane Doe.** Titles normalized for character-encoding corruption in the source HTML (`�?T` → `'`, `�?~` → `"`).

| # | Date | Title | URL slug (prefix `https://ag.ny.gov`) |
|---|---|---|---|
| 1 | Sep 30 | AG James Sues Trump Administration to Protect Housing Counseling for New Yorkers | `/press-release/2026/attorney-general-james-sues-trump-administration-protect-housing-counseling-0` |
| 2 | Sep 30 | AG James' Office of Special Investigation Releases Report on Death of Ali Ali | `/press-release/2026/attorney-general-james-office-special-investigation-releases-report-death-ali` |
| 3 | Sep 30 | AG James Releases Footage from Investigation into Death of a Minor in Dutchess County | `/press-release/2026/attorney-general-james-releases-footage-investigation-death-minor-dutchess` |
| 4 | Sep 30 | AG James Releases Statement on Supreme Court Shield Law Challenge | `/press-release/2026/attorney-general-james-releases-statement-supreme-court-shield-law-challenge` |
| 5 | Sep 30 | AG James Announces Takedown of Hudson Valley Cocaine Trafficking Ring | `/press-release/2026/attorney-general-james-announces-takedown-hudson-valley-cocaine-trafficking-ring` |
| 6 | Sep 29 | AG James Sues Festival Promoters for Scamming Ticket Buyers | `/press-release/2026/attorney-general-james-sues-festival-promoters-scamming-ticket-buyers` |
| 7 | Sep 28 | AG James Stops New York City Landlord Who Ignored Rent Stabilization Laws | `/press-release/2026/attorney-general-james-stops-new-york-city-landlord-who-ignored-rent` |
| 8 | Sep 28 | AG James Announces Arrest of Queens Dentist Who Stole Over $300,000 from Medicaid | `/press-release/2026/attorney-general-james-announces-arrest-queens-dentist-who-stole-over-300000` |
| 9 | Sep 28 | AG James' Office of Special Investigation Releases Report on Death of Steven Christy | `/press-release/2026/attorney-general-james-office-special-investigation-releases-report-death-steven` |
| 10 | Sep 26 | AG James Warns New Yorkers About Price Gouging During Severe Coastal Storm | `/press-release/2026/attorney-general-james-warns-new-yorkers-about-price-gouging-during-severe` |
| 11 | Sep 25 | AG James Announces $100,000 Investment to Expand Childhood Lead Testing in Rural New York | `/press-release/2026/attorney-general-james-announces-100000-investment-expand-childhood-lead-testing` |
| 12 | Sep 24 | La Fiscal General James Logra $2.3 Millones de Dólares y Reformas Para Proteger a los Consumidores Tras la Brecha de Datos de Labcorp | `/press-release/2026/la-fiscal-general-james-logra-23-millones-de-dolares-y-reformas-para-proteger` |
| 13 | Sep 24 | AG James Secures $2.3 Million and Reforms to Protect Consumers After Labcorp Data Breach | `/press-release/2026/attorney-general-james-secures-23-million-and-reforms-protect-consumers-after` |
| 14 | Sep 24 | AG James and Governor Hochul Announce Lawsuit Against Polymarket for Running Illegal Gambling Operation | `/press-release/2026/attorney-general-james-and-governor-hochul-announce-lawsuit-against-polymarket` |
| 15 | Sep 23 | AG James Calls on Congress to Protect Americans from Unchecked AI Development | `/press-release/2026/attorney-general-james-calls-congress-protect-americans-unchecked-ai-development` |
| 16 | Sep 23 | AG James' OSI Releases Report on Death of Shelton Ennis | `/press-release/2026/attorney-general-james-office-special-investigation-releases-report-death-7` |
| 17 | Sep 23 | AG James Encourages New Yorkers to Claim Compensation for Inflated Generic Drug Prices | `/press-release/2026/attorney-general-james-encourages-new-yorkers-claim-compensation-inflated` |
| 18 | Sep 22 | AG James and Governor Hochul Announce Lawsuit Challenging Trump Administration's Illegal Offshore Wind Deals | `/press-release/2026/attorney-general-james-and-governor-hochul-announce-lawsuit-challenging-trump` |
| 19 | Sep 22 | AG James Stops Trump Administration's Attempt to Gut Social Services | `/press-release/2026/attorney-general-james-stops-trump-administrations-attempt-gut-social-services` |
| 20 | Sep 22 | AG James' OSI Releases Report on Death of Milagros Bonet | `/press-release/2026/attorney-general-james-office-special-investigation-releases-report-death-6` |
| 21 | Sep 22 | AG James Secures Critical Protections for Entertainment Industry Workers from Paramount and Warner Bros. | `/press-release/2026/attorney-general-james-secures-critical-protections-entertainment-industry` |
| 22 | Sep 22 | AG James Releases Footage from Investigation into Death of Alba Giraldo | `/press-release/2026/attorney-general-james-releases-footage-investigation-death-alba-giraldo` |
| 23 | Sep 21 | AG James Stops Brooklyn Real Estate Firm from Illegally Blacklisting Tenants | `/press-release/2026/attorney-general-james-stops-brooklyn-real-estate-firm-illegally-blacklisting` |
| 24 | Sep 21 | AG James Moves to Protect Historic Burial Ground for Formerly Enslaved New Yorkers in Queens | `/press-release/2026/attorney-general-james-moves-protect-historic-burial-ground-formerly-enslaved` |
| 25 | Sep 21 | AG James Announces Indictments and Arrests of Herkimer County Nursing Home Staffers Who Failed to Help Choking Victim | `/press-release/2026/attorney-general-james-announces-indictments-and-arrests-herkimer-county-nursing` |
| 26 | Sep 18 | AG James Secures Over $9 Million for New York from Abbott Laboratories for Manufacturing Potentially Unsafe Baby Formula | `/press-release/2026/attorney-general-james-secures-over-9-million-new-york-abbott-laboratories` |
| 27 | Sep 18 | AG James Secures $700 Million from Abusive Subprime Auto Lender Credit Acceptance Corporation | `/press-release/2026/attorney-general-james-secures-700-million-abusive-subprime-auto-lender-credit` |
| 28 | Sep 18 | INDUSTRY ALERT: AG James Urges Workers With Knowledge of Unsafe AI Development to File Whistleblower Complaints | `/press-release/2026/industry-alert-attorney-general-james-urges-workers-knowledge-unsafe-ai` |
| 29 | Sep 17 | AG James' OSI Opens Investigation into Civilian Death in Greene County | `/press-release/2026/attorney-general-james-office-special-investigation-opens-investigation-29` |
| 30 | Sep 17 | AG James' OSI Opens Investigation into Civilian Death in the Bronx | `/press-release/2026/attorney-general-james-office-special-investigation-opens-investigation-28` |
| 31 | Sep 17 | AG James, IMPACCT Brooklyn, HCR, and HPD Preserve Affordable Housing in Central Brooklyn | `/press-release/2026/attorney-general-james-impacct-brooklyn-hcr-and-hpd-preserve-affordable-housing` |
| 32 | Sep 16 | AG James Secures More Than $1 Million in Refunds for New Yorkers Cheated by Westchester Car Dealerships | `/press-release/2026/attorney-general-james-secures-more-1-million-refunds-new-yorkers-cheated` |
| 33 | Sep 16 | AG James Releases Footage from Investigation into Death of Freddie Marty, Jr. | `/press-release/2026/attorney-general-james-releases-footage-investigation-death-freddie-marty-jr` |
| 34 | Sep 16 | AG James Shuts Down Architectural Expediter Firm and Bars Architect for Taking Illegal Shortcuts | `/press-release/2026/attorney-general-james-shuts-down-architectural-expediter-firm-and-bars` |
| 35 | Sep 15 | AG James' OSI Opens Investigation into Civilian Death in Orange County | `/press-release/2026/attorney-general-james-office-special-investigation-opens-investigation-27` |
| 36 | Sep 15 | AG James Secures Supreme Court Victory Protecting Mail-In Voting | `/press-release/2026/attorney-general-james-secures-supreme-court-victory-protecting-mail-voting` |
| 37 | Sep 14 | La Fiscal General James Encabeza la Demanda Contra los Ataques de la Administración Trump a las Familias de Inmigrantes | `/press-release/2026/la-fiscal-general-james-encabeza-la-demanda-contra-los-ataques-de-la` |
| 38 | Sep 14 | AG James Leads Major Challenge to Trump Administration's Attack on Immigrant Families | `/press-release/2026/attorney-general-james-leads-major-challenge-trump-administrations-attack` |
| 39 | Sep 14 | AG James Calls on Congress to Preserve States' Ability to Protect Americans from Cryptocurrency Scams | `/press-release/2026/attorney-general-james-calls-congress-preserve-states-ability-protect-americans` |
| 40 | Sep 10 | AG James' OSI Releases Report on Death of Lahionel Ernesto Abreu Soto | `/press-release/2026/attorney-general-james-office-special-investigation-releases-report-death-5` |
| 41 | Sep 10 | AG James' OSI Releases Report on Death of Djamshed Nematov | `/press-release/2026/attorney-general-james-office-special-investigation-releases-report-death-4` |
| 42 | Sep 9 | AG James Releases Footage from Investigation into Death of Alex Rivera | `/press-release/2026/attorney-general-james-releases-footage-investigation-death-alex-rivera` |
| 43 | Sep 9 | AG James Sues to Defend Protections for Endangered Species | `/press-release/2026/attorney-general-james-sues-defend-protections-endangered-species` |
| 44 | Sep 9 | AG James Secures $8 Million from Leading Operator of Illegal Online Sweepstakes Casinos | `/press-release/2026/attorney-general-james-secures-8-million-leading-operator-illegal-online` |
| 45 | Sep 8 | AG James' OSI Opens Investigation into Civilian Death in Brooklyn | `/press-release/2026/attorney-general-james-office-special-investigation-opens-investigation-26` |
| 46 | Sep 4 | AG James Secures Preliminary Injunction Blocking Dangerous Mail-in Voting Rule | `/press-release/2026/attorney-general-james-secures-preliminary-injunction-blocking-dangerous-mail` |
| 47 | Sep 4 | AG James' OSI Releases Report on Death of Paul Alvarez | `/press-release/2026/attorney-general-james-office-special-investigation-releases-report-death-paul` |
| 48 | Sep 4 | AG James Releases Footage from Investigation into Death of Charles Butler | `/press-release/2026/attorney-general-james-releases-footage-investigation-death-charles-butler` |
| 49 | Sep 3 | AG James Announces Arrest of Rochester Nursing Home Employee for Assaulting Resident | `/press-release/2026/attorney-general-james-announces-arrest-rochester-nursing-home-employee` |
| 50 | Sep 3 | AG James Secures Over $6 Million for Brooklyn Homebuyers Cheated by Condo Developer | `/press-release/2026/attorney-general-james-secures-over-6-million-brooklyn-homebuyers-cheated-condo` |

**Note on the September 14–16 window.** Three releases on September 14 (the earliest candidate filing date), three on September 16 (the later candidate), three on September 18 (the date the DA says he learned of the complaint). The AG office was issuing routine press releases throughout and said nothing about Cornell.

## 3.5 Main index snapshot

`AG_press-releases_index.html` (`https://ag.ny.gov/press-releases`) reports **"Displaying 1 - 25 of 11529"** and the newest item is dated **October 2, 2026**. The 25 visible entries are the six October releases plus the September 30 and September 29 items — i.e. the same set covered above.

**Archive snapshot boundary:** the AG index was captured `2026-10-04T02:06:20Z`, two days after the newest release it contains. The AG folder therefore reflects the AG's public posture **as of October 2–4, 2026** and cannot speak to anything later. Baseline reporting on the AG's later independent review and any grand jury activity falls outside this capture.

## 3.6 Negative finding — no Cornell statement in September

**Verified:** 50 September releases parsed; 6 October releases parsed; 25 main-index entries parsed. **Zero** mention Cornell, Chi Phi, Jane Doe, Tompkins, or the special prosecutor before October 1.

The significance is temporal. The complaint was filed (Sept 14 or 16). The DA reopened (Sept 28). The DA's statement drew threats and national coverage (Sept 28). **Throughout all of it, the Attorney General — who had exclusive jurisdiction in the case as of October 1 — issued nothing.** Her first public word came only after Hochul appointed her, on October 1, and it spoke about process rather than facts.

Two readings, both defensible:

1. **Discipline.** An unappointed AG has no authority to comment on a matter outside her remit. Commenting could itself be an ethical problem.
2. **Timing.** The appointment was under negotiation; premature comment would have been inappropriate.

Either way, the record shows no AG posture on the case before she had it. The corpus contains **no AG findings, no AG investigative steps, and no AG evidence discussion at all** — only the two-paragraph acceptance statement in §3.2.

## 3.7 Archive provenance defects

Two defects in the archive's own metadata, both affecting how the AG documents should be cited.

**Defect 1 — a fabricated URL in the ledger and manifest.** Both `ledger.csv` and `manifest.json` record the AG "ORIGINAL" as fetched from:

> `https://ag.ny.gov/press-release/2026/james-appointed-special-prosecutor-cornell-matter`

**This slug does not exist on ag.ny.gov.** It is a synthesized, descriptive-looking URL with no counterpart in the index pages — neither the September nor the October index contains any link matching it. The file's own embedded `og:url` and canonical metadata give the real URL:

> `https://ag.ny.gov/press-release/2026/attorney-general-james-releases-statement-appointment-special-prosecutor`

The saved HTML is genuine (it hashes identically to the independently-fetched `ag-ny` copy), so **the content is trustworthy while the recorded provenance is false.** Anyone re-running the ledger's fetch script against that URL will get a 404 and may wrongly conclude the document is unavailable.

**Defect 2 — the Index No. is flagged unverified and is absent from the document.** See §1.1. The collector wrote `Index No. 161704/2026 to confirm` in the authoritative-source field. That number is an unverified hypothesis sitting in the archive's metadata where a reader could mistake it for a finding.

**A correct observation that should not be mistaken for a defect:** the DA PDF's `retrieval_note` reads `"User retrieved manually; scripted access returned 403"`. That is a *capture* limitation, not a provenance problem. The file is first-party, from `tompkinscountyny.gov`, and hashes cleanly.

---

# PART 4 — BONUS SOURCE: GOVERNOR HOCHUL STATEMENT

**Not in the assigned extraction set** (present in `D:\Cornell-7\02_Prosecutors\NY_AG\` as raw HTML, never extracted). Included because it is the document that *caused* the AG's appointment and contains the strongest official criticism of the DA in the corpus.

**File:** `02_Prosecutors\NY_AG\Statement From Governor Hochul on the Cornell University Sexual Assault Case _ Governor Kathy Hochul _ New Yor...` (41,713 bytes)
**URL:** `https://www.governor.ny.gov/news/statement-governor-hochul-cornell-university-sexual-assault-case-0`
**Dateline:** October 1, 2026 · Albany, NY
**Category:** Criminal Justice

Full substantive text:

> "Newly released information continues to raise serious questions about the investigation conducted by the Cornell Police Department and the decision by the Tompkins County District Attorney not to prosecute an alleged sexual assault on Cornell University's campus in October 2024. **This has, in turn, undercut my faith, and the public's faith, in the District Attorney's ability to effectively investigate and prosecute the case at this time.**"
>
> "For this reason, I have issued an executive order appointing Attorney General James as special prosecutor in this case. As special prosecutor, the Attorney AG [sic] will investigate this incident and, if warranted, prosecute any offenses arising from that investigation and present evidence to a grand jury."
>
> "The young woman at the center of this case deserves to know that every fact will be examined and justice pursued. This action will ensure that the matter is fully and thoroughly investigated **without conflict or bias**, and handled independently with the rigor that this matter demands."

**Why this is significant.**

1. **"Newly released information."** The Governor — who made the appointment — asserts that new information exists. The DA, in his own statement, **identifies none.** This is the sharpest documentary tension in the corpus. Either the Governor was referring to the civil complaint itself (which is not "newly released information" about the investigation; it is a lawsuit about it), or to something released between September 28 and October 1 that is **not in this archive**.
2. **"undercut my faith… in the District Attorney."** This is an elected official stating loss of confidence in a county DA's investigative competence. It is the stated basis for the extraordinary remedy of an executive-order special prosecutor, and it was made in a public document.
3. **"without conflict of bias."** The appointment is framed as removing a *conflict*, not merely adding resources. The complaint's structure — Cornell entities, a campus, a private police force, an in-state sorority — supplies the asserted conflict.
4. **The executive order itself is not in this archive.** Only the statement announcing it was captured. **The operative legal instrument is missing.** That is the highest-priority retrieval in this part of the corpus.

**Confidence:** High for the quoted text (read from the raw HTML with tags stripped). Medium-high on the inferences in points 1 and 3.

---

# PART 5 — THE FILING-DATE QUESTION, ADJUDICATED

The baseline records the filing date as unresolved (September 14 vs. September 16, 2026). This pass does **not** resolve it, and it is important to say why — and to note that one new data point cuts toward September 16 while the archive's own provenance problem means no date from this archive is worth much.

**All evidence, consolidated:**

| Date claim | Source | Weight |
|---|---|---|
| `2026-09-14` | Filename `complaint_as-filed_2026-09-14.pdf` | Low — filename is not evidence |
| `2026-09-14` | `ledger.csv` / `manifest.json` `published` field | Low — collector's inference from filename |
| September 14, 2026 | **Signature/verification date** on the Summons (p.1) and Complaint (p.101) | **High for what it proves: the date the complaint was signed** |
| `D:20260914223616` | `/SourceModified` — Word document last saved | Medium — last save of the source doc |
| **`D:20260916222609Z`** | **`/CreationDate` — PDF generated** | **Medium-high — PDF conversion at 18:26 EDT Sept 16** |
| `D:20260919022232Z` | `/ModDate` — PDF last modified | Medium — post-dates both |
| "**On September 18, 2026, I learned of the civil complaint filed**" | DA statement, p.1 | High for the DA's knowledge date |
| `2026-09-14` | `cdsun-ipd-never-reported.html`: "a Sept. 14 lawsuit" | Medium-high — independent outlet |
| `2026-09-18` | `CornellDailySun_2026-09-18_lawsuit-reports.html` | Medium — first news cycle |
| — | **NYSCEF stamp / Index No. on the document** | **ABSENT — the only thing that would settle it** |

**Assessment.** A Word document last saved the evening of **September 14** was converted to PDF on the evening of **September 16**, and modified on **September 19**. The signature date is **September 14**. Those facts are entirely consistent with: signed September 14 → converted to PDF September 16 (likely from counsel's or the court's system) → filed on or about September 16 → touched again September 19.

The DA's September 18 learning date fits a September 16 filing better than a September 14 filing. The Snopes URL path (`/2026/09/`) and the Daily Sun's "Sept. 14 lawsuit" reference fit either.

**Conclusion: UNRESOLVED, and it cannot be resolved from this archive.** The reason is not the ambiguity in the dates — it is that the archive holds a **third-party mirror with no e-filing stamp, a blank Index No. field, and a `/ModDate` five days after its own stated publication date.** A document that has been modified after the date it purports to be filed cannot establish when it was filed.

**My assessment, stated as assessment and not finding: the preponderance of the internal metadata points to a filing on or about September 16, 2026, with September 14 being the date the complaint was signed or verified.** Confidence: Low-to-medium. This should not be published as a fact.

**The fix is one retrieval:** the NYSCEF docket for Index No. 161704/2026 will show a filing date, a Part, and a judge on its face. Until that document is in hand, any published statement about the filing date is a guess.

---

# PART 6 — CROSS-SOURCE CONTRADICTIONS, RANKED

Ordered by evidentiary significance, not by drama.

| # | Contradiction | Sources | Weight |
|---|---|---|---|
| 1 | **IPD investigation.** Complaint ¶187: "still being investigated by the Ithaca Police Department." IPD: "This incident was not reported to the Ithaca Police Department… learned of these allegations recently through the media." | Complaint ¶187 vs. IPD statement via `cdsun-ipd-never-reported.html`, Sep 28 2026 | **Highest.** An official body's public denial of a fact pleaded under oath. Establishes that complaint allegations were not verified with the entities named in them. |
| 2 | **"Newly released information."** Hochul cites it as the basis for removing the DA. DA identifies no new evidence. | Hochul Oct 1 vs. DA Sept 28, all 9 pp. | **Very high.** Either something exists outside the archive, or the stated basis is the lawsuit itself. |
| 3 | **The 5:45 a.m. ending.** "Lost consciousness" vs. "said she was tired… both guys stopped." | Complaint ¶174 vs. DA p.6 | **Very high.** Same witness, same timestamp, opposite legal characterizations; goes directly to physical helplessness. |
| 4 | **Capacity.** "completely incapacitated" (¶172) vs. "8 out of 10" (DA p.6). | Complaint ¶172 vs. DA p.6 | **Very high.** Directly contradicts the DA's legal conclusion. |
| 5 | **The word "Sure."** Drug-off-body episode: pleaded as forcible (§ ¶169) vs. quoted affirmative assent. | Complaint ¶169 vs. DA p.6 | **Very high.** Doe's own quoted word, in her own sworn statement. |
| 6 | **Intoxication.** ~10 standard drinks / visibly intoxicated (¶144) vs. "5 out of 10" on arrival. | Complaint ¶144 vs. DA p.4 | **High.** 2× discrepancy at the moment the DA says capacity was assessed. |
| 7 | **Ketamine voluntariness.** "pressured Plaintiff into snorting" (¶153) vs. "had already done Ketamine once so why not do it a second time." | Complaint ¶153 vs. DA p.6 | **High.** Goes to mental incapacitation. |
| 8 | **Male 3's entry.** "entered the room, grabbed Plaintiff away" (¶160) vs. "knocked on the door," "let him in," handshake. | Complaint ¶160 vs. DA p.5 | **High.** Goes to forcible compulsion and to notice. |
| 9 | **Seven vs. eight men charged.** DA: "the seven fraternity members." Baseline reporting: eight charged. Complaint names seven students + Petito, plus non-party Vega. | DA p.9 vs. caption + baseline | **High.** Unresolved; see §2.3, §2.5. |
| 10 | **Counsel never contacted the DA.** "I have never been contacted by Jane Doe's attorneys. Not to inform me the original statement was inaccurate." | DA pp.2, 4 | **High.** A verifiable absence over ~22 months, asserted by the DA and uncorroborated. |
| 11 | **Filing date.** Sept 14 (signature, filename, Daily Sun) vs. Sept 16 (PDF `/CreationDate`) vs. Sept 18 (DA's learning date). | See Part 5 | **Medium.** Unresolvable without the stamp. |
| 12 | **Archive provenance.** Complaint is a Snopes mirror; `/ModDate` post-dates `published`; AG ledger URL is fabricated; Index No. self-flagged "to confirm." | `ledger.csv`, `manifest.json`, PDF metadata | **High** as to the archive; **disqualifying** for the complaint's "as filed" status. |

---

# PART 7 — NEW LEADS AND OPEN QUESTIONS

Ordered by expected value per unit of effort.

### 7.1 Highest value

**1. The NYSCEF docket for Index No. 161704/2026.**
Resolves the filing date (§5), the missing judge and Part, and yields the **court-stamped complaint** that would replace the Snopes mirror — including whether the September 14/16 document is in fact the operative pleading. Everything about the complaint's provenance hangs on this. *Single highest-value retrieval in the entire analysis.*

**2. Governor Hochul's executive order appointing the AG as special prosecutor.**
Announced in the Oct 1 statement; **not in this archive.** This is the operative legal instrument defining the AG's scope, authority, and reporting obligations. Hochul's assertion of "newly released information" may be explained or sharpened by whatever the order recites.

**3. The content of the DA's "conversation with Jane Doe and her attorneys."**
The DA confirms it happened (§2.8) and identifies no new evidence (§2.9). This conversation is the one documented link between the sworn statement and the lawsuit. What was said in it — and whether it produced anything — is the central unanswered question of the entire chronology. Look for: a stipulation, a supplemental statement, an amended complaint, or a transcript.

### 7.2 High value

**4. The six-page sworn statement itself.**
The DA declined to release it, predicted it "will ultimately have to be released," and quoted it extensively. It is the document both sides agree is dispositive. §2.4 reconstructs large portions; the original is still needed, particularly for the **redacted name substitutions** the DA admits making ("unless names or pronouns have been redacted or adjusted for clarity"). Getting the unredacted original would **verify or destroy the Male Number mapping in §2.5** — currently inference.

**5. The identity of the eighth participant.**
Candidates: **Alex Vega** (¶150; present, non-party, excluded from ¶169) or the DA's **"[another male]"** (DA p.6). Resolve via charging documents, the TOMB notice, or a Doe-counsel statement. Do not publish the Vega identification without confirmation.

**6. Cornell University Police incident log, week of October 12–19, 2024.**
Complaint ¶¶333/358/383 plead that police responded to a **drug-related incident at 107 Edgemoor Lane one week before** the assault. If substantiated, this is the case's strongest institutional theory — notice at the exact address, of the exact risk category, one week prior. It is also the complaint's most specific and most checkable allegation.

**7. What Cornell's November 8, 2024 statement said, and whether it was public.**
The complaint footnoted the November 26 statement but **not** the November 8 response. The Nov 8 statement is the one describing the suspensions and the essays, and per baseline it contains Investigator Northrup's account of Doe's report. Whether it was publicly released — and if so, where — matters for what Cornell knew and when it said so.

### 7.3 Moderate value

**8. The 2026-09-14 through 2026-09-28 media cycle, mapped.**
`cdsun-0928-da-reopens.html`, `cdsun-ipd-never-reported.html`, `cdsun-202609-editorial-cornell-wont-we-will.html`, `cdsun-202609-ithaca-mayor-moratorium.html`, `CornellDailySun_2026-09-18_lawsuit-reports.html`. Establishes precisely when the case became public and therefore what the DA's "past two weeks" of calls and the Hochul "newly released information" can refer to. Also: `cdsun-faq-contradicts-da.html` and `cdsun-faq-edited.html` — a Cornell FAQ that **contradicts the DA and was edited** is a significant document-integrity question in its own right.

**9. Defendants' accounts.**
`Men Accused in Cornell Sex Assault Suit Give Varying Accounts of Night - GV Wire.html` and `tmz-gillio-lopes.html`. **"Varying accounts" is the single most useful phrase in the archive** — it is the only indication that any defendant has given a substantive account, and variation is the ordinary condition of a contested case. Read against the mapping in §2.5.

**10. The alleged omissions from the police statement.**
`Statement Written by Police in Cornell Assault Case Omitted Her Claim She Was Raped - The New York Times.html` and `pbs-1001-omitted-evidence.html` and `npr-0928-heres-what-we-know.html`. If the complaint's core allegation is that CUPD's report omitted a rape claim, that is a **different accusation from the one the DA answered** — the DA's statement addresses whether the facts were criminal, not whether CUPD's reporting was accurate. **These two issues should not be conflated**, and several secondary sources appear to conflate them.

**11. Doe-counsel statements.**
`cdsun-1003-details.html`, `nbc-doe-statement-details.html`, `ap-1001-texts-ny1.html`. Directly bears on lead 3 — what plaintiff's counsel told the DA, and when.

### 7.4 Lower value / completeness

**12. Cornell's post-appointment posture.** `cdsun-1003-cupd-drug-arrest.html`, `cdsun-202610-agrees-independent-review.html`, `cdsun-202610-james-launches-review.html`, `cdsun-202610-ifc-cancels-parties.html`, `cdsun-202610-aaup-statement.html`, `cdsun-202610-senators-demand-action.html`, `cdsun-202610-letter-1000-alumni.html`, `cdsun-202610-pelosi-cancels.html`. Note that the archive's AG index stops at **October 2**; everything in this bucket post-dates it.

**13. Remediation of `ledger.csv`.** Correct the fabricated AG URL (§3.7), annotate `Index No. 161704/2026` as an unverified hypothesis rather than an authoritative-source field (§1.1), and change the complaint's `title`/`published` fields to reflect that the source is a third-party mirror of unverified fidelity.

---

# PART 8 — CONFIDENCE REGISTER

| Finding | Confidence | Basis | What would change it |
|---|---|---|---|
| Complaint is a Snopes mirror, unstamped, modified post-`published` | **High** | `ledger.csv`, `manifest.json`, PDF metadata, all internally consistent | Forensic PDF inspection; a NYSCEF copy matching the hash |
| AG "ORIGINAL" and `ag-ny` are byte-identical | **High** | SHA-256 + zero-difference byte comparison | Nothing; already cryptographically settled |
| AG mirror has identical substantive text | **High** | Direct comparison of the two quoted paragraphs across all three files | Full-body diff |
| Male Number mapping (§2.5) | **High** for 1,2,3,4,7; **High as a pair** for 5/6; **Unresolved** for order | Each link anchored to an act described in both documents; "same first name" fingerprint | The unredacted sworn statement |
| Eighth participant is Alex Vega | **Low-medium** | Vega is present (¶150), non-party, excluded from ¶169; but the DA never names him | Charging documents; TOMB notice; Doe counsel |
| "No new evidence identified" by the DA | **High** | Verified across all nine pages | Production of documents post-dating Sept 28 |
| DA's stated basis was community pressure + elapsed time | **High** | Explicit in pp.1, 8 | — |
| Hochul relied on "newly released information" | **High** | Explicit, verbatim | The executive order |
| Filing date Sept 14 **or** Sept 16 | **Unresolved** | Internal metadata leans Sept 16; no stamp exists | NYSCEF docket |
| IPD never received the report | **High** | IPD's own quoted statement, via Daily Sun | IPD statement directly; CUPD referral records |
| Cornell had notice of a drug incident one week prior | **Medium as pleaded / Unverified in fact** | Pleaded three times (¶¶333/358/383) with no supporting detail | CUPD incident log, week of Oct 12–19, 2024 |
| Copy-paste defects in complaint | **High** | Each directly verifiable in the text | — |
| "Ethan Cohen" is a plaintiff-side paralegal/associate | **Low-medium** | PDF `/Author` on a Word→PDF chain; name absent from document | Custodian list; NYSCEF appearance record |
| Zero AG Cornell statements before Oct 1 | **High** | 81 index entries parsed across three index pages | An AG statement outside the captured index window |
| Complaint lines 851–1150 findings | **Medium** | Regex and anchor reads; sequential read gap (§Limitations #2) | Direct read of that span |
| NYSHRL privity / theory viability | **Not assessed** | Out of scope for this pass | Separate legal analysis |

---

*Prepared 2026-10-04 from `D:\Cornell-7`. Baseline findings excluded. All quotations verified against the source text extractions named in each section. Inference is labelled as inference. The complaint should not be characterized as "as filed" in publication until the NYSCEF copy is obtained — see §1.1.*