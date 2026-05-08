---
title: Cross-Border Payments
created: 2026-05-08
updated: 2026-05-08
type: concept
tags: [payments, cross-border, payment-rails, settlement]
sources: []
confidence: high
---

# Cross-Border Payments

## The Problem
Traditional cross-border payments are slow (1-5 days), expensive (2-7% in fees + hidden spread), opaque (no tracking), and require intermediaries at each step (correspondent banks).

## Crypto Solution
Stablecoins and blockchain rails eliminate intermediaries, enabling:
- **Settlement time:** Minutes instead of days
- **Cost:** $0.01-$1 vs $10-$30 for traditional
- **Transparency:** On-chain tracking of every step

## Key Protocols & Companies

### Rails
- [[stellar-network]] — XLM token, designed for cross-border payments from day one
- [[ripple-xrp]] — enterprise solution for banks (RippleNet), controversial XRP holdings
- [[circle-usdc]] — regulated stablecoin used increasingly for cross-border settlements
- [[new-payment-stack]] — Stripe's crypto payments layer

### Use Cases
- **Remittances:** Workers sending money home (e.g., Philippines, Mexico corridors)
- **B2B payments:** Invoice settlement between companies across borders
- **Settlement:** Netting between exchanges and institutional counterparties

## Regulatory Landscape
- FATF Travel Rule: Requires KYC for transactions over certain thresholds
- Countries are implementing varying degrees of crypto regulation
- See [[payment-regulation-overview]]

## Challenges
- **Off-ramps:** Recipients often need to convert back to local currency
- **Volatility:** Without stablecoins, crypto volatility makes payments impractical
- **Compliance:** Must meet AML/KYC requirements in both jurisdictions
- **UI/UX:** Too complex for mainstream adoption still

## Traditional Comparison
| Dimension | Traditional Wire | Crypto Rail |
|-----------|-----------------|-------------|
| Speed | 1-5 days | Minutes |
| Cost | $15-30 flat + % | $0.01-$1 |
| Availability | Business hours | 24/7 |
| Traceability | Limited | Full on-chain |

See [[payment-rails-comparison]] for detailed analysis.

## Related
- [[stablecoins]] — essential for payments (low volatility)
- [[merchant-payments]] — merchant-facing use case
- [[compliance-kyc]] — regulatory requirements
- [[blockchain-fundamentals]] — underlying technology