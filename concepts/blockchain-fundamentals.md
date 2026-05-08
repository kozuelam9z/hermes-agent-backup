---
title: Blockchain Fundamentals
created: 2026-05-08
updated: 2026-05-08
type: concept
tags: [concepts, layer1, consensus, smart-contract]
sources: []
confidence: high
---

# Blockchain Fundamentals

## Definition
A blockchain is a distributed, append-only ledger where transactions are grouped into blocks, cryptographically linked, and maintained by a decentralized network of nodes without requiring a trusted central authority.

## Core Components

### Blocks
- Contains a batch of transactions
- Has a cryptographic hash of the previous block (creating the "chain")
- Blocks are finalized through consensus — invalid blocks are rejected

### Consensus Mechanisms
| Mechanism | Examples | Characteristics |
|-----------|----------|-----------------|
| PoW (Proof of Work) | Bitcoin, (former) Ethereum | Energy-intensive, high security |
| PoS (Proof of Stake) | Ethereum 2.0, Solana | Energy-efficient, economic security |
| DPoS (Delegated PoS) | EOS, Tron | Fast, fewer validators |
| BFT variants | Cosmos SDK, Avalanche | High throughput, finality |

### Smart Contracts
Self-executing programs deployed on-chain. When predefined conditions are met, the contract automatically executes — no intermediary needed.

- [[ethereum-overview]] — major smart contract platform
- [[smart-contract-security]] — common vulnerability patterns

## Key Properties

### Decentralization
No single point of control. The network is operated by thousands of independent nodes across the globe.

### Immutability
Once a block is confirmed and added to the chain, altering it becomes computationally infeasible (requires rewriting the entire history).

### Transparency
All on-chain transactions are publicly visible. Anyone can verify the state of the ledger.

### Pseudonymity
Users interact via public addresses (e.g., `0x...`) rather than real-world identities, though this varies by chain and privacy features.

## trilemma
[[blockchain-trilemma]] — the trade-off between decentralization, security, and scalability. No chain can optimize for all three simultaneously.

## Related
- [[layer1-networks]] — base protocols that host the blockchain
- [[layer2-scaling]] — solutions built on top to address scalability
- [[consensus-mechanisms]] — deep dive on PoW vs PoS vs others