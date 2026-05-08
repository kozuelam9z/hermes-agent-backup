---
title: Stablecoins
created: 2026-05-08
updated: 2026-05-08
type: concept
tags: [assets, stablecoin, payment-rails, defi]
sources: []
confidence: high
---

# Stablecoins

## Definition
Cryptocurrency tokens designed to maintain a stable value, typically pegged 1:1 to a fiat currency like USD, EUR, or gold. They combine the speed and security of crypto with the price stability of traditional money.

## Types

### Fiat-Collateralized
Backed 1:1 by fiat reserves held in bank accounts.
- [[usdc-coin]] — fully reserved, regulated
- [[usdt-tether]] — largest by market cap, controversial reserves
- [[trusttoken]] — formerly TrueUSD, multi-bank model

**Pros:** Simple, direct redemption  
**Cons:** Centralized, requires trust in issuer

### Crypto-Collateralized
Backed by over-collateralized crypto assets (typically 150%+ due to volatility).
- [[dai-makerdao]] — decentralized, governed by MKR token holders

**Pros:** Decentralized, transparent  
**Cons:** Complex, susceptible to collateral crashes

### Algorithmic
No collateral; stability maintained through algorithm-controlled supply adjustments.
- [[frax-finance]] — partially collateralized algorithm
- [[empty-set-dollar]] — pure algorithmic (failed during 2022 crash)

**Pros:** No counterparty risk  
**Cons:** Unproven during stress; regulatory scrutiny

## Use Cases

### Payments & Remittances
Low volatility, fast settlement. Popular for cross-border transfers where traditional rails take days and charge high fees. See [[cross-border-payments]].

### DeFi Trading
Entry/exit point for trading. Traders convert USD → stablecoin → DeFi positions without leaving crypto. Powers [[amm-protocols]] and [[dex-overview]].

### Savings & Yield
Earn yield on stablecoins via DeFi protocols (Aave, Compound). APY typically 3-20% vs <5% for traditional savings. See [[yield-farming]].

### Commerce
Merchant acceptance growing. Stripe, PayPal support stablecoin settlements. See [[merchant-payments]].

## Market Context
As of 2024-2025, stablecoins are the dominant on/off ramp for DeFi. Tether (USDT) and USDC together represent $120B+ in market cap and process tens of billions in daily volume.

## Regulation
Stablecoins face increasing regulatory pressure:
- EU: MiCA regulation (2024) requires e-money licensing for euro stablecoins
- US: Multiple bills in Congress; Gensler (SEC) has called most "unregistered securities"
- See [[stablecoin-regulation]]

## Comparisons
- [[stablecoin-comparison]] — detailed cross-case analysis

## Related
- [[ethereum-overview]] — primary platform for stablecoin deployment
- [[defi-overview]] — where stablecoins power most activity
- [[payment-rails-comparison]] — traditional vs crypto payment rails