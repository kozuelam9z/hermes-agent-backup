---
title: Web3 & Payment Wiki Schema
created: 2026-05-08
updated: 2026-05-08
type: schema
tags: [meta, wiki]
---

# Web3 & Payment Wiki Schema

## Domain
This wiki covers **Web3/blockchain technology and modern payment systems** — including DeFi protocols, crypto assets, NFTs, layer-1/2 networks, payment infrastructure, stablecoins, and the intersection of traditional finance with decentralized systems.

## Conventions
- **File names**: lowercase, hyphens, no spaces (e.g., `ethereum-overview.md`, `stablecoin-comparison.md`)
- **Every wiki page** starts with YAML frontmatter (see below)
- **Use `[[wikilinks]]`** to link between pages (minimum 2 outbound links per page)
- **When updating a page**, always bump the `updated` date
- **Every new page** must be added to `index.md` under the correct section
- **Every action** must be appended to `log.md`
- **Provenance markers**: On pages synthesizing 3+ sources, append `^[raw/articles/source-file.md]` at the end of paragraphs whose claims come from a specific source

## Frontmatter
```yaml
---
title: Page Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
type: entity | concept | comparison | query | summary
tags: [from taxonomy below]
sources: [raw/articles/source-name.md]
confidence: high | medium | low
contested: true
contradictions: [other-page-slug]
---
```

## Tag Taxonomy
[Define top-level tags for Web3 & Payments]

- **Protocols**: defi, exchange, lending, staking, yield, amms, derivatives, options
- **Networks**: layer1, layer2, rollups, zk, optimistic, sidechain, bridge
- **Assets**: stablecoin, token, nft, governance-token, meme-coin
- **Payments**: payment-rails, merchant-payments, cross-border, settlement, compliance
- **Infrastructure**: wallets, custody, oracles, security, privacy
- **People/Orgs**: person, company, lab, protocol-org, exchange-company
- **Concepts**: consensus, smart-contract, tokenomics, yield-farming, liquidity
- **Meta**: comparison, timeline, controversy, prediction, regulation

## Page Thresholds
- **Create a page** when an entity/concept appears in 2+ sources OR is central to one source
- **Add to existing page** when a source mentions something already covered
- **DON'T create a page** for passing mentions, minor details, or things outside the domain
- **Split a page** when it exceeds ~200 lines
- **Archive a page** when content is fully superseded — move to `_archive/`, remove from index

## Raw Source Frontmatter
```yaml
---
source_url: <original URL if applicable>
ingested: YYYY-MM-DD
sha256: <hex digest of body content below>
---
```

## Update Policy
When new information conflicts with existing content:
1. Check dates — newer sources generally supersede older ones
2. If genuinely contradictory, note both positions with dates and sources
3. Mark contradiction in frontmatter: `contradictions: [page-name]`
4. Flag for user review in the lint report

## Entity Pages (People/Orgs)
One page per notable entity. Include:
- Overview / what it is
- Key facts and dates
- Relationships to other entities ([[wikilinks]])
- Source references

## Concept Pages
One page per concept or topic. Include:
- Definition / explanation
- Current state of knowledge
- Open questions or debates
- Related concepts ([[wikilinks]])

## Comparison Pages
- What is being compared and why
- Dimensions of comparison (table format preferred)
- Verdict or synthesis
- Sources

## Coverage Scope
**In scope:** DeFi, NFTs, Layer-1/2 protocols, stablecoins, payment rails, wallets, custody, oracles, cross-border payments, regulatory landscape, key protocols (Uniswap, Aave, Compound, etc.), institutional crypto adoption.

**Out of scope:** Meme coins as a category, trading alpha (short-term price movements), general crypto speculation.