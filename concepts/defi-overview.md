---
title: DeFi Overview
created: 2026-05-08
updated: 2026-05-08
type: concept
tags: [defi, protocols, lending, exchange]
sources: []
confidence: high
---

# DeFi (Decentralized Finance)

## Definition
DeFi refers to financial services — lending, borrowing, trading, derivatives, yield generation — built on public blockchains via smart contracts, without banks, brokers, or any centralized intermediary. The code is the intermediary.

## Core Primitives

### Lending & Borrowing
Permissionless, trustless lending pools. Lenders earn interest; borrowers provide collateral.
- [[aave]] — largest DeFi lending protocol ($10B+ TVL)
- [[compound-finance]] — algorithmic rate setting pioneer
- [[makerdao]] — generates DAI stablecoin from crypto collateral

### Decentralized Exchanges (DEX)
Automated market makers (AMMs) replace order books.
- [[uniswap]] — dominant AMM on Ethereum, $5B+ daily volume
- [[curve-finance]] — stablecoin-focused AMM with low slippage
- [[sushi-swap]] — fork of Uniswap with additional features

See [[dex-overview]] for detailed comparison.

### Derivatives
Options, perpetuals, synthetic assets.
- [[dydx]] — perpetual futures DEX
- [[gmx]] — perpetual trading on Avalanche/Arbitrum

### Yield Farming
Moving capital between DeFi protocols to maximize returns. Routes include lending, LPing, staking. See [[yield-farming-strategies]].

## Infrastructure

### Oracles
Provide real-world data (prices, weather) to smart contracts. See [[chainlink-oracles]].
- Chainlink is dominant; alternatives include [[band-protocol]] and [[pyth-network]]

### Aggregators
- [[yearn-finance]] — automatically moves funds to highest-yield strategies
- [[1inch]] — DEX aggregator finding best prices across exchanges

## Risks
- Smart contract bugs: $3B+ lost to exploits in 2022 alone
- Impermanent loss: LP positions can lose value vs holding
- Regulatory: DeFi protocols face increasing scrutiny
- Oracle manipulation: attackers can feed false data

See [[smart-contract-security]] and [[defi-risk-framework]]

## Related
- [[stablecoins]] — the primary currency of DeFi
- [[amm-protocols]] — deep dive on decentralized trading
- [[ethereum-overview]] — home chain for most DeFi
- [[layer2-scaling]] — scaling solutions that reduce fees