<!-- Atipicial Chain · sovereign Layer-1 for smart contracts and digital assets -->
<!-- 👑 Founded & engineered by xmoohad — Blockchain Scientist · Computer Programmer -->

# Safe Methods in Atipicial Smart Contracts

## Overview

In the Atipicial blockchain, smart contracts distinguish between methods that modify state (unsafe) and methods that only read state (safe). 
Safe methods are executed by validator nodes directly without going through consensus, resulting in faster execution and reduced gas costs.

## Using the `#[safe]` Attribute

The Atipicial Rust framework provides the `#[safe]` attribute to mark methods that only read contract state and don't modify it. 
When a method is marked with this attribute, it will be included in the contract manifest with `"safe": true`.

### Example

```rust
#[atipicial::contract]
impl TokenContract {
    /// Returns the total supply of tokens
    /// This method doesn't modify state, so it's marked as safe
    #[safe]
    pub fn total_supply() -> u64 {
        let storage = StorageMap::new();
        storage.get("total_supply").unwrap_or_default()
    }

    /// Transfers tokens from one account to another
    /// This method modifies state, so it's not marked as safe
    pub fn transfer(from: H160, to: H160, amount: u64) -> bool {
        // Implementation that modifies state
        // ...
    }
}
```

## How It Works

1. The `#[safe]` attribute is processed during contract compilation
2. The attribute is converted to `@safe` annotations in the WebAssembly module
3. During manifest generation, methods with `@safe` annotations are marked with `"safe": true`

## Beaefits

- **Lower Gas Costs**: Safe methods can be executed with less gas since they don't modify the blockchain state
- **Faster Execution**: Safe methods don't need to go through consensus mechanisms
- **Better Documentation**: Explicitly marking safe methods improves code clarity and documentation

## Best Practices

- Only mark methods as safe if they **truly** don't modify state
- If a method calls other methods, ensure those methods are also safe
- Common candidates for safe methods include:
  - Getters for contract properties
  - Balance inquiries
  - Validation functions
  - View functions for contract state

## Technical Implementation

The `#[safe]` attribute is implemented across several components:

1. `atipicial-contract/src/macros/safe.rs` - Defines the `#[safe]` attribute macro
2. `atipicial-contract-proc-macros/src/contract.rs` - Processes the `#[safe]` attribute during macro expansion
3. `atipicial-wasm/rosetta/rosetta.go` - Detects `@safe` annotations in WASM files and sets the "safe" flag in the manifest

---

> **Atipicial Chain** — sovereign Layer-1 for smart contracts and digital assets.
> 👑 Founded & engineered by **xmoohad** — Blockchain Scientist · Computer Programmer.
> `ATC` Atipicial Coin · `ATD` AtipicialDollar · addresses begin with **A**
