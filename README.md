# ALEO Private Token — Compliant Private Tokens Workshop (Uyo, Nigeria)

## Overview

**Aleo Private Token** was developed as part of a hands-on learning exercise focused on building and deploying **privacy-preserving fungible tokens** on the **Aleo blockchain**.  
The project demonstrates how to implement both **public** and **private minting** functions, test them using the **Aleo Playground CLI**, and deploy the final contract securely to the **Aleo Testnet**.

The token combines **public transparency** with **private confidentiality**, integrating an external compliance layer via the `workshop_ofac.aleo` module. Through this implementation, participants learn how to construct a real-world, regulation-aware digital asset system that balances privacy with accountability.

---

## Purpose

The **Compliant Private Tokens Workshop** was designed to teach Aleo developers in Uyo how to:

* Build compliant token programs using **Aleo**.
* Understand the dual architecture of **public mappings** and **private records**.
* Integrate **OFAC-style compliance checks** for every transaction.
* Apply **zero-knowledge proofs** to secure and verify token operations.

**ALEO Token** serves as a reference project for developers to grasp both conceptual and technical aspects of tokenization under Aleo’s privacy model.

---

## Core Principles

### 1. **Public Ledger Operations**

Public functions operate transparently, modifying a shared on-chain mapping of balances. Each address and its corresponding balance are visible on-chain, ensuring accountability where required.
All public operations:

* Enforce compliance before modifying state.
* Use `Mapping::get_or_use` and `Mapping::set` to handle balances securely.

**Examples:**

* `mint_public`: Adds tokens to a recipient’s balance after successful compliance verification.
* `transfer_public`: Moves tokens between visible balances, maintaining auditability.

---

### 2. **Private Record Operations**

Private functions use **Aleo’s record system**, allowing token transfers and ownership changes to remain confidential.
Each token record has the structure:

```aleo
record Token {
    owner: address,
    amount: u64
}
```

Records are consumed and recreated atomically, ensuring correctness without revealing participant identities or balances.

**Examples:**

* `mint_private`: Issues tokens as a new, encrypted record for the recipient.
* `transfer_private`: Transfers tokens privately, producing new records for both sender and recipient.

---

### 3. **Integrated Compliance Layer**

All operations interface with:

```aleo
workshop_ofac.aleo/address_check(address)
```

This ensures that every token interaction — mint or transfer — is preceded by a compliance check against restricted addresses. The process uses Aleo’s asynchronous `Future` mechanism, requiring the check to **complete before** any state or record update occurs.

This implementation models how **regulatory compliance can be encoded directly into decentralized systems** using Aleo’s async architecture.

---

## Functional Overview

| Function           | Visibility | Description                                                                     |
| ------------------ | ---------- | ------------------------------------------------------------------------------- |
| `mint_public`      | Public     | Mints tokens by increasing the recipient’s balance after compliance validation. |
| `mint_private`     | Private    | Issues a new token record privately to the recipient.                           |
| `transfer_public`  | Public     | Transfers visible balances between two addresses.                               |
| `transfer_private` | Private    | Privately transfers value using record consumption and regeneration.            |

---

## Learning Objectives

By completing the **ALEO Token** project, workshop participants learned to:

1. Define and use **mappings** and **records** in Aleo programs.
2. Write **async functions** that coordinate external compliance checks.
3. Manage both **public and private** state transitions securely.
4. Implement **regulatory enforcement** using external Aleo modules.
5. Design systems that merge **transparency and privacy** effectively.

---

## ✅ Deployment Details

* **Program Name:** `goodnessmbakara_compliant.aleo`
* **Workshop:** Compliant Private Tokens (Uyo, Nigeria)
* **Dependency:** `workshop_ofac.aleo`
* **Platform:** Aleo Testnet
* **Tools:** Aleo CLI
* **Transaction ID:** `at13y7nflxrxfdyrz3rewhy9qndk4wfnw2fvusc9pjr2vcyh453x5zseqgkr2`
* **Deployment Cost:** 5.607232 credits
* **Status:** ✅ Successfully deployed and confirmed!

**Build and Deploy Commands:**

```bash
leo build --network testnet --endpoint "https://api.explorer.provable.com/v1"
leo deploy --network testnet --endpoint "https://api.explorer.provable.com/v1" --broadcast
```

**Usage Examples:**

```bash
# Public operations
leo run mint_public aleo172mutxfy3ur6nj76ldr42jwnspejeam5p5hwpwj9axt855sgecpsgzanaq 100u64
leo run transfer_public aleo1RECIPIENT_ADDRESS... 50u64

# Private operations  
leo run mint_private aleo172mutxfy3ur6nj76ldr42jwnspejeam5p5hwpwj9axt855sgecpsgzanaq 100u64
leo run transfer_private {TOKEN_RECORD} aleo1RECIPIENT_ADDRESS... 50u64
```

**View on Explorer:**
- [Aleo Explorer](https://testnet.explorer.provable.com/program/goodnessmbakara_compliant.aleo)

---

## Educational Value

This project was the **practical component** of the Compliant Private Tokens Workshop in Uyo, aimed at bridging Aleo theory and applied zero-knowledge programming. It provided participants with hands-on experience in:

* Building privacy-first smart contracts.
* Enforcing compliance within cryptographic systems.
* Structuring token logic for both regulated and confidential use cases.

---

## Summary

**ALEO Token** embodies the central theme of the **Compliant Private Tokens Workshop (Uyo, Nigeria)** — that privacy and compliance can coexist within decentralized systems. It serves as an archetype for developing compliant, privacy-preserving token infrastructures on Aleo, illustrating how to balance **user confidentiality**, **regulatory transparency**, and **technical integrity** in one coherent zero-knowledge design.
