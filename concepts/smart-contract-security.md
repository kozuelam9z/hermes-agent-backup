---
title: Smart Contract Security
created: 2026-05-08
updated: 2026-05-08
type: concept
tags: [security, smart-contract, infrastructure, defi]
sources: []
confidence: high
---

# Smart Contract Security

## Why Security Matters
Smart contracts hold billions of dollars and are immutable once deployed. A bug cannot be patched like traditional software — funds are either safe or they are not. This makes security a unique, high-stakes discipline.

## Common Vulnerability Types

### Reentrancy
A contract calls another contract before updating its own state. The callee can recursively call back into the original, draining funds.
- **Famous example:** [[the-dao-hack]] (2016) — $60M stolen, led to Ethereum hard fork

**Prevention:** Checks-Effects-Interactions pattern; reentrancy guards; pull vs push payment patterns.

### Access Control
Functions that should be permissioned are left publicly callable.
- `initialize()` functions on proxies that weren't protected
- Missing `onlyOwner` modifiers

### Integer Overflow/Underflow
Before Solidity 0.8, arithmetic could wrap. `uint256 x = 0; x--` becomes `type(uint256).max`.

### Flash Loan Attacks
Borrow massive amounts within one transaction, manipulate prices, repay — all in one atomic transaction.
- Example: [[bzx-hacks]] (2020)
- Protocols must check atomic consistency

### Oracle Manipulation
Attackers influence asset prices fed to contracts via [[chainlink-oracles]] or cheap TWAP oracles.
- Often used in conjunction with flash loans

### Front-Running
Validators or bots see pending transactions and insert their own with higher gas to profit.
- DEX arbitrage, NFT mint front-running

## Security Measures

### Audits
- Trail of Bits, OpenZeppelin, Consensys Diligence are top firms
- Many projects undergo multiple audits before launch
- Audits don't eliminate all bugs — [[曲]] normal for exploits to still occur

### Formal Verification
Mathematical proofs that contract behaves as specified. Used by [[zksync]] and others for critical components.

### Bug Bounties
Many protocols offer $100K-$1M+ bounties for critical vulnerabilities.

### Insurance
- [[nexus-mutual]] — decentralized insurance for DeFi smart contract failures

### Monitoring
- [[open-zeppelin]] defender for operational security
- Real-time on-chain monitoring services

## Best Practices
1. Use battle-tested libraries (OpenZeppelin)
2. Minimize complexity
3. Write tests including fuzz testing
4. Multiple audit firms
5. Time-lock contract upgrades
6. Multi-sig admin keys

## Related
- [[ethereum-overview]] — most targeted chain for contract exploits
- [[defi-risk-framework]] — broader risk context
- [[layer2-scaling]] — some L2s offer stronger security guarantees