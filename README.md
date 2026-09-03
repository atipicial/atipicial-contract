<!-- Atipicial Chain · sovereign Layer-1 for smart contracts and digital assets -->
<!-- 👑 Founded & engineered by xmoohad — Blockchain Scientist · Computer Programmer -->

<p align="center">

# ATIPICIAL CONTRACT — The Forge

### Write smart contracts in Rust. Forge them into AEF.

**Contract SDK: attributes · syscalls · AEP-17/11 templates · manifest generation · oracle framework**

</p>

<p align="center">
  <img alt="Founder" src="https://img.shields.io/badge/%F0%9F%91%91_Founder-xmoohad-ff006e?style=for-the-badge">
  <img alt="Chain" src="https://img.shields.io/badge/Chain-Atipicial_L1-9d4edd?style=for-the-badge">
  <img alt="ATC" src="https://img.shields.io/badge/%F0%9F%AA%99_ATC-Atipicial_Coin-ffd60a?style=for-the-badge">
  <img alt="ATD" src="https://img.shields.io/badge/%F0%9F%92%B5_ATD-AtipicialDollar-06d6a0?style=for-the-badge">
  <img alt="License" src="https://img.shields.io/badge/License-MIT-3a86ff?style=for-the-badge">
</p>

---


Atipicial is a sovereign Layer-1 blockchain for smart contracts, digital assets,
and decentralized applications. **Atipicial
Contract is the forge**: write smart contracts in safe Rust, annotate with
attributes, compile to AEF (Atipicial Executable Format), and deploy — with
AEP-17 fungible tokens, AEP-11 NFTs, oracle integration, and manifest
generation built in.

Contracts can manage digital assets and interact with other contracts
on Atipicial. This SDK gives you
syscall-accurate bindings, efficient storage patterns, and a deployment
pipeline that verifies what you compiled is what you ship.


---

## ⚖️ The Design Laws of ATIPICIAL CONTRACT — The Forge

1. **Real, not fake.** Every function that claims to do something, does it.
   No stubs, no mocks wearing production clothes, no vaporware APIs.
2. **Typed or it doesn't exist.** Strings lying about being integers are a bug.
   Domain types own their invariants at construction.
3. **Determinism above all.** No nondeterministic iteration, floating point,
   or wall-clock time anywhere near consensus or state.
4. **Boundaries are law.** Layers depend downward. A service never reopens a
   database another service owns. Capabilities cross boundaries as narrow traits.
5. **Fail loud, fail early.** Invalid configuration is a startup error, not a
   runtime surprise three weeks later.
6. **Performance is earned.** Measured, benchmarked, and never traded against
   correctness.


---

## ⛓️ Chain Identity — What Every Atipicial Component Shares

| Attribute | Value |
|---|---|
| **Chain** | Atipicial Chain — sovereign Layer-1 for smart contracts and digital assets |
| **ATC** | Atipicial Coin — governance & staking, 1,000,000,000 total |
| **ATD** | AtipicialDollar — settlement & fees, 500,000,000 genesis |
| **Addresses** | Begin with capital **`A`** (version byte `0x09`) |
| **Genesis** | 2026-07-20 00:00:00 UTC |
| **Standards** | AEP-17 (fungible) · AEP-11 (NFT) · AEP-6 (wallets) · AEP-2 (keys) |
| **Format** | AEF — Atipicial Executable Format |
| **Consensus** | dBFT 2.0 — single-block finality |
| **Seeds** | `seed1-5.atipicial.com:10333` (P2P) · `seed1-5.atipicial.com:10332` (RPC) |


---

## ⚡ Quick Start — atipicial-contract

```bash
```
# 1 — get it
git clone https://github.com/atipicial/atipicial-contract.git && cd atipicial-contract && cargo build

# 2 — run it
cargo atipicial build --release   # → target/*.aef

# 3 — prove it works
deploy via atipicial-cli contract deploy
```


```
## 🌳 Repository Tree

```text
atipicial-contract/
├── .claude-flow/
│   └── metrics/
├── .github/
│   └── workflows/
├── .gitignore
├── .rustfmt.toml
├── ATC__VALIDATION_FRAMEWORK.md
├── COMPILATION_REPORT.md
├── COMPILATION_VERIFICATION.md
├── COMPREHENSIVE_TESTING_REPORT.md
├── COMPREHENSIVE_TEST_SUITE_SUMMARY.md
├── Cargo.toml
├── DEFI_CONTRACTS_SUMMARY.md
├── ENTERPRISE_INFRASTRUCTURE_SUMMARY.md
├── FIXED_SUMMARY.md
├── GITHUB_ACTIONS_FIX_SUMMARY.md
├── GITHUB_ACTIONS_SUMMARY.md
├── LICENSE
├── Makefile
├── Makefile.template
├── PRODUCTION_READINESS.md
├── PRODUCTION_READINESS_REPORT.md
├── PRODUCTION_READY_DEFI_CONTRACTS.md
├── PRODUCTION_READY_SUMMARY.md
├── README.md
├── REAL_DEFI_IMPLEMENTATIONS.md
├── SECURITY_HARDENING_REPORT.md
├── SOLANA_STYLE_README.md
├── SOLANA_SYNTAX_IMPLEMENTATION.md
├── analyze_failures.sh
├── atipicial-compiler/
│   ├── Cargo.toml
│   ├── src/
│   └── tests/
├── atipicial-contract/
│   ├── Cargo.toml
│   ├── Makefile.include
│   ├── src/
│   └── tests/
├── atipicial-contract-proc-macros/
│   ├── Cargo.toml
│   └── src/
├── build.rs
├── check_failed_examples.sh
├── check_syntax_patterns.sh
├── compile_all_examples.sh
├── compile_to_aef.sh
├── comprehensive_fix.sh
├── default.atipicial-express
├── deny.toml
├── deploy_contracts.sh
├── deploy_test.sh
├── docs/
│   ├── CHANGELOG.md
│   ├── DEPLOYMENT.md
│   ├── SOLANA_STYLE_GUIDE.md
│   ├── SUMMARY.md
│   ├── aep11-guide.md
│   ├── atipicial-syscall-implementation.md
│   ├── code-documentation-style.md
│   ├── contract-attributes.md
│   ├── efficient-contracts.md
│   ├── getting-started.md
│   ├── manifest-generation.md
│   ├── oracle-framework.md
│   ├── safe-methods.md
│   ├── serialization-guide.md
│   ├── solana-style-syntax-guide.md
│   ├── syscall-hash-calculation.md
│   ├── testing-guide.md
│   └── understanding-atipicial-manifests.md
├── examples/
│   ├── 01-hello-world/
│   ├── 01-hello-world-solana-style/
│   ├── 01-hello-world-solana-style-simple/
│   ├── 02-simple-storage/
│   ├── 02-simple-token/
│   ├── 03-counter/
│   ├── 04-aep17-token/
│   ├── 04-aep17-token-solana-style/
│   ├── 05-aep11-nft/
│   ├── 06-aep24-royalty-nft/
│   ├── 07-crowdfunding/
│   ├── 08-staking/
│   ├── 09-simple-dex/
│   ├── 10-multisig-wallet/
│   ├── 11-governance/
│   ├── 12-oracle-price-feed/
│   ├── 13-nft-marketplace/
│   ├── 14-atipicial-features-showcase/
│   ├── 15-atipicial-complete-features/
│   ├── COMPILATION_FIX_REPORT.md
│   ├── EXAMPLES_SUMMARY.md
│   ├── MODULAR_ARCHITECTURE_GUIDE.md
│   ├── Makefile.new
│   ├── Makefile.template
│   ├── README.md
│   ├── defi/
│   └── test_all_examples.sh
├── final_report.sh
├── final_validation.sh
├── find_failed.sh
├── fix_cargo_profiles.sh
├── fix_cargo_syntax.sh
├── fix_examples.sh
├── fix_wasm_boilerplate.sh
├── interactive_deploy.sh
├── netlify.toml
├── production_deploy.py
├── python_deploy.py
├── run_comprehensive_tests.sh
├── scripts/
│   ├── build_all.sh
│   ├── compile_all_defi.sh
│   ├── compile_to_aef.py
│   ├── deploy-examples.sh
│   ├── deploy.sh
│   ├── deploy_all_contracts.sh
│   ├── final-production-check.sh
│   ├── find-production-blockers.sh
│   ├── local-performance-benchmark.sh
│   ├── local-security-audit.sh
│   ├── local-working-ci.sh
│   ├── production-readiness-check.sh
│   ├── run-all-validations.sh
│   ├── test-like-github-actions.sh
│   ├── test_deployment.sh
│   ├── validate-atipicial--completeness.sh
│   ├── validate-github-actions.sh
│   ├── validate-infrastructure.sh
│   ├── validate-reference-implementation.sh
│   ├── verify_aef_manifest.py
│   └── verify_all_contracts.sh
├── simple_deploy_test.sh
├── systematic_compile.sh
├── test_all_compilation.sh
├── test_all_contracts.sh
├── test_debug/
│   ├── counter.aef
│   └── counter.manifest.json
├── test_enhanced_compiler.sh
├── test_output/
│   ├── hello_world_example.aef
│   └── hello_world_example.manifest.json
├── tests/
│   ├── integration.rs
│   ├── integration_test.sh
│   ├── mock_env.rs
│   └── syscall_tests.rs
├── validate_all_examples.sh
└── working_deploy.sh


```
---

## 🗂️ Complete Source Registry — 184 files · 54,387 lines

Every source file in this repository, inventoried. No file hidden,
no module forgotten. This is the real map of ATIPICIAL CONTRACT — The Forge.


### `(root)/` — 3 files · 422 lines

| File | Lang | Lines | Lead doc |
|---|---|---|---|
| `build.rs` | Rust | 116 | — |
| `production_deploy.py` | Python | 185 | !/usr/bin/env python3 |
| `python_deploy.py` | Python | 121 | !/usr/bin/env python3 |

### `atipicial-compiler/` — 17 files · 9,672 lines

| File | Lang | Lines | Lead doc |
|---|---|---|---|
| `atipicial-compiler/src/aef.rs` | Rust | 433 | ATC Executable Format version 3 |
| `atipicial-compiler/src/debug.rs` | Rust | 548 | Debug utilities for ATC smart contracts |
| `atipicial-compiler/src/lib.rs` | Rust | 442 | Main compiler structure for converting WASM to AEF |
| `atipicial-compiler/src/main.rs` | Rust | 136 | [derive(Parser)] |
| `atipicial-compiler/src/manifest.rs` | Rust | 360 | ATC contract manifest |
| `atipicial-compiler/src/memory_model.rs` | Rust | 888 | WASM linear memory to Atipicial storage model translator |
| `atipicial-compiler/src/opcodes.rs` | Rust | 492 | ATC VM Opcodes |
| `atipicial-compiler/src/optimizer.rs` | Rust | 655 | Compiler optimization engine for AEF bytecode |
| `atipicial-compiler/src/solana_detector.rs` | Rust | 319 | Detector for Solana-style smart contracts |
| `atipicial-compiler/src/translator.rs` | Rust | 614 | WASM to ATC VM bytecode translator |
| `atipicial-compiler/src/wasm_parser.rs` | Rust | 716 | WASM instruction parser and translator |
| `atipicial-compiler/tests/compilation_pipeline_comprehensive.rs` | Rust | 1692 | Comprehensive Compilation Pipeline Tests |
| `atipicial-compiler/tests/comprehensive_compiler_tests.rs` | Rust | 697 | Comprehensive Compiler Tests for Atipicial Rust Framework |
| `atipicial-compiler/tests/e2e_tests.rs` | Rust | 358 | Helper to compile Rust code to WASM |
| `atipicial-compiler/tests/instruction_translation_tests.rs` | Rust | 409 | Test suite for WASM instruction translation |
| `atipicial-compiler/tests/integration_comprehensive.rs` | Rust | 616 | Comprehensive Integration Tests for Atipicial Compiler |
| `atipicial-compiler/tests/integration_tests.rs` | Rust | 297 | [test] |

### `atipicial-contract/` — 117 files · 28,041 lines

| File | Lang | Lines | Lead doc |
|---|---|---|---|
| `atipicial-contract/src/account.rs` | Rust | 93 | Trait for account serialization |
| `atipicial-contract/src/atipicial_features.rs` | Rust | 784 | [inline(always)] |
| `atipicial-contract/src/context.rs` | Rust | 247 | Solana-style Context type for Atipicial smart contracts |
| `atipicial-contract/src/contract/aep.rs` | Rust | 61 | ![allow(dead_code)] |
| `atipicial-contract/src/contract/aep11.rs` | Rust | 360 | [inline(always)] |
| `atipicial-contract/src/contract/aep17.rs` | Rust | 181 | Default total supply key. |
| `atipicial-contract/src/contract/aep24.rs` | Rust | 311 | AEP-24: NFT Royalty Standard |
| `atipicial-contract/src/contract/aep26_27.rs` | Rust | 326 | AEP-26: NFT Transfer Callback |
| `atipicial-contract/src/contract/event.rs` | Rust | 20 | — |
| `atipicial-contract/src/contract/mod.rs` | Rust | 61 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/contract/native/atipicial.rs` | Rust | 199 | [allow(unused_imports)] |
| `atipicial-contract/src/contract/native/gas.rs` | Rust | 71 | [allow(unused_imports)] |
| `atipicial-contract/src/contract/native/legder.rs` | Rust | 56 | [allow(unused_imports)] |
| `atipicial-contract/src/contract/native/mod.rs` | Rust | 131 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/contract/native/oracle.rs` | Rust | 51 | [allow(unused_imports)] |
| `atipicial-contract/src/contract/native/policy.rs` | Rust | 88 | [allow(unused_imports)] |
| `atipicial-contract/src/contract/token.rs` | Rust | 132 | [allow(unused_imports)] |
| `atipicial-contract/src/crypto/hash.rs` | Rust | 16 | — |
| `atipicial-contract/src/crypto/mod.rs` | Rust | 107 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/env/asm.rs` | Rust | 125 | ![allow(unused)] |
| `atipicial-contract/src/env/contract.rs` | Rust | 164 | ![allow(unused)] |
| `atipicial-contract/src/env/crypto.rs` | Rust | 40 | ![allow(unused)] |
| `atipicial-contract/src/env/extension.rs` | Rust | 54 | ![allow(unused)] |
| `atipicial-contract/src/env/mod.rs` | Rust | 13 | — |
| `atipicial-contract/src/env/native.rs` | Rust | 42 | ![allow(unused)] |
| `atipicial-contract/src/env/numeric.rs` | Rust | 105 | ![allow(unused)] |
| `atipicial-contract/src/env/stdlib.rs` | Rust | 39 | ![allow(unused)] |
| `atipicial-contract/src/env/syscall.rs` | Rust | 160 | ![allow(unused)] |
| `atipicial-contract/src/error.rs` | Rust | 262 | Contract error types |
| `atipicial-contract/src/event/mod.rs` | Rust | 6 | — |
| `atipicial-contract/src/lib.rs` | Rust | 121 | ![no_std] |
| `atipicial-contract/src/macros/mod.rs` | Rust | 36 | Module for macro-related definitions |
| `atipicial-contract/src/macros/safe.rs` | Rust | 45 | Attribute to mark a contract method as read-only (safe) |
| `atipicial-contract/src/native/atipicial.rs` | Rust | 85 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/native/atipicial_governance.rs` | Rust | 247 | ATC Governance Functions |
| `atipicial-contract/src/native/contract.rs` | Rust | 56 | Get contract details by script hash |
| `atipicial-contract/src/native/contract_management.rs` | Rust | 61 | Represents the ContractManagement native contract. |
| `atipicial-contract/src/native/cryptolib.rs` | Rust | 149 | CryptoLib Native Contract |
| `atipicial-contract/src/native/gas.rs` | Rust | 82 | Transfer GAS tokens from one account to another |
| `atipicial-contract/src/native/mod.rs` | Rust | 11 | — |
| `atipicial-contract/src/native/stdlib.rs` | Rust | 82 | Encode binary data to base64 string |
| `atipicial-contract/src/native/stdlib_extended.rs` | Rust | 204 | Extended StdLib Native Contract Functions |
| `atipicial-contract/src/runtime/assert.rs` | Rust | 40 | [inline(always)] |
| `atipicial-contract/src/runtime/mod.rs` | Rust | 158 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/serialization.rs` | Rust | 168 | Serialization utilities for storage operations |
| `atipicial-contract/src/serialize/atipicial_serializable.rs` | Rust | 306 | Trait for types that can be serialized to and from Atipicial's binary format |
| `atipicial-contract/src/serialize/deserialize.rs` | Rust | 247 | Trait for types that can be deserialized |
| `atipicial-contract/src/serialize/mod.rs` | Rust | 10 | — |
| `atipicial-contract/src/serialize/serialize.rs` | Rust | 223 | Trait for types that can be serialized |
| `atipicial-contract/src/services/contract.rs` | Rust | 72 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/services/crypto.rs` | Rust | 45 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/services/event.rs` | Rust | 44 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/services/iterator.rs` | Rust | 105 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/services/mod.rs` | Rust | 9 | — |
| `atipicial-contract/src/services/runtime.rs` | Rust | 336 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/services/storage.rs` | Rust | 168 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/smart_contract.rs` | Rust | 16 | Base struct for all smart contracts. |
| `atipicial-contract/src/storage/item.rs` | Rust | 2 | — |
| `atipicial-contract/src/storage/map.rs` | Rust | 80 | [allow(unused_imports)] |
| `atipicial-contract/src/storage/mod.rs` | Rust | 113 | [allow(unused_imports)] |
| `atipicial-contract/src/types/atipicial.rs` | Rust | 169 | Atipicial-specific types for the Atipicial smart contract framework |
| `atipicial-contract/src/types/block.rs` | Rust | 35 | [repr(C)] |
| `atipicial-contract/src/types/builtin/any.rs` | Rust | 332 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/array.rs` | Rust | 250 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/buffer.rs` | Rust | 47 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/bytes.rs` | Rust | 96 | [cfg(target_family = "wasm")] |
| `atipicial-contract/src/types/builtin/h160.rs` | Rust | 185 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/h256.rs` | Rust | 123 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/int256.rs` | Rust | 641 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/interop.rs` | Rust | 17 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/map.rs` | Rust | 190 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/mod.rs` | Rust | 51 | — |
| `atipicial-contract/src/types/builtin/nullable.rs` | Rust | 107 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/primitive.rs` | Rust | 22 | Marker trait for primitive types that can be used as keys in a Map. |
| `atipicial-contract/src/types/builtin/string.rs` | Rust | 303 | [allow(unused_imports)] |
| `atipicial-contract/src/types/builtin/structs.rs` | Rust | 22 | [allow(unused_imports)] |
| `atipicial-contract/src/types/consts.rs` | Rust | 307 | [repr(u32)] |
| `atipicial-contract/src/types/contract.rs` | Rust | 229 | [repr(C)] |
| `atipicial-contract/src/types/key.rs` | Rust | 60 | [repr(C)] |
| `atipicial-contract/src/types/mod.rs` | Rust | 55 | — |
| `atipicial-contract/src/types/notification.rs` | Rust | 29 | [repr(C)] |
| `atipicial-contract/src/types/placeholder.rs` | Rust | 100 | [repr(C)] |
| `atipicial-contract/src/types/signer.rs` | Rust | 76 | [repr(C)] |
| `atipicial-contract/src/types/storage.rs` | Rust | 211 | [allow(unused_imports)] |
| `atipicial-contract/src/types/tx.rs` | Rust | 61 | [repr(C)] |
| `atipicial-contract/src/utils.rs` | Rust | 96 | Utility macros for no_std environment |
| `atipicial-contract/tests/advanced_types_tests.rs` | Rust | 268 | Advanced unit tests for atipicial-contract types with comprehensive coverage. |
| `atipicial-contract/tests/aep_standards_comprehensive.rs` | Rust | 800 | Comprehensive AEP Standards Compliance Tests |
| `atipicial-contract/tests/aep_standards_test.rs` | Rust | 274 | Tests for AEP standards implementation |
| `atipicial-contract/tests/annotation_tests.rs` | Rust | 348 | Comprehensive tests for the Atipicial Rust smart contract framework |
| `atipicial-contract/tests/comprehensive_unit_tests.rs` | Rust | 879 | Comprehensive Unit Tests for Atipicial Rust Framework |
| `atipicial-contract/tests/contract_attributes_tests.rs` | Rust | 272 | Unit tests for atipicial-contract attributes and macros. |
| `atipicial-contract/tests/core_functionality_tests.rs` | Rust | 272 | Core functionality tests for Atipicial smart contract framework |
| `atipicial-contract/tests/core_types_comprehensive.rs` | Rust | 977 | Comprehensive Core Types Testing |
| `atipicial-contract/tests/end_to_end_comprehensive.rs` | Rust | 957 | End-to-End Integration Tests for Atipicial Rust Framework |
| `atipicial-contract/tests/end_to_end_test.rs` | Rust | 393 | End-to-end contract tests |
| `atipicial-contract/tests/enhanced_mock_env.rs` | Rust | 925 | Enhanced Mock Environment for Atipicial Rust Framework Testing |
| `atipicial-contract/tests/error_handling_comprehensive.rs` | Rust | 1403 | Comprehensive Error Handling and Edge Case Tests |
| `atipicial-contract/tests/example_contracts_comprehensive.rs` | Rust | 1201 | Comprehensive Example Contract Tests |
| `atipicial-contract/tests/integration_tests.rs` | Rust | 153 | Integration tests for the Atipicial Rust smart contract framework. |
| `atipicial-contract/tests/mock_env.rs` | Rust | 257 | Mock Atipicial environment for testing purposes. |
| `atipicial-contract/tests/mod.rs` | Rust | 26 | Atipicial Contract Framework Test Suite |
| `atipicial-contract/tests/native_contracts_test.rs` | Rust | 259 | Integration tests for Atipicial native contracts |
| `atipicial-contract/tests/runtime_services_comprehensive.rs` | Rust | 1111 | Comprehensive Runtime and Services Tests |
| `atipicial-contract/tests/security_hardening_tests.rs` | Rust | 289 | Security Hardening Tests |
| `atipicial-contract/tests/security_performance_tests.rs` | Rust | 914 | Security and Performance Tests for Atipicial Rust Framework |
| `atipicial-contract/tests/serialization_tests.rs` | Rust | 88 | Unit tests for atipicial-contract serialization functionality. |
| `atipicial-contract/tests/services_tests.rs` | Rust | 76 | Unit tests for atipicial-contract services. |
| `atipicial-contract/tests/solana_contracts_tests.rs` | Rust | 461 | ![cfg(test)] |
| `atipicial-contract/tests/solana_style_tests.rs` | Rust | 140 | ![cfg(test)] |
| `atipicial-contract/tests/storage_runtime_test.rs` | Rust | 297 | Tests for storage and runtime services |
| `atipicial-contract/tests/storage_system_comprehensive.rs` | Rust | 959 | Comprehensive Storage System Tests |
| `atipicial-contract/tests/storage_tests.rs` | Rust | 223 | Unit tests for atipicial-contract storage functionality. |
| `atipicial-contract/tests/test_utils.rs` | Rust | 470 | Test utilities and helpers for Atipicial smart contract testing |
| `atipicial-contract/tests/types_test.rs` | Rust | 338 | Unit tests for Atipicial contract types |
| `atipicial-contract/tests/types_tests.rs` | Rust | 247 | Unit tests for atipicial-contract types. |
| `atipicial-contract/tests/wasm_aef_integration_comprehensive.rs` | Rust | 1324 | Comprehensive WASM→AEF Integration Tests |

### `atipicial-contract-proc-macros/` — 4 files · 1,300 lines

| File | Lang | Lines | Lead doc |
|---|---|---|---|
| `atipicial-contract-proc-macros/src/contract.rs` | Rust | 260 | [no_mangle] |
| `atipicial-contract-proc-macros/src/lib.rs` | Rust | 674 | It exports the MyContract methods as no_mangle methods: |
| `atipicial-contract-proc-macros/src/program.rs` | Rust | 160 | (#mod_attrs)* |
| `atipicial-contract-proc-macros/src/structs.rs` | Rust | 206 | [cfg(target_family = "wasm")] |

### `examples/` — 38 files · 13,133 lines

| File | Lang | Lines | Lead doc |
|---|---|---|---|
| `examples/01-hello-world-solana-style-simple/src/lib.rs` | Rust | 123 | ![no_std] |
| `examples/01-hello-world-solana-style/src/lib.rs` | Rust | 134 | ![no_std] |
| `examples/01-hello-world/src/lib.rs` | Rust | 71 | ![no_std] |
| `examples/01-hello-world/src/lib_solana_style.rs` | Rust | 333 | # Hello World Smart Contract - Solana Style |
| `examples/02-simple-storage/src/lib.rs` | Rust | 104 | ![no_std] |
| `examples/02-simple-token/src/lib.rs` | Rust | 218 | ![no_std] |
| `examples/03-counter/src/lib.rs` | Rust | 109 | ![no_std] |
| `examples/04-aep17-token-solana-style/src/lib.rs` | Rust | 399 | ![no_std] |
| `examples/04-aep17-token/src/lib.rs` | Rust | 570 | # AEP-17 Fungible Token Contract |
| `examples/04-aep17-token/src/lib_solana_style.rs` | Rust | 583 | # AEP-17 Token Contract - Solana Style |
| `examples/05-aep11-nft/src/lib.rs` | Rust | 292 | ![no_std] |
| `examples/06-aep24-royalty-nft/src/lib.rs` | Rust | 402 | ![no_std] |
| `examples/07-crowdfunding/src/lib.rs` | Rust | 273 | ![no_std] |
| `examples/08-staking/src/lib.rs` | Rust | 304 | ![no_std] |
| `examples/09-simple-dex/src/lib.rs` | Rust | 703 | # Simple Decentralized Exchange (DEX) |
| `examples/10-multisig-wallet/src/lib.rs` | Rust | 746 | # Multi-Signature Wallet Contract |
| `examples/11-governance/src/lib.rs` | Rust | 782 | # Governance Contract |
| `examples/12-oracle-price-feed/src/lib.rs` | Rust | 632 | # Oracle Price Feed Contract |
| `examples/13-nft-marketplace/src/auctions.rs` | Rust | 694 | # Auction Management |
| `examples/13-nft-marketplace/src/lib.rs` | Rust | 249 | # NFT Marketplace Contract |
| `examples/13-nft-marketplace/src/listings.rs` | Rust | 537 | # Listing Management |
| `examples/13-nft-marketplace/src/offers.rs` | Rust | 151 | # Offer Management |
| `examples/13-nft-marketplace/src/royalties.rs` | Rust | 302 | # Royalty Management |
| `examples/13-nft-marketplace/src/storage.rs` | Rust | 377 | # Storage Management |
| `examples/13-nft-marketplace/src/types.rs` | Rust | 358 | # Marketplace Types |
| `examples/14-atipicial-features-showcase/src/lib.rs` | Rust | 83 | ![no_std] |
| `examples/15-atipicial-complete-features/src/lib.rs` | Rust | 75 | ![no_std] |
| `examples/15-atipicial-complete-features/src/lib_fixed.rs` | Rust | 43 | ![no_std] |
| `examples/defi/aave-flashloan/src/lib.rs` | Rust | 74 | ![no_std] |
| `examples/defi/compound-lending/src/lib.rs` | Rust | 82 | ![no_std] |
| `examples/defi/deploy-contracts.py` | Python | 204 | !/usr/bin/env python3 |
| `examples/defi/real-aave-flash/src/lib.rs` | Rust | 838 | ![no_std] |
| `examples/defi/real-aep17-token/src/lib.rs` | Rust | 502 | ![no_std] |
| `examples/defi/real-compound-lending/src/lib.rs` | Rust | 860 | ![no_std] |
| `examples/defi/real-uniswap-amm/src/lib.rs` | Rust | 608 | ![no_std] |
| `examples/defi/test-defi-operations.py` | Python | 181 | !/usr/bin/env python3 |
| `examples/defi/test-tokens/src/lib.rs` | Rust | 74 | ![no_std] |
| `examples/defi/uniswap-v2-amm/src/lib.rs` | Rust | 63 | ![no_std] |

### `scripts/` — 2 files · 1,174 lines

| File | Lang | Lines | Lead doc |
|---|---|---|---|
| `scripts/compile_to_aef.py` | Python | 584 | !/usr/bin/env python3 |
| `scripts/verify_aef_manifest.py` | Python | 590 | !/usr/bin/env python3 |

### `tests/` — 3 files · 645 lines

| File | Lang | Lines | Lead doc |
|---|---|---|---|
| `tests/integration.rs` | Rust | 173 | Integration tests for Atipicial Rust Smart Contract Framework |
| `tests/mock_env.rs` | Rust | 333 | Mock Atipicial environment for testing purposes. |
| `tests/syscall_tests.rs` | Rust | 139 | [test] |

---

## 🧬 Public API Surface — Every Exported Symbol

The complete inventory of public symbols this project exposes. 
**1,794 exported symbols across 133 files.**

This is the contract surface other Atipicial components build against.

**`atipicial-compiler/src/aef.rs`** (20 symbols): `Aef3`, `MAGIC`, `new`, `add_token`, `to_bytes`, `from_bytes`, `verify_checksum`, `size`, `MethodToken`, `new`, `to_bytes`, `from_bytes`, `size`, `CallFlags`, `NONE`, `ALLOW_CALL`, `ALLOW_NOTIFY`, `ALLOW_STATES`, `ALLOW_MODIFY_STATES`, `ALL`

**`atipicial-compiler/src/debug.rs`** (10 symbols): `Debugger`, `new`, `add_breakpoint`, `remove_breakpoint`, `disassemble`, `step`, `reset`, `current_position`, `set_position`, `StepResult`

**`atipicial-compiler/src/lib.rs`** (24 symbols): `debug`, `manifest`, `memory_model`, `aef`, `opcodes`, `optimizer`, `solana_detector`, `translator`, `wasm_parser`, `AtipicialCompiler`, `new`, `with_debug`, `with_source`, `with_output_dir`, `compile`, `compile_all_examples`, `CompilationResult`, `WasmModule`, `get_function_names`, `WasmImport`, `WasmExport`, `WasmFunction`, `WasmDataSegment`, `WasmMemory`

**`atipicial-compiler/src/manifest.rs`** (16 symbols): `Manifest`, `from_file`, `to_file`, `for_solana_style`, `add_aep17_standard`, `add_aep11_standard`, `Group`, `Features`, `Abi`, `Method`, `new`, `add_param`, `returns`, `Parameter`, `Event`, `Permission`

**`atipicial-compiler/src/memory_model.rs`** (10 symbols): `MemoryModelTranslator`, `MemoryRegion`, `MemoryAccessType`, `MemoryOperation`, `MemoryOperationType`, `new`, `initialize`, `translate_memory_operation`, `get_memory_stats`, `MemoryStats`

**`atipicial-compiler/src/opcodes.rs`** (47 symbols): `OpCode`, `from_byte`, `to_byte`, `is_jump`, `is_call`, `size`, `SysCall`, `SYSTEM_CONTRACT_CALL`, `SYSTEM_CONTRACT_CALL_NATIVE`, `SYSTEM_CONTRACT_CREATE_STANDARD_ACCOUNT`, `SYSTEM_CONTRACT_CREATE_MULTISIG_ACCOUNT`, `SYSTEM_CONTRACT_GET_CALL_FLAGS`, `SYSTEM_RUNTIME_PLATFORM`, `SYSTEM_RUNTIME_GET_TRIGGER`, `SYSTEM_RUNTIME_GET_TIME`, `SYSTEM_RUNTIME_GET_SCRIPT_CONTAINER`, `SYSTEM_RUNTIME_GET_EXECUTING_SCRIPT_HASH`, `SYSTEM_RUNTIME_GET_CALLING_SCRIPT_HASH`, `SYSTEM_RUNTIME_GET_ENTRY_SCRIPT_HASH`, `SYSTEM_RUNTIME_CHECK_WITNESS`, `SYSTEM_RUNTIME_GET_INVOCATION_COUNTER`, `SYSTEM_RUNTIME_GET_GAS_LEFT`, `SYSTEM_RUNTIME_GET_NOTIFICATIONS`, `SYSTEM_RUNTIME_GET_NETWORK`, `SYSTEM_RUNTIME_GET_RANDOM`, `SYSTEM_RUNTIME_LOG`, `SYSTEM_RUNTIME_NOTIFY`, `SYSTEM_RUNTIME_GET_TX`, `SYSTEM_RUNTIME_BURN_GAS`, `SYSTEM_STORAGE_GET_CONTEXT`, `SYSTEM_STORAGE_GET_READ_ONLY_CONTEXT`, `SYSTEM_STORAGE_AS_READ_ONLY`, `SYSTEM_STORAGE_GET`, `SYSTEM_STORAGE_FIND`, `SYSTEM_STORAGE_PUT`, `SYSTEM_STORAGE_DELETE`, `SYSTEM_CRYPTO_CHECK_SIG`, `SYSTEM_CRYPTO_CHECK_MULTISIG`, `SYSTEM_CRYPTO_SHA256`, `SYSTEM_CRYPTO_RIPEMD160`, `SYSTEM_CRYPTO_VERIFY_WITH_ECDSA`, `SYSTEM_CRYPTO_MURMUR32`, `SYSTEM_ITERATOR_CREATE`, `SYSTEM_ITERATOR_NEXT`, `SYSTEM_ITERATOR_VALUE`, `SYSTEM_JSON_SERIALIZE`, `SYSTEM_JSON_DESERIALIZE`

**`atipicial-compiler/src/optimizer.rs`** (13 symbols): `CompilerOptimizer`, `OptimizationStats`, `BasicBlock`, `ControlFlowGraph`, `new`, `optimize`, `build_control_flow_graph`, `eliminate_dead_code`, `fold_constants`, `peephole_optimize`, `combine_instructions`, `get_stats`, `reset_stats`

**`atipicial-compiler/src/solana_detector.rs`** (8 symbols): `SolanaStyleDetector`, `HandlerInfo`, `new`, `detect`, `is_solana_style`, `get_program_module`, `get_handlers`, `generate_manifest`

**`atipicial-compiler/src/translator.rs`** (4 symbols): `WasmTranslator`, `new`, `set_wasm_bytes`, `translate`

**`atipicial-compiler/src/wasm_parser.rs`** (7 symbols): `WasmInstructionParser`, `ControlLabel`, `ControlType`, `InstructionMapping`, `new`, `parse_function_body_simple`, `translate_operator`

**`atipicial-compiler/tests/compilation_pipeline_comprehensive.rs`** (59 symbols): `hello_world`, `greet`, `storage_contract`, `store_value`, `get_value`, `token_contract`, `total_supply`, `balance_of`, `transfer`, `solana_hello`, `initialize`, `greet`, `Initialize`, `Greet`, `GreetingAccount`, `broken_contract`, `broken_function`, `dependency_contract`, `hash_data`, `verify_signature`, `get_atipicial_balance`, `simple_contract`, `add_numbers`, `multiply_by_constant`, `test_program`, `initialize`, `process_data`, `Initialize`, `UpdateData`, `DataAccount`, `ErrorCode`, `complex_program`, `create_token`, `transfer_tokens`, `CreateToken`, `TransferTokens`, `Token`, `TokenAccount`, `TokenCreated`, `Transfer`, `ErrorCode`, `ComplexConstraints`, `complete_contract`, `owner`, `transfer_ownership`, `solana_style_complete`, `initialize`, `update_value`, `Initialize`, `UpdateValue`, `DataAccount`, `LEN`, `Initialized`, `ValueUpdated`, `ErrorCode`, `broken_contract`, `test`, `bad_contract`, `test`

**`atipicial-compiler/tests/comprehensive_compiler_tests.rs`** (8 symbols): `ContractTestFramework`, `new`, `deploy_mock_contract`, `invoke_mock_method`, `TestScenario`, `new`, `add_step`, `run`

**`atipicial-compiler/tests/e2e_tests.rs`** (5 symbols): `TestContract`, `init`, `initialize`, `get_value`, `set_value`

**`atipicial-contract/src/account.rs`** (12 symbols): `AccountSerialize`, `AccountDeserialize`, `AccountValidation`, `AccountLoader`, `load`, `load_mut`, `AccountMeta`, `new`, `new_readonly`, `ToAccountInfo`, `ToAccountMetas`, `EmptyAccount`

**`atipicial-contract/src/atipicial_features.rs`** (66 symbols): `Script`, `oracle`, `OracleFilter`, `OracleResponseCode`, `request`, `handle_response`, `native`, `atipicial`, `script_hash`, `symbol`, `decimals`, `total_supply`, `balance_of`, `transfer`, `register_candidate`, `vote`, `get_candidates`, `get_committee`, `get_next_block_validators`, `get_gas_per_block`, `gas`, `script_hash`, `symbol`, `decimals`, `balance_of`, `transfer`, `policy`, `script_hash`, `get_fee_per_byte`, `get_exec_fee_factor`, `get_storage_price`, `is_blocked`, `management`, `script_hash`, `deploy`, `update`, `destroy`, `get_contract`, `has_method`, `get_minimum_deployment_fee`, `crypto`, `script_hash`, `sha256`, `ripemd160`, `verify_with_ecdsa`, `stdlib`, `script_hash`, `serialize`, `deserialize`, `json_serialize`, `json_deserialize`, `base64_encode`, `base64_decode`, `base58_encode`, `base58_decode`, `itoa`, `atoi`, `crypto`, `NamedCurve`, `murmur32`, `bls12_381_add`, `bls12_381_mul`, `bls12_381_pairing`, `Block`, `Transaction`, `Contract`

**`atipicial-contract/src/context.rs`** (32 symbols): `Context`, `new`, `with_accounts`, `AccountInfo`, `Account`, `is_mutable`, `exists`, `has_one`, `verify_pda`, `space`, `Signer`, `is_signer`, `can_pay`, `key`, `SystemAccount`, `key`, `Program`, `System`, `Token`, `AssociatedToken`, `Result`, `Pda`, `find_program_address`, `CpiContext`, `new`, `with_signer`, `Pubkey`, `Clock`, `get`, `Rent`, `get`, `minimum_balance`

**`atipicial-contract/src/error.rs`** (4 symbols): `ContractError`, `to_byte_string`, `code`, `Result`

**`atipicial-contract/src/lib.rs`** (19 symbols): `contract`, `crypto`, `env`, `event`, `macros`, `runtime`, `serialize`, `services`, `smart_contract`, `storage`, `types`, `native`, `context`, `account`, `error`, `atipicial_features`, `utils`, `serialization`, `prelude`

**`atipicial-contract/src/serialization.rs`** (3 symbols): `StorageSerialize`, `storage_get`, `storage_put`

**`atipicial-contract/src/smart_contract.rs`** (2 symbols): `SmartContract`, `initialize`

**`atipicial-contract/src/utils.rs`** (1 symbols): `type_name_of_val`

**`atipicial-contract/src/contract/aep.rs`** (6 symbols): `Aep24`, `Aep26`, `Aep27`, `Aep28`, `Aep30`, `OnOracleResponse`

**`atipicial-contract/src/contract/aep11.rs`** (6 symbols): `PREFIX_TOKEN_ID`, `PREFIX_TOKEN`, `PREFIX_ACCOUNT_TOKEN`, `TokenState`, `Aep11Token`, `update_aep11_balance`

**`atipicial-contract/src/contract/aep17.rs`** (5 symbols): `TOTAL_SUPPLY_KEY`, `PREFIX_BALANCE`, `Aep17Token`, `update_aep17_balance`, `update_aep17_total_supply`

**`atipicial-contract/src/contract/aep24.rs`** (15 symbols): `RoyaltyInfo`, `AEP24`, `RoyaltyPayment`, `AEP24Implementation`, `calculate_royalty`, `validate_royalty`, `store_royalty`, `get_royalty`, `store_default_royalty`, `get_default_royalty`, `process_royalty_payment`, `emit_royalty_payment`, `RoyaltyRegistry`, `register`, `query`

**`atipicial-contract/src/contract/aep26_27.rs`** (11 symbols): `AEP26Receiver`, `AEP27Receiver`, `TransferCallback`, `invoke_aep26_callback`, `invoke_aep27_callback`, `safe_nft_transfer`, `safe_token_transfer`, `ReceiverContract`, `new`, `add_accepted_token`, `add_accepted_nft`

**`atipicial-contract/src/contract/event.rs`** (4 symbols): `OnAep11Transfer`, `OnAep17Transfer`, `PostAep11Transfer`, `PostAep17Transfer`

**`atipicial-contract/src/contract/mod.rs`** (7 symbols): `native`, `aep24`, `aep26_27`, `call`, `get_call_flags`, `create_standard_account`, `create_multi_signs_account`

**`atipicial-contract/src/contract/native/atipicial.rs`** (18 symbols): `Atipicial`, `hash`, `symbol`, `decimals`, `total_supply`, `balance_of`, `transfer`, `get_gas_per_block`, `unclaimed_gas`, `register_candidate`, `unregister_candidate`, `vote`, `unvote`, `get_candidates`, `get_committee`, `get_next_block_validators`, `get_account_state`, `get_candidate_votes`

**`atipicial-contract/src/contract/native/gas.rs`** (7 symbols): `Gas`, `hash`, `symbol`, `total_supply`, `decimals`, `balance_of`, `transfer`

**`atipicial-contract/src/contract/native/legder.rs`** (6 symbols): `Ledger`, `hash`, `current_block_index`, `current_block_hash`, `block_of_index`, `block_of_hash`

**`atipicial-contract/src/contract/native/mod.rs`** (17 symbols): `gas`, `legder`, `atipicial`, `oracle`, `policy`, `ContractManagement`, `hash`, `get_min_deployment_fee`, `contract_of_hash`, `contract_of_id`, `has_method`, `deploy`, `update`, `destroy`, `RoleManagement`, `hash`, `get_designated_by_role`

**`atipicial-contract/src/contract/native/oracle.rs`** (5 symbols): `Oracle`, `MINIMUM_RESPONSE_FEE`, `hash`, `get_price`, `request`

**`atipicial-contract/src/contract/native/policy.rs`** (8 symbols): `Policy`, `hash`, `get_fee_per_byte`, `get_exec_fee_factor`, `get_storage_price`, `is_blocked`, `get_attribute_fee`, `set_attribute_fee`

**`atipicial-contract/src/crypto/hash.rs`** (3 symbols): `Sha256`, `Ripemd160`, `Keccak256`

**`atipicial-contract/src/crypto/mod.rs`** (4 symbols): `check_sign`, `check_multi_signs`, `verify_ecdsa`, `verify_ed25519`

**`atipicial-contract/src/env/mod.rs`** (1 symbols): `native`

**`atipicial-contract/src/native/atipicial.rs`** (6 symbols): `transfer`, `get_balance`, `get_name`, `get_symbol`, `get_decimals`, `get_total_supply`

**`atipicial-contract/src/native/atipicial_governance.rs`** (18 symbols): `atipicial_contract_hash`, `AtipicialGovernance`, `register_candidate`, `unregister_candidate`, `vote`, `get_candidates`, `get_committee`, `get_next_block_validators`, `get_candidate_votes`, `get_gas_per_block`, `set_gas_per_block`, `get_register_price`, `set_register_price`, `get_account_state`, `calculate_bonus`, `unclaimed_gas`, `AccountState`, `CandidateInfo`

**`atipicial-contract/src/native/contract.rs`** (4 symbols): `get_contract`, `deploy_contract`, `update_contract`, `destroy_contract`

**`atipicial-contract/src/native/contract_management.rs`** (6 symbols): `ContractManagement`, `SCRIPT_HASH`, `get_contract`, `deploy`, `update`, `destroy`

**`atipicial-contract/src/native/cryptolib.rs`** (11 symbols): `crypto_lib_hash`, `CryptoLib`, `sha256`, `ripemd160`, `keccak256`, `murmur32`, `verify_with_ecdsa`, `bls12_381_add`, `bls12_381_mul`, `bls12_381_pairing`, `EcdsaCurve`

**`atipicial-contract/src/native/gas.rs`** (6 symbols): `transfer`, `get_balance`, `get_name`, `get_symbol`, `get_decimals`, `get_total_supply`

**`atipicial-contract/src/native/mod.rs`** (8 symbols): `atipicial`, `gas`, `stdlib`, `contract`, `contract_management`, `cryptolib`, `atipicial_governance`, `stdlib_extended`

**`atipicial-contract/src/native/stdlib.rs`** (6 symbols): `base64_encode`, `base64_decode`, `json_serialize`, `json_deserialize`, `itoa`, `atoi`

**`atipicial-contract/src/native/stdlib_extended.rs`** (14 symbols): `stdlib_hash`, `StdLibExtended`, `serialize`, `deserialize`, `base58_encode`, `base58_decode`, `base58_check_encode`, `base58_check_decode`, `memory_compare`, `memory_search`, `string_split`, `string_concat`, `itoa_base`, `atoi_base`

**`atipicial-contract/src/runtime/assert.rs`** (4 symbols): `assert`, `assert_with_message`, `abort`, `abort_with_message`

**`atipicial-contract/src/runtime/mod.rs`** (22 symbols): `assert`, `get_trigger`, `get_platform`, `get_tx`, `get_executing_script_hash`, `get_calling_script_hash`, `get_entry_script_hash`, `get_time`, `get_invocation_counter`, `get_gas_left`, `get_address_version`, `get_notifications`, `get_notifications_by_hash`, `check_witness_with_account`, `check_witness_with_public_key`, `log`, `burn_gas`, `get_random`, `get_network`, `load_script`, `current_signers`, `notify`

**`atipicial-contract/src/serialize/atipicial_serializable.rs`** (2 symbols): `AtipicialSerializable`, `SerializationError`

**`atipicial-contract/src/serialize/deserialize.rs`** (8 symbols): `Deserialize`, `deserialize`, `deserialize_from_bytestring`, `deserialize_multiple`, `deserialize_vec`, `deserialize_option`, `deserialize_tuple2`, `deserialize_tuple3`

**`atipicial-contract/src/serialize/mod.rs`** (3 symbols): `deserialize`, `serialize`, `atipicial_serializable`

**`atipicial-contract/src/serialize/serialize.rs`** (8 symbols): `Serialize`, `serialize`, `serialize_to_bytestring`, `serialize_multiple`, `serialize_vec`, `serialize_option`, `serialize_tuple2`, `serialize_tuple3`

**`atipicial-contract/src/services/contract.rs`** (9 symbols): `Contract`, `call`, `get_call_flags`, `create_standard_account`, `create_multisig_account`, `call`, `get_call_flags`, `create_standard_account`, `create_multisig_account`

**`atipicial-contract/src/services/crypto.rs`** (5 symbols): `Crypto`, `check_signature`, `check_multisig`, `check_signature`, `check_multisig`

**`atipicial-contract/src/services/event.rs`** (3 symbols): `Event`, `emit`, `emit`

**`atipicial-contract/src/services/iterator.rs`** (7 symbols): `Iterator`, `next`, `value`, `key`, `next`, `value`, `key`

**`atipicial-contract/src/services/mod.rs`** (6 symbols): `contract`, `crypto`, `event`, `iterator`, `runtime`, `storage`

**`atipicial-contract/src/services/runtime.rs`** (45 symbols): `Runtime`, `get_trigger`, `get_platform`, `get_transaction`, `get_executing_script_hash`, `get_calling_script_hash`, `get_entry_script_hash`, `get_time`, `get_invocation_counter`, `get_gas_left`, `get_address_version`, `get_notifications`, `check_witness`, `check_witness_with_account`, `check_witness_with_public_key`, `get_tx`, `log`, `notify`, `burn_gas`, `get_random`, `get_network`, `load_script`, `current_signers`, `get_trigger`, `get_platform`, `get_transaction`, `get_executing_script_hash`, `get_calling_script_hash`, `get_entry_script_hash`, `get_time`, `get_invocation_counter`, `get_gas_left`, `get_address_version`, `get_notifications`, `check_witness`, `check_witness_with_account`, `check_witness_with_public_key`, `get_tx`, `log`, `notify`, `burn_gas`, `get_random`, `get_network`, `load_script`, `current_signers`

**`atipicial-contract/src/services/storage.rs`** (23 symbols): `Storage`, `get_context`, `get_read_only_context`, `as_read_only`, `get`, `get_with_bytes_key`, `put`, `put_with_bytes_key`, `delete`, `delete_with_bytes_key`, `find`, `find_with_bytes_key`, `get_context`, `get_read_only_context`, `as_read_only`, `get`, `get_with_bytes_key`, `put`, `put_with_bytes_key`, `delete`, `delete_with_bytes_key`, `find`, `find_with_bytes_key`

**`atipicial-contract/src/storage/map.rs`** (10 symbols): `StorageMap`, `StorageMap`, `new`, `get`, `put`, `delete`, `new`, `get`, `put`, `delete`

**`atipicial-contract/src/storage/mod.rs`** (10 symbols): `StorageContext`, `new`, `as_readonly`, `ReadOnlyStorageContext`, `new`, `Iter`, `new`, `from_placeholder`, `next`, `value`

**`atipicial-contract/src/types/atipicial.rs`** (15 symbols): `AtipicialCandidate`, `new`, `AtipicialAccountState`, `new`, `TxAttrType`, `to_byte`, `from_byte`, `Role`, `to_byte`, `from_byte`, `VmState`, `to_byte`, `from_byte`, `is_success`, `is_fault`

**`atipicial-contract/src/types/block.rs`** (1 symbols): `Block`

**`atipicial-contract/src/types/consts.rs`** (22 symbols): `TriggerType`, `CallFlags`, `NONE`, `READ_STATES`, `WRITE_STATES`, `ALLOW_CALL`, `ALLOW_NOTIFY`, `STATES`, `READ_ONLY`, `ALL`, `WitnessScope`, `WitnessRuleAction`, `FindOptions`, `WitnessConditionType`, `NamedCurveHash`, `VmState`, `from_u8`, `to_u8`, `OracleResponseCode`, `Role`, `TxAttrType`, `ContractParamType`

**`atipicial-contract/src/types/contract.rs`** (20 symbols): `ContractHash`, `Contract`, `id`, `update_counter`, `hash`, `aef`, `ContractManifest`, `ContractGroup`, `ContractPermission`, `ContractAbi`, `ContractMethodDescriptor`, `ContractEventDescriptor`, `ContractParam`, `AtipicialCandidate`, `public_key`, `votes`, `AtipicialAccountState`, `balance`, `height`, `vote_to`

**`atipicial-contract/src/types/key.rs`** (4 symbols): `PublicKey`, `is_valid`, `from_bytes`, `to_bytes`

**`atipicial-contract/src/types/mod.rs`** (3 symbols): `builtin`, `storage`, `placeholder`

**`atipicial-contract/src/types/notification.rs`** (4 symbols): `Notification`, `sender`, `script_hash`, `state`

**`atipicial-contract/src/types/placeholder.rs`** (5 symbols): `Placeholder`, `new`, `is_null`, `FromPlaceholder`, `IntoPlaceholder`

**`atipicial-contract/src/types/signer.rs`** (11 symbols): `Signer`, `WitnessRule`, `WitnessCondition`, `AndCondition`, `OrCondition`, `NotCondition`, `BoolCondition`, `CalledByContractCondition`, `CalledByGroupCondition`, `GroupCondition`, `ScriptHashCondition`

**`atipicial-contract/src/types/storage.rs`** (15 symbols): `TypesStorageContext`, `to_storage_context`, `ReadOnlyStorageContext`, `StorageIterator`, `FindOptions`, `StorageItem`, `new`, `get`, `put`, `delete`, `StorageMap`, `new`, `get`, `put`, `delete`

**`atipicial-contract/src/types/tx.rs`** (9 symbols): `Tx`, `hash`, `version`, `nonce`, `sender`, `system_fee`, `network_fee`, `valid_until_block`, `script`

**`atipicial-contract/src/types/builtin/any.rs`** (13 symbols): `Any`, `Any`, `is`, `null`, `downcast_into`, `is_null`, `as_bytes`, `as_h160`, `as_int`, `as_bool`, `as_array`, `as_public_key`, `IntoAny`

**`atipicial-contract/src/types/builtin/array.rs`** (20 symbols): `Array`, `Array`, `new`, `from_items`, `from_vec`, `size`, `length`, `push`, `pop`, `get`, `set`, `new`, `from_items`, `from_vec`, `size`, `length`, `push`, `pop`, `get`, `set`

**`atipicial-contract/src/types/builtin/buffer.rs`** (7 symbols): `Buffer`, `Buffer`, `Bytes`, `new`, `size`, `new`, `size`

**`atipicial-contract/src/types/builtin/bytes.rs`** (8 symbols): `Bytes`, `Bytes`, `new`, `from_slice`, `len`, `is_empty`, `as_bytes`, `as_slice`

**`atipicial-contract/src/types/builtin/h160.rs`** (11 symbols): `H160`, `H160`, `SIZE`, `ZERO`, `zero`, `hex_encode`, `to_bytes`, `from_bytes`, `is_zero`, `fn`, `to_string`

**`atipicial-contract/src/types/builtin/h256.rs`** (7 symbols): `H256`, `H256`, `SIZE`, `zero`, `hex_encode`, `to_bytes`, `from_bytes`

**`atipicial-contract/src/types/builtin/int256.rs`** (51 symbols): `Int256`, `Int256`, `SIZE`, `new`, `from_u64`, `zero`, `one`, `minus_one`, `is_zero`, `is_one`, `is_positive`, `is_negative`, `checked_add`, `checked_inc`, `checked_sub`, `checked_dec`, `checked_mul`, `checked_div`, `checked_mod`, `checked_neg`, `checked_abs`, `checked_pow`, `checked_sqrt`, `checked_mulmod`, `checked_modpow`, `checked_shr`, `checked_shl`, `new`, `from_u64`, `zero`, `one`, `minus_one`, `is_zero`, `is_positive`, `is_negative`, `checked_add`, `checked_inc`, `checked_sub`, `checked_dec`, `checked_mul`, `checked_div`, `checked_mod`, `checked_neg`, `checked_abs`, `to_i32`, `checked_pow`, `checked_sqrt`, `checked_shr`, `checked_shl`, `to_bytes`, `from_bytes`

**`atipicial-contract/src/types/builtin/interop.rs`** (2 symbols): `Interop`, `Interop`

**`atipicial-contract/src/types/builtin/map.rs`** (22 symbols): `Map`, `Map`, `new`, `size`, `is_empty`, `put`, `get`, `remove`, `contains_key`, `keys`, `values`, `clear`, `new`, `size`, `is_empty`, `put`, `get`, `remove`, `contains_key`, `keys`, `values`, `clear`

**`atipicial-contract/src/types/builtin/mod.rs`** (16 symbols): `any`, `array`, `buffer`, `h160`, `h256`, `int256`, `interop`, `map`, `nullable`, `primitive`, `string`, `structs`, `bytes`, `Builtin`, `Primitive`, `Sealed`

**`atipicial-contract/src/types/builtin/nullable.rs`** (12 symbols): `Nullable`, `Nullable`, `new`, `null`, `is_null`, `unwrap_or`, `unwrap`, `new`, `null`, `is_null`, `unwrap_or`, `unwrap`

**`atipicial-contract/src/types/builtin/primitive.rs`** (1 symbols): `Primitive`

**`atipicial-contract/src/types/builtin/string.rs`** (28 symbols): `ByteString`, `ByteString`, `empty`, `from_bytes`, `to_bytes`, `as_bytes`, `from_slice`, `len`, `is_empty`, `substr`, `concat`, `hex_encode`, `from_literal`, `extend`, `new`, `empty`, `from_bytes`, `from_slice`, `to_bytes`, `len`, `is_empty`, `substr`, `concat`, `hex_encode`, `from_literal`, `extend`, `IntoByteString`, `FromByteString`

**`atipicial-contract/src/types/builtin/structs.rs`** (2 symbols): `internal_struct_get`, `internal_struct_set`

**`atipicial-contract/tests/aep_standards_comprehensive.rs`** (12 symbols): `AEP17TestHelper`, `new`, `set_balance`, `get_balance`, `set_total_supply`, `transfer`, `AEP11TestHelper`, `new`, `mint`, `owner_of`, `transfer`, `set_property`

**`atipicial-contract/tests/comprehensive_unit_tests.rs`** (12 symbols): `TestDataGenerator`, `address`, `hash256`, `public_key`, `bytestring`, `int256_array`, `StorageTestHelper`, `new`, `store`, `retrieve`, `exists`, `clear`

**`atipicial-contract/tests/contract_attributes_tests.rs`** (18 symbols): `TestAttributeContract`, `init`, `safe_method`, `unsafe_method`, `get_stored_value`, `MinimalContract`, `init`, `get_counter`, `PermissionTestContract`, `init`, `read_data`, `method1`, `method2`, `StandardsContract`, `init`, `symbol`, `decimals`, `total_supply`

**`atipicial-contract/tests/core_functionality_tests.rs`** (9 symbols): `TestContract`, `init`, `get_value`, `FeatureContract`, `new`, `SolanaStyleContract`, `init`, `initialize`, `get_owner`

**`atipicial-contract/tests/enhanced_mock_env.rs`** (89 symbols): `EnhancedMockEnvironment`, `new`, `reset`, `advance_time`, `set_gas_limit`, `add_witness`, `get_events`, `clear_events`, `MockStorage`, `StorageOperation`, `StorageOpType`, `new`, `clear`, `put`, `get`, `delete`, `find`, `create_read_only_context`, `get_transaction_log`, `get_storage_size`, `get_storage_stats`, `StorageStats`, `MockRuntime`, `MockNotification`, `MockEvent`, `new`, `reset`, `advance_time`, `set_gas_limit`, `burn_gas`, `add_witness`, `check_witness`, `emit_notification`, `log`, `get_notifications`, `get_log_entries`, `get_random`, `MockCrypto`, `new`, `reset`, `sha256`, `ripemd160`, `verify_signature`, `get_hash_cache_stats`, `MockContractManager`, `MockContractInfo`, `MockContractCall`, `new`, `clear`, `deploy_contract`, `call_contract`, `get_contract_info`, `get_call_history`, `is_contract`, `TestAssertions`, `assert_storage_equals`, `assert_event_emitted`, `assert_gas_consumed`, `assert_witness_checked`, `assert_log_contains`, `PerformanceTester`, `new`, `benchmark_storage_operations`, `benchmark_crypto_operations`, `get_storage_stats`, `TestDataGenerators`, `generate_addresses`, `generate_public_keys`, `generate_signatures`, `generate_test_contracts`, `scenario_helpers`, `DEXTestScenario`, `new`, `setup_liquidity_pool`, `simulate_swap`, `get_pool_price`, `LendingTestScenario`, `new`, `setup_lending_pool`, `simulate_deposit`, `calculate_borrowing_power`, `from_bytes`, `to_bytes`, `StorageTestHelper`, `new`, `store`, `retrieve`, `exists`, `clear`

**`atipicial-contract/tests/integration_tests.rs`** (6 symbols): `BasicContract`, `init`, `get_name`, `get_version`, `calculate_sum`, `emit_event`

**`atipicial-contract/tests/mock_env.rs`** (38 symbols): `Notification`, `MockAtipicialEnvironment`, `new`, `with_executing_script_hash`, `with_calling_script_hash`, `with_entry_script_hash`, `executing_script_hash`, `calling_script_hash`, `entry_script_hash`, `storage_put`, `storage_get`, `storage_delete`, `storage_contains`, `add_witness`, `has_witness`, `set_timestamp`, `get_timestamp`, `set_gas_left`, `get_gas_left`, `add_notification`, `get_notifications`, `clear_notifications`, `WithMockEnv`, `runtime`, `check_witness_with_env`, `notify_with_env`, `get_timestamp_with_env`, `gas_left_with_env`, `executing_script_hash_with_env`, `calling_script_hash_with_env`, `entry_script_hash_with_env`, `storage`, `MockStorageMap`, `new`, `put`, `get`, `delete`, `contains_key`

**`atipicial-contract/tests/security_performance_tests.rs`** (8 symbols): `SecurityTestHelper`, `create_test_accounts`, `create_test_signatures`, `validate_authorization_pattern`, `PerformanceTestHelper`, `benchmark_operation`, `create_large_dataset`, `measure_memory_usage`

**`atipicial-contract/tests/solana_contracts_tests.rs`** (3 symbols): `TestContract`, `init`, `is_initialized`

**`atipicial-contract/tests/solana_style_tests.rs`** (6 symbols): `TestContract`, `init`, `get_value`, `ValidationContract`, `init`, `validate_input`

**`atipicial-contract/tests/test_utils.rs`** (40 symbols): `test_utils`, `TestDataGenerator`, `address`, `public_key`, `byte_string`, `tx_hash`, `int_array`, `test_map`, `StorageTestHelper`, `new`, `store_with_prefix`, `clear_with_prefix`, `get_all_with_prefix`, `AEP17TestHelper`, `new`, `set_balance`, `get_balance`, `transfer`, `set_total_supply`, `AEP11TestHelper`, `new`, `mint`, `owner_of`, `transfer`, `set_properties`, `DeploymentTestHelper`, `deploy_contract`, `contract_exists`, `update_contract`, `destroy_contract`, `EventAssertions`, `assert_event_emitted`, `assert_event_data`, `TransactionTestHelper`, `create_test_tx`, `create_test_signers`, `TestScenario`, `new`, `add_step`, `run`

**`atipicial-contract-proc-macros/src/contract.rs`** (11 symbols): `_initialize`, `total_supply`, `balance_of`, `transfer`, `symbol`, `decimals`, `totalSupply`, `balanceOf`, `tokensOf`, `ownerOf`, `transfer`

**`atipicial-contract-proc-macros/src/lib.rs`** (24 symbols): `contract`, `structs`, `contract_impl`, `method`, `safe`, `wasm_export`, `contract_author`, `contract_permission`, `contract_standards`, `contract_version`, `contract_meta`, `owner_only`, `require_witness`, `validate`, `gas_limit`, `program`, `accounts`, `account`, `declare_id`, `error_code`, `event`, `error_code_attr`, `init_if_needed`, `init`

**`atipicial-contract-proc-macros/src/program.rs`** (13 symbols): `expand_program`, `expand_derive_accounts`, `validate`, `expand_account`, `SIZE`, `serialize`, `deserialize`, `expand_declare_id`, `PROGRAM_ID`, `id`, `expand_error_code`, `code`, `message`

**`examples/01-hello-world/src/lib.rs`** (5 symbols): `HelloWorld`, `init`, `initialize`, `say_hello`, `set_greeting`

**`examples/01-hello-world/src/lib_solana_style.rs`** (27 symbols): `hello_world`, `initialize`, `get_greeting`, `set_greeting`, `say_hello`, `get_visitor_count`, `get_recent_visitors`, `get_info`, `reset`, `Initialize`, `GetGreeting`, `SetGreeting`, `SayHello`, `GetVisitorCount`, `GetRecentVisitors`, `GetInfo`, `Reset`, `StateAccount`, `SIZE`, `VisitorRecord`, `SIZE`, `ContractInfo`, `ErrorCode`, `ProgramInitialized`, `GreetingChanged`, `VisitorRegistered`, `ContractReset`

**`examples/01-hello-world-solana-style/src/lib.rs`** (8 symbols): `HelloWorld`, `init`, `initialize`, `get_greeting`, `set_greeting`, `say_hello`, `get_visitor_count`, `is_initialized`

**`examples/01-hello-world-solana-style-simple/src/lib.rs`** (6 symbols): `HelloWorld`, `init`, `initialize`, `get_greeting`, `set_greeting`, `transfer`

**`examples/02-simple-storage/src/lib.rs`** (7 symbols): `SimpleStorage`, `init`, `initialize`, `store_string`, `get_string`, `delete_string`, `get_total_items`

**`examples/02-simple-token/src/lib.rs`** (11 symbols): `SimpleToken`, `init`, `initialize`, `transfer`, `balance_of`, `total_supply`, `symbol`, `decimals`, `mint`, `pause`, `unpause`

**`examples/03-counter/src/lib.rs`** (7 symbols): `Counter`, `init`, `initialize`, `increment`, `decrement`, `get_count`, `reset`

**`examples/04-aep17-token/src/lib.rs`** (20 symbols): `Aep17Token`, `init`, `deploy`, `symbol`, `decimals`, `total_supply`, `balance_of`, `transfer`, `allowance`, `approve`, `transfer_from`, `mint`, `burn`, `get_owner`, `add_minter`, `remove_minter`, `pause`, `unpause`, `is_paused`, `get_max_supply`

**`examples/04-aep17-token/src/lib_solana_style.rs`** (45 symbols): `aep17_token`, `initialize`, `symbol`, `decimals`, `total_supply`, `balance_of`, `transfer`, `approve`, `allowance`, `transfer_from`, `mint`, `burn`, `freeze_account`, `thaw_account`, `pause`, `unpause`, `Initialize`, `GetMetadata`, `BalanceOf`, `Transfer`, `Approve`, `GetAllowance`, `TransferFrom`, `Mint`, `Burn`, `FreezeAccount`, `ThawAccount`, `Pause`, `Unpause`, `TokenMetadata`, `SIZE`, `TokenAccount`, `SIZE`, `AllowanceAccount`, `SIZE`, `TokenError`, `TokenInitialized`, `TokenTransfer`, `TokenApproval`, `TokenMinted`, `TokenBurned`, `AccountFrozen`, `AccountThawed`, `TokenPaused`, `TokenUnpaused`

**`examples/04-aep17-token-solana-style/src/lib.rs`** (13 symbols): `AEP17TokenSolanaStyle`, `init`, `initialize`, `symbol`, `decimals`, `total_supply`, `balance_of`, `transfer`, `allowance`, `approve`, `transfer_from`, `mint`, `burn`

**`examples/05-aep11-nft/src/lib.rs`** (13 symbols): `AEP11NFT`, `init`, `initialize`, `symbol`, `decimals`, `total_supply`, `balance_of`, `tokens_of`, `owner_of`, `mint`, `burn`, `transfer`, `properties`

**`examples/06-aep24-royalty-nft/src/lib.rs`** (15 symbols): `AEP24RoyaltyNFT`, `init`, `initialize`, `symbol`, `decimals`, `total_supply`, `balance_of`, `tokens_of`, `owner_of`, `royalty_info`, `mint`, `burn`, `transfer`, `sale_with_royalty`, `properties`

**`examples/07-crowdfunding/src/lib.rs`** (12 symbols): `Crowdfunding`, `init`, `initialize`, `get_creator`, `get_target_amount`, `get_current_amount`, `get_deadline`, `is_active`, `contribute`, `get_contribution`, `withdraw`, `refund`

**`examples/08-staking/src/lib.rs`** (13 symbols): `Staking`, `init`, `initialize`, `get_admin`, `get_reward_rate`, `get_total_staked`, `get_staked_amount`, `get_last_claim_time`, `stake`, `unstake`, `calculate_rewards`, `claim_rewards`, `update_reward_rate`

**`examples/09-simple-dex/src/lib.rs`** (14 symbols): `LiquidityPool`, `LpPosition`, `SimpleDex`, `init`, `initialize`, `create_pool`, `swap`, `add_liquidity`, `remove_liquidity`, `get_pool`, `get_swap_quote`, `is_paused`, `get_owner`, `get_pool_count`

**`examples/10-multisig-wallet/src/lib.rs`** (16 symbols): `ProposalStatus`, `TransactionProposal`, `MultisigWallet`, `init`, `initialize`, `propose_transaction`, `confirm_transaction`, `revoke_confirmation`, `cancel_proposal`, `add_owner`, `get_proposal`, `is_owner`, `get_owners`, `get_required_confirmations`, `get_owner_count`, `get_proposal_count`

**`examples/11-governance/src/lib.rs`** (14 symbols): `ProposalStatus`, `VoteChoice`, `Proposal`, `Vote`, `Governance`, `init`, `initialize`, `propose`, `vote`, `queue_proposal`, `execute_proposal`, `get_proposal`, `get_voting_power`, `get_proposal_count`

**`examples/12-oracle-price-feed/src/lib.rs`** (15 symbols): `PriceData`, `OracleRequest`, `OraclePriceFeed`, `init`, `initialize`, `request_price_data`, `oracle_callback`, `get_price`, `subscribe`, `set_emergency_price`, `activate_circuit_breaker`, `deactivate_circuit_breaker`, `is_circuit_breaker_active`, `get_owner`, `get_request_count`

**`examples/13-nft-marketplace/src/auctions.rs`** (6 symbols): `create_auction`, `place_bid`, `end_auction`, `cancel_auction`, `get_auction`, `get_bid`

**`examples/13-nft-marketplace/src/lib.rs`** (9 symbols): `NftMarketplace`, `init`, `initialize`, `get_owner`, `get_platform_fee_rate`, `is_paused`, `pause`, `unpause`, `get_marketplace_stats`

**`examples/13-nft-marketplace/src/listings.rs`** (7 symbols): `create_listing`, `purchase_listing`, `cancel_listing`, `get_listing`, `get_seller_listings`, `calculate_fees`, `record_sale`

**`examples/13-nft-marketplace/src/offers.rs`** (4 symbols): `make_offer`, `accept_offer`, `withdraw_offer`, `get_offer`

**`examples/13-nft-marketplace/src/royalties.rs`** (5 symbols): `RoyaltyPayment`, `calculate_royalties`, `distribute_royalties`, `cache_royalty_info`, `get_cached_royalties`

**`examples/13-nft-marketplace/src/storage.rs`** (30 symbols): `StorageKeys`, `new`, `listing_key`, `auction_key`, `offer_key`, `bid_key`, `seller_listings_key`, `nft_listings_key`, `user_offers_key`, `nft_offers_key`, `user_token_offers_key`, `nft_royalty_key`, `escrow_key`, `operator_key`, `authorized_operator_key`, `StorageUtils`, `store_id_list`, `load_id_list`, `add_to_id_list`, `remove_from_id_list`, `store_escrow_balance`, `load_escrow_balance`, `increment_counter`, `get_counter`, `store_u32_config`, `load_u32_config`, `store_u64_config`, `load_u64_config`, `key_exists`, `delete_key`

**`examples/13-nft-marketplace/src/types.rs`** (42 symbols): `ListingStatus`, `from_u8`, `to_u8`, `AuctionStatus`, `from_u8`, `to_u8`, `OfferStatus`, `from_u8`, `to_u8`, `Listing`, `Auction`, `Bid`, `Offer`, `RoyaltyRecipient`, `Sale`, `SaleType`, `from_u8`, `to_u8`, `FeeCalculation`, `MarketplaceConfig`, `default`, `ListingEvent`, `AuctionEvent`, `BidEvent`, `SaleEvent`, `OfferEvent`, `is_active`, `is_expired`, `can_be_purchased`, `is_active`, `is_ended`, `can_receive_bids`, `has_reserve_met`, `calculate_min_bid`, `is_active`, `is_expired`, `can_be_accepted`, `bytes_to_listing_status`, `bytes_to_auction_status`, `bytes_to_offer_status`, `bytes_to_u64`, `bytes_to_u32`

**`examples/14-atipicial-features-showcase/src/lib.rs`** (7 symbols): `AtipicialFeaturesShowcase`, `init`, `initialize`, `get_owner`, `demonstrate_storage`, `get_time`, `get_script_hash`

**`examples/15-atipicial-complete-features/src/lib.rs`** (7 symbols): `AtipicialCompleteFeatures`, `init`, `initialize`, `get_owner`, `is_initialized`, `demonstrate_storage`, `get_stored_value`

**`examples/15-atipicial-complete-features/src/lib_fixed.rs`** (5 symbols): `AtipicialCompleteFeatures`, `new`, `initialize`, `get_owner`, `is_initialized`

**`examples/defi/real-aave-flash/src/lib.rs`** (10 symbols): `get`, `put`, `delete`, `check_witness`, `notify`, `get_caller`, `get_block`, `get_time`, `call_contract`, `call_contract_with_result`

**`examples/defi/real-aep17-token/src/lib.rs`** (7 symbols): `get`, `put`, `delete`, `check_witness`, `notify`, `get_caller`, `get_time`

**`examples/defi/real-compound-lending/src/lib.rs`** (8 symbols): `get`, `put`, `delete`, `check_witness`, `notify`, `get_caller`, `get_block`, `call_contract`

**`examples/defi/real-uniswap-amm/src/lib.rs`** (7 symbols): `get`, `put`, `delete`, `check_witness`, `notify`, `get_caller`, `call_contract`

**`tests/mock_env.rs`** (44 symbols): `Syscall`, `record_syscall`, `get_syscalls`, `reset_syscalls`, `setup`, `verify_syscall_hashes`, `Notification`, `MockAtipicialEnvironment`, `new`, `with_executing_script_hash`, `with_calling_script_hash`, `with_entry_script_hash`, `executing_script_hash`, `calling_script_hash`, `entry_script_hash`, `storage_put`, `storage_get`, `storage_delete`, `storage_contains`, `add_witness`, `has_witness`, `set_timestamp`, `get_timestamp`, `set_gas_left`, `get_gas_left`, `add_notification`, `get_notifications`, `clear_notifications`, `WithMockEnv`, `runtime`, `check_witness_with_env`, `notify_with_env`, `get_timestamp_with_env`, `gas_left_with_env`, `executing_script_hash_with_env`, `calling_script_hash_with_env`, `entry_script_hash_with_env`, `storage`, `MockStorageMap`, `new`, `put`, `get`, `delete`, `contains_key`


---

## 🔢 Protocol Constants — The Numbers That Govern

**74 public constants define this project's behavior.**

| Constant | Value | Defined in |
|---|---|---|
| `MAGIC` | `0x3346454E` | `atipicial-compiler/src/aef.rs` |
| `NONE` | `0x00` | `atipicial-compiler/src/aef.rs` |
| `ALLOW_CALL` | `0x01` | `atipicial-compiler/src/aef.rs` |
| `ALLOW_NOTIFY` | `0x02` | `atipicial-compiler/src/aef.rs` |
| `ALLOW_STATES` | `0x04` | `atipicial-compiler/src/aef.rs` |
| `ALLOW_MODIFY_STATES` | `0x08` | `atipicial-compiler/src/aef.rs` |
| `ALL` | `0x0F` | `atipicial-compiler/src/aef.rs` |
| `SYSTEM_CONTRACT_CALL` | `0x627D5B52` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CONTRACT_CALL_NATIVE` | `0x338312F3` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CONTRACT_CREATE_STANDARD_ACCOUNT` | `0x40A92E8B` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CONTRACT_CREATE_MULTISIG_ACCOUNT` | `0xDACE1648` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CONTRACT_GET_CALL_FLAGS` | `0xB7C7FACC` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_PLATFORM` | `0xFDEA5D4E` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_TRIGGER` | `0xD642A42E` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_TIME` | `0xF157E7EA` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_SCRIPT_CONTAINER` | `0x2D728D86` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_EXECUTING_SCRIPT_HASH` | `0x632B6E29` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_CALLING_SCRIPT_HASH` | `0x528D0D00` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_ENTRY_SCRIPT_HASH` | `0x0BEEBEB4` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_CHECK_WITNESS` | `0x3307B520` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_INVOCATION_COUNTER` | `0x2F729FF8` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_GAS_LEFT` | `0x3A3B9A31` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_NOTIFICATIONS` | `0x8166107A` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_NETWORK` | `0x476DC615` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_RANDOM` | `0x8D8B9E42` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_LOG` | `0x8F61E6CE` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_NOTIFY` | `0x9BF667CE` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_GET_TX` | `0x369426FF` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_RUNTIME_BURN_GAS` | `0xCF561045` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_STORAGE_GET_CONTEXT` | `0x9BF667CE` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_STORAGE_GET_READ_ONLY_CONTEXT` | `0x161B7804` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_STORAGE_AS_READ_ONLY` | `0xD4FB8203` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_STORAGE_GET` | `0x925DE831` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_STORAGE_FIND` | `0xC0695219` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_STORAGE_PUT` | `0xE63F1884` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_STORAGE_DELETE` | `0x6D625B09` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CRYPTO_CHECK_SIG` | `0x41166107` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CRYPTO_CHECK_MULTISIG` | `0xD8258E93` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CRYPTO_SHA256` | `0x0FAAC4E6` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CRYPTO_RIPEMD160` | `0x7A806A87` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CRYPTO_VERIFY_WITH_ECDSA` | `0x95440D7E` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_CRYPTO_MURMUR32` | `0x24C5C88A` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_ITERATOR_CREATE` | `0xD3CE96E7` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_ITERATOR_NEXT` | `0x932BF322` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_ITERATOR_VALUE` | `0x61B7C1E5` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_JSON_SERIALIZE` | `0x7D12289B` | `atipicial-compiler/src/opcodes.rs` |
| `SYSTEM_JSON_DESERIALIZE` | `0x8B2E8A15` | `atipicial-compiler/src/opcodes.rs` |
| `LEN` | `8 + 32` | `atipicial-compiler/tests/compilation_pipeline_comprehensive.rs` |
| `PREFIX_TOKEN_ID` | `0x02` | `atipicial-contract/src/contract/aep11.rs` |
| `PREFIX_TOKEN` | `0x03` | `atipicial-contract/src/contract/aep11.rs` |
| `PREFIX_ACCOUNT_TOKEN` | `0x04` | `atipicial-contract/src/contract/aep11.rs` |
| `TOTAL_SUPPLY_KEY` | `0x00` | `atipicial-contract/src/contract/aep17.rs` |
| `PREFIX_BALANCE` | `0x01` | `atipicial-contract/src/contract/aep17.rs` |
| `MINIMUM_RESPONSE_FEE` | `10_000_000` | `atipicial-contract/src/contract/native/oracle.rs` |
| `SCRIPT_HASH` | `H160::from_array([0x72, 0x6b, 0x4a, 0x1a, 0x13, 0x5a, 0x7a, ` | `atipicial-contract/src/native/contract_management.rs` |
| `NONE` | `CallFlags::None` | `atipicial-contract/src/types/consts.rs` |
| `READ_STATES` | `CallFlags::ReadStates` | `atipicial-contract/src/types/consts.rs` |
| `WRITE_STATES` | `CallFlags::WriteStates` | `atipicial-contract/src/types/consts.rs` |
| `ALLOW_CALL` | `CallFlags::AllowCall` | `atipicial-contract/src/types/consts.rs` |
| `ALLOW_NOTIFY` | `CallFlags::AllowNotify` | `atipicial-contract/src/types/consts.rs` |
| `STATES` | `CallFlags::States` | `atipicial-contract/src/types/consts.rs` |
| `READ_ONLY` | `CallFlags::ReadOnly` | `atipicial-contract/src/types/consts.rs` |
| `ALL` | `CallFlags::All` | `atipicial-contract/src/types/consts.rs` |
| `SIZE` | `20` | `atipicial-contract/src/types/builtin/h160.rs` |
| `ZERO` | `H160([0u8` | `atipicial-contract/src/types/builtin/h160.rs` |
| `SIZE` | `32` | `atipicial-contract/src/types/builtin/h256.rs` |
| `SIZE` | `32` | `atipicial-contract/src/types/builtin/int256.rs` |
| `SIZE` | `512` | `atipicial-contract-proc-macros/src/program.rs` |
| `PROGRAM_ID` | `#id_value` | `atipicial-contract-proc-macros/src/program.rs` |
| `SIZE` | `32 + // authority
        4 + 100 + // greeting string
     ` | `examples/01-hello-world/src/lib_solana_style.rs` |
| `SIZE` | `4 + 50 + // name
        32 + // address
        8 + // time` | `examples/01-hello-world/src/lib_solana_style.rs` |
| `SIZE` | `4 + 100 + // name
        4 + 10 + // symbol
        1 + // ` | `examples/04-aep17-token/src/lib_solana_style.rs` |
| `SIZE` | `32 + 16 + 1` | `examples/04-aep17-token/src/lib_solana_style.rs` |
| `SIZE` | `32 + 32 + 16` | `examples/04-aep17-token/src/lib_solana_style.rs` |

---

## 🧪 Test Inventory — Proof, Not Promises

**693 test functions across 51 files.**

**`atipicial-compiler/src/aef.rs`**: `test_aef_creation`, `test_aef_serialization`, `test_method_token`, `test_string_truncation`

**`atipicial-compiler/src/debug.rs`**: `test_debugger_creation`, `test_disassemble`, `test_breakpoints`, `test_stepping`, `test_syscall_disassembly`

**`atipicial-compiler/src/lib.rs`**: `test_compiler_creation`, `test_wasm_parsing`

**`atipicial-compiler/src/manifest.rs`**: `test_default_manifest`, `test_solana_style_manifest`, `test_aep17_standard`, `test_manifest_serialization`, `test_manifest_file_io`

**`atipicial-compiler/src/memory_model.rs`**: `test_memory_model_initialization`, `test_memory_load_operation`, `test_memory_store_operation`, `test_find_memory_region`, `test_memory_stats`, `test_out_of_bounds_access`

**`atipicial-compiler/src/opcodes.rs`**: `test_opcode_conversion`, `test_opcode_properties`, `test_opcode_sizes`

**`atipicial-compiler/src/optimizer.rs`**: `test_optimizer_creation`, `test_constant_folding`, `test_peephole_optimization`, `test_instruction_combining`, `test_full_optimization`, `test_extract_small_constants`, `test_compute_arithmetic`

**`atipicial-compiler/src/solana_detector.rs`**: `test_read_only_detection`, `test_solana_handler_detection`, `test_context_param_detection`, `it ::`

**`atipicial-compiler/src/translator.rs`**: `test_opcode_emission`, `test_push_string`, `test_push_int`, `test_label_resolution`

**`atipicial-compiler/src/wasm_parser.rs`**: `test_instruction_mapping`, `test_push_constants`, `test_local_operations`

**`atipicial-compiler/tests/compilation_pipeline_comprehensive.rs`**: `test_basic_wasm_compilation`, `test_contract_with_storage_compilation`, `test_complex_contract_compilation`, `test_solana_style_contract_compilation`, `test_compilation_error_handling`, `test_dependency_resolution`, `test_optimization_levels`, `test_basic_aef_generation`, `test_aef_metadata_inclusion`, `test_aef_optimization`, `test_aef_validation`, `test_aef_version_compatibility`, `test_aef_compression`, `test_basic_manifest_generation`, `test_manifest_with_permissions`, `test_manifest_with_metadata`, `test_manifest_method_signatures`, `test_manifest_validation`, `test_manifest_standards_support`, `test_basic_method_detection`, `test_account_structure_detection`, `test_error_enum_detection`, `test_complex_solana_pattern_detection`, `test_constraint_detection`, `test_complete_compilation_pipeline`, `test_solana_style_complete_pipeline`, `test_pipeline_error_recovery`

**`atipicial-compiler/tests/comprehensive_compiler_tests.rs`**: `test_wasm_module_parsing`, `test_invalid_wasm_handling`, `test_empty_wasm_file`, `test_aef_structure_validation`, `test_aef_checksum_calculation`, `test_aef_serialization`, `test_aef_file_validation`, `test_manifest_creation`, `test_manifest_method_detection`, `test_aep_standard_detection`, `test_manifest_serialization`, `test_end_to_end_compilation`, `test_compilation_with_debug`, `test_compilation_error_handling`, `test_aef_checksum_verification`, `test_aef_script_validation`, `test_aef_metadata_validation`, `test_opcode_optimization`, `test_jump_optimization`, `test_constant_folding`, `test_compilation_error_types`, `test_output_directory_creation`, `test_cli_argument_parsing`, `test_debug_output_format`, `test_large_script_compilation`, `test_compilation_speed`, `test_framework_integration`, `test_scenario_framework`

**`atipicial-compiler/tests/e2e_tests.rs`**: `test_compile_all_examples`, `test_aef_size_limits`

**`atipicial-compiler/tests/instruction_translation_tests.rs`**: `test_arithmetic_instructions`, `test_comparison_instructions`, `test_control_flow_instructions`, `test_loop_instructions`, `test_local_variable_operations`, `test_complex_expressions`, `test_function_calls`, `test_memory_operations`, `test_enhanced_vs_legacy_translation`, `test_compilation_performance`, `test_invalid_wasm_handling`

**`atipicial-compiler/tests/integration_comprehensive.rs`**: `test_hello_world_compilation_pipeline`, `test_aep17_token_compilation_pipeline`, `test_complex_defi_compilation`, `test_batch_compilation`, `test_mainnet_deployment_simulation`, `test_testnet_deployment_simulation`, `test_verify_command_integration`, `test_compile_all_command_simulation`

**`atipicial-compiler/tests/integration_tests.rs`**: `test_compile_simple_wasm`, `test_solana_style_detection`, `test_aep17_standard_detection`, `test_manifest_generation`, `test_aef_serialization_deserialization`, `test_compile_with_custom_manifest`, `test_compiler_debug_mode`, `test_empty_wasm_module`, `test_multiple_exports`

**`atipicial-contract/src/serialize/deserialize.rs`**: `test_deserialize_u32`, `test_deserialize_bool`, `test_deserialize_bytestring`, `test_round_trip_serialization`

**`atipicial-contract/src/serialize/serialize.rs`**: `test_serialize_u32`, `test_serialize_bool`, `test_serialize_bytestring`, `test_serialize_option`, `test_serialize_vec`

**`atipicial-contract/tests/advanced_types_tests.rs`**: `test_h256_operations`, `test_int256_edge_cases`, `test_int256_serialization_round_trip`, `test_byte_string_advanced_operations`, `test_array_comprehensive`, `test_map_operations`, `test_public_key_operations`, `test_h160_comprehensive`, `test_type_conversions`, `test_serialization_consistency`

**`atipicial-contract/tests/aep_standards_comprehensive.rs`**: `test_aep17_interface_compliance`, `test_aep17_transfer_validation`, `test_aep17_event_emission`, `test_aep11_interface_compliance`, `test_aep11_properties`, `test_aep11_transfer_mechanics`, `test_aep24_royalty_calculation`, `test_aep24_royalty_info_storage`, `test_aep24_royalty_distribution`, `test_aep24_edge_cases`, `test_aep26_callback_invocation`, `test_aep27_callback_invocation`, `test_callback_contract_detection`, `test_callback_error_handling`, `test_aep17_method_signatures`, `test_aep11_method_signatures`, `test_callback_interface_signatures`, `test_aep17_with_aep27_integration`, `test_aep11_with_aep24_integration`, `test_multi_standard_contract`, `test_aep17_helper`, `test_aep11_helper`

**`atipicial-contract/tests/aep_standards_test.rs`**: `test_aep17_token_operations`, `test_aep11_nft_operations`, `test_aep24_royalty_standard`, `test_aep24_royalty_payment_processing`, `test_aep24_royalty_registry`, `test_aep26_nft_callback`, `test_aep27_token_callback`, `test_safe_nft_transfer`, `test_safe_token_transfer`, `test_receiver_contract`, `test_aep_standard_macros`

**`atipicial-contract/tests/annotation_tests.rs`**: `test_u32_serialization`, `test_u64_serialization`, `test_bool_serialization`, `test_bytestring_serialization`, `test_h160_size`, `test_h160_zero`, `test_h160_equality`, `test_bytestring_empty`, `test_bytestring_content`, `test_bytestring_concat`, `test_int256_zero`, `test_int256_new`, `test_int256_equality`, `test_storage_key_creation`, `test_array_creation`, `test_map_creation`, `test_bytes_from_slice`, `test_bytes_content`, `test_bytes_empty`, `test_storage_context_creation`, `test_trigger_type_values`, `test_call_flags_values`, `test_vm_state_values`, `test_contract_structure`, `test_aep17_token_structure`, `test_aep11_nft_structure`, `test_multisig_wallet_structure`, `test_framework_components`

**`atipicial-contract/tests/comprehensive_unit_tests.rs`**: `test_h160_comprehensive`, `test_h256_comprehensive`, `test_int256_arithmetic_comprehensive`, `test_bytestring_operations`, `test_array_operations_comprehensive`, `test_map_operations_comprehensive`, `test_any_type_conversions`, `test_storage_context_isolation`, `test_storage_map_comprehensive`, `test_storage_item_lifecycle`, `test_storage_find_operations_comprehensive`, `test_runtime_information_comprehensive`, `test_runtime_witness_checking_comprehensive`, `test_runtime_transaction_operations`, `test_runtime_notifications_and_logging`, `test_runtime_utility_operations`, `test_hash_functions_comprehensive`, `test_signature_verification_comprehensive`, `test_public_key_operations`, `test_int256_serialization`, `test_h160_serialization`, `test_bool_serialization`, `test_u32_serialization`, `test_storage_helpers`, `test_large_array_operations`, `test_memory_efficiency`, `test_string_operations_performance`, `test_authorization_patterns`, `test_input_validation`, `test_overflow_protection`, `test_memory_bounds_checking`, `test_contract_deployment_simulation`, `test_contract_upgrade_simulation`, `test_token_transfer_workflow`, `test_nft_minting_workflow`, `test_oracle_request_workflow`, `test_data_generator`, `test_storage_helper`

**`atipicial-contract/tests/contract_attributes_tests.rs`**: `test_contract_instantiation`, `test_safe_methods`, `test_unsafe_methods`, `test_permission_methods`, `test_standards_compliance`, `test_contract_metadata`, `test_method_attributes`, `test_complex_contract_structure`

**`atipicial-contract/tests/core_functionality_tests.rs`**: `test_h160_operations`, `test_int256_operations`, `test_bytestring_operations`, `test_array_operations`, `test_storage_context`, `test_runtime_functions`, `test_serialization_roundtrip`, `test_contract_impl_macro`, `test_aep17_patterns`, `test_type_conversions`, `test_error_handling`, `test_contract_features`, `test_solana_style_patterns`, `test_placeholder_behavior`, `test_native_contract_patterns`

**`atipicial-contract/tests/core_types_comprehensive.rs`**: `test_h160_creation_methods`, `test_h160_hex_operations`, `test_h160_comparison_operations`, `test_h160_conversion_to_bytestring`, `test_h160_edge_cases`, `test_h160_serialization_roundtrip`, `test_h256_creation_and_basic_ops`, `test_h256_hex_operations`, `test_h256_comparison_and_equality`, `test_h256_edge_cases`, `test_int256_creation_methods`, `test_int256_basic_arithmetic`, `test_int256_overflow_protection`, `test_int256_division_edge_cases`, `test_int256_comparison_operations`, `test_int256_bitwise_operations`, `test_int256_string_conversion`, `test_int256_power_operations`, `test_bytestring_creation_methods`, `test_bytestring_concatenation`, `test_bytestring_slicing_and_indexing`, `test_bytestring_unicode_handling`, `test_bytestring_conversion_operations`, `test_bytestring_comparison`, `test_bytestring_edge_cases`, `test_array_basic_operations`, `test_array_modification_operations`, `test_array_with_different_types`, `test_array_insertion_and_removal`, `test_array_iteration`, `test_array_capacity_and_performance`, `test_array_clear_and_reset`, `test_array_nested_structures`, `test_map_basic_operations`, `test_map_overwrite_and_update`, `test_map_removal_operations`, `test_map_different_key_value_types`, `test_map_iteration_and_keys`, `test_map_clear_operations`, `test_map_complex_keys`, `test_map_performance_with_many_entries`, `test_any_type_conversions`, `test_any_type_checking`, `test_any_null_and_empty_handling`, `test_any_in_collections`, `test_h160_bytestring_conversion`, `test_int256_bytestring_conversion`, `test_array_map_interoperability`, `test_complex_nested_structures`

**`atipicial-contract/tests/end_to_end_comprehensive.rs`**: `test_complete_dex_workflow`, `test_complete_lending_workflow`, `test_flash_loan_workflow`, `test_multi_contract_deployment_simulation`, `test_cross_contract_calls`, `test_event_driven_workflow`, `test_price_oracle_workflow`, `test_oracle_error_handling`, `test_oracle_data_validation`, `test_complete_governance_workflow`, `test_nft_marketplace_scenario`, `test_staking_rewards_scenario`, `test_multi_signature_wallet_scenario`, `test_complete_contract_lifecycle`, `test_interoperability_scenario`, `test_emergency_procedures_scenario`

**`atipicial-contract/tests/end_to_end_test.rs`**: `test_complete_aep17_workflow`, `test_complete_aep11_workflow`, `test_oracle_integration`, `test_governance_workflow`, `test_multisig_workflow`, `test_storage_iteration`, `test_contract_upgrade`, `test_aep24_royalty_workflow`, `test_transfer_callbacks`, `test_defi_scenario`

**`atipicial-contract/tests/enhanced_mock_env.rs`**: `test_enhanced_mock_environment`, `test_performance_tester`, `test_scenario_helpers`

**`atipicial-contract/tests/error_handling_comprehensive.rs`**: `test_type_conversion_errors`, `test_h160_invalid_input_handling`, `test_h256_invalid_input_handling`, `test_bytestring_edge_cases`, `test_array_boundary_conditions`, `test_map_edge_cases`, `test_any_type_edge_cases`, `test_storage_permission_violations`, `test_storage_key_edge_cases`, `test_storage_value_edge_cases`, `test_storage_find_edge_cases`, `test_storage_iterator_edge_cases`, `test_storage_map_error_handling`, `test_storage_item_error_handling`, `test_witness_checking_edge_cases`, `test_gas_operations_edge_cases`, `test_notification_edge_cases`, `test_logging_edge_cases`, `test_random_number_edge_cases`, `test_script_hash_consistency`, `test_transaction_data_edge_cases`, `test_platform_info_consistency`, `test_hash_function_edge_cases`, `test_signature_verification_edge_cases`, `test_public_key_edge_cases`, `test_multi_signature_edge_cases`, `test_contract_call_edge_cases`, `test_call_flags_edge_cases`, `test_account_creation_edge_cases`, `test_contract_update_edge_cases`, `test_contract_destroy_edge_cases`, `test_serialization_edge_cases`, `test_storage_helpers_edge_cases`, `test_serialization_round_trip_edge_cases`

**`atipicial-contract/tests/example_contracts_comprehensive.rs`**: `test_hello_world_basic`, `test_hello_world_solana_style_simple`, `test_hello_world_solana_style_complex`, `test_simple_token`, `test_simple_storage`, `test_counter_contract`, `test_aep17_basic_functionality`, `test_aep17_transfer`, `test_aep17_solana_style`, `test_aep17_edge_cases`, `test_aep11_basic_functionality`, `test_aep11_minting`, `test_aep11_transfer`, `test_aep11_approval`, `test_aep24_basic_royalty`, `test_aep24_royalty_transfer`, `test_aep24_royalty_registry`, `test_aep26_receiver`, `test_aep27_receiver`, `test_crowdfunding_contract`, `test_staking_contract`, `test_simple_dex`, `test_multisig_wallet`, `test_governance_contract`, `test_oracle_price_feed`, `test_nft_marketplace`, `test_uniswap_v2_amm`, `test_compound_lending`, `test_aave_flashloan`, `test_defi_integration_workflow`

**`atipicial-contract/tests/integration_tests.rs`**: `test_basic_contract_integration`, `test_type_system_integration`, `test_runtime_services_integration`, `test_crypto_integration`

**`atipicial-contract/tests/native_contracts_test.rs`**: `test_atipicial_contract_operations`, `test_gas_contract_operations`, `test_atipicial_governance_operations`, `test_cryptolib_operations`, `test_stdlib_extended_operations`, `test_oracle_operations`, `test_policy_contract`, `test_contract_management`, `test_role_management`, `test_bls12_381_operations`

**`atipicial-contract/tests/runtime_services_comprehensive.rs`**: `test_runtime_platform_information`, `test_runtime_time_and_gas`, `test_runtime_script_hash_operations`, `test_runtime_witness_checking`, `test_runtime_invocation_counter`, `test_runtime_random_generation`, `test_runtime_transaction_operations`, `test_runtime_notification_system`, `test_runtime_logging`, `test_runtime_signers`, `test_runtime_load_script`, `test_runtime_abort_operations`, `test_runtime_edge_cases`, `test_contract_call_operations`, `test_contract_call_flags`, `test_contract_creation_operations`, `test_contract_update_operations`, `test_contract_destroy_operations`, `test_contract_get_call_flags`, `test_contract_complex_call_scenarios`, `test_hash_function_comprehensive`, `test_hash_function_consistency`, `test_hash_edge_cases`, `test_signature_verification_comprehensive`, `test_signature_verification_edge_cases`, `test_multi_signature_verification`, `test_public_key_operations`, `test_crypto_performance_patterns`, `test_event_creation_and_emission`, `test_event_data_types`, `test_event_empty_and_null_handling`, `test_event_large_data`, `test_standard_contract_events`, `test_custom_application_events`, `test_iterator_basic_operations`, `test_iterator_with_different_options`, `test_iterator_edge_cases`, `test_iterator_concurrent_access`, `test_cross_service_workflows`, `test_contract_interaction_workflow`, `test_error_handling_across_services`, `test_service_performance_under_load`

**`atipicial-contract/tests/security_hardening_tests.rs`**: `test_safe_balance_retrieval`, `test_safe_total_supply`, `test_int256_arithmetic_safety`, `test_int256_division_safety`, `test_serialization_safety`, `test_error_handling_macros`, `test_data_size_validation`, `test_bytestring_validation`, `test_storage_safety`, `test_security_error_types`, `test_nullable_safety`, `test_safe_token_integration`, `test_security_performance`, `test_edge_cases`, `test_memory_safety`

**`atipicial-contract/tests/security_performance_tests.rs`**: `test_input_validation_security`, `test_authorization_security`, `test_memory_safety_bounds`, `test_cryptographic_security`, `test_storage_isolation_security`, `test_gas_consumption_limits`, `test_reentrancy_protection_pattern`, `test_hash_function_performance`, `test_signature_verification_performance`, `test_storage_operation_performance`, `test_array_operation_performance`, `test_string_operation_performance`, `test_type_conversion_performance`, `test_memory_allocation_patterns`, `test_resource_cleanup`, `test_stack_usage_safety`, `test_hash_collision_resistance`, `test_hash_determinism`, `test_signature_malleability_protection`, `test_public_key_validation`, `test_storage_key_efficiency`, `test_batch_operation_efficiency`, `test_arithmetic_operation_efficiency`, `test_memory_allocation_efficiency`, `test_maximum_array_size`, `test_maximum_string_length`, `test_deep_nested_structures`, `test_concurrent_storage_operations`, `test_security_helper`, `test_performance_helper`, `test_secure_token_transfer_workflow`, `test_performance_optimized_storage`, `test_security_performance_tradeoffs`

**`atipicial-contract/tests/serialization_tests.rs`**: `test_byte_string_serialization`, `test_int256_serialization`, `test_h160_serialization`, `test_empty_values_serialization`, `test_binary_data_serialization`

**`atipicial-contract/tests/services_tests.rs`**: `test_storage_service`, `test_runtime_service`, `test_crypto_service`, `test_contract_service`, `test_native_contracts`

**`atipicial-contract/tests/solana_contracts_tests.rs`**: `test_contract_initialization`, `test_greeting_validation`, `test_visitor_name_validation`, `test_visitor_count_increment`, `test_recent_visitors_limit`, `test_token_initialization`, `test_transfer_validation`, `test_balance_arithmetic`, `test_allowance_management`, `test_mint_supply_update`, `test_burn_supply_update`, `test_freeze_thaw_operations`, `test_pause_unpause_operations`, `test_account_constraints`, `test_has_one_constraint`, `test_signer_validation`, `test_account_space_calculation`, `test_error_codes`, `test_require_macros`, `test_full_token_flow`, `run_all_solana_style_tests`

**`atipicial-contract/tests/solana_style_tests.rs`**: `test_contract_impl_pattern`, `test_method_validation`, `test_error_macros`, `test_require_eq`, `test_require_gt`, `test_pda_generation`, `test_contract_error_codes`, `test_clock`, `test_rent`

**`atipicial-contract/tests/storage_runtime_test.rs`**: `test_storage_basic_operations`, `test_storage_complex_types`, `test_storage_find_operations`, `test_storage_context_operations`, `test_runtime_information`, `test_runtime_gas_operations`, `test_runtime_witness_checking`, `test_runtime_notifications`, `test_runtime_random`, `test_runtime_signers`, `test_runtime_transaction`, `test_iterator_operations`, `test_storage_map_operations`, `test_storage_item_operations`

**`atipicial-contract/tests/storage_system_comprehensive.rs`**: `test_storage_context_creation`, `test_storage_context_permissions`, `test_storage_basic_operations`, `test_storage_with_different_value_types`, `test_storage_overwrite_behavior`, `test_storage_find_operations`, `test_storage_find_with_different_options`, `test_storage_large_key_operations`, `test_storage_unicode_keys`, `test_storage_item_lifecycle`, `test_storage_item_with_different_types`, `test_storage_item_complex_data`, `test_storage_item_persistence`, `test_storage_item_multiple_updates`, `test_storage_item_delete_and_recreate`, `test_storage_item_with_long_keys`, `test_storage_map_basic_operations`, `test_storage_map_multiple_entries`, `test_storage_map_overwrite_values`, `test_storage_map_with_complex_keys`, `test_storage_map_with_complex_values`, `test_storage_map_prefix_isolation`, `test_storage_map_find_operations`, `test_storage_map_performance_many_entries`, `test_storage_map_unicode_handling`, `test_hierarchical_storage_keys`, `test_composite_key_patterns`, `test_versioned_storage_pattern`, `test_indexed_storage_pattern`, `test_batch_storage_operations`, `test_storage_migration_pattern`, `test_storage_cleanup_patterns`, `test_storage_memory_efficiency`, `test_storage_large_values`, `test_storage_key_collision_resistance`, `test_storage_concurrent_access_simulation`

**`atipicial-contract/tests/storage_tests.rs`**: `test_storage_map_put_get`, `test_storage_map_delete`, `test_storage_map_contains_key`, `test_storage_map_multiple_operations`, `test_storage_map_empty_key_value`, `test_storage_map_special_characters`, `test_storage_map_overwrite`

**`atipicial-contract/tests/test_utils.rs`**: `test_data_generator`, `test_storage_helper`, `test_aep17_helper`, `test_aep11_helper`, `test_scenario_runner`

**`atipicial-contract/tests/types_test.rs`**: `test_h160_creation_and_conversion`, `test_int256_arithmetic`, `test_int256_comparison`, `test_int256_edge_cases`, `test_byte_string_operations`, `test_array_operations`, `test_map_operations`, `test_public_key_operations`, `test_any_type_conversions`, `test_bytes_operations`, `test_call_flags`, `test_find_options`, `test_trigger_type`, `test_h256_operations`, `test_notification_structure`, `test_tx_structure`

**`atipicial-contract/tests/types_tests.rs`**: `test_byte_string_empty`, `test_byte_string_from_string`, `test_byte_string_from_bytes`, `test_byte_string_concat`, `test_byte_string_comparison`, `test_h160_zero`, `test_h160_from_bytes`, `test_h160_equality`, `test_int256_zero`, `test_int256_from_i32`, `test_int256_arithmetic`, `test_int256_serialization`, `test_array_creation`, `test_array_operations`, `test_array_of_byte_strings`

**`atipicial-contract/tests/wasm_aef_integration_comprehensive.rs`**: `test_basic_wasm_to_aef_conversion`, `test_complex_contract_wasm_to_aef`, `test_solana_style_wasm_to_aef`, `test_aef_optimization`, `test_aef_compression`, `test_aef_checksum_validation`, `test_aef_version_compatibility`, `test_error_handling_in_pipeline`, `test_contract_deployment_simulation`, `test_contract_update_simulation`, `test_contract_invocation_simulation`, `test_solana_style_contract_deployment`, `test_contract_storage_persistence`, `test_contract_events_emission`, `test_contract_cross_invocation`, `test_method_parameter_validation`, `test_method_return_value_handling`, `test_witness_requirement_validation`, `test_gas_consumption_tracking`, `test_storage_access_during_invocation`, `test_runtime_service_availability`, `test_storage_service_integration`, `test_crypto_service_integration`, `test_contract_service_integration`, `test_event_emission_integration`, `test_iterator_service_integration`, `test_native_contract_integration`, `test_large_contract_deployment`, `test_high_frequency_invocations`, `test_memory_intensive_operations`, `test_concurrent_contract_access`

**`examples/01-hello-world/src/lib_solana_style.rs`**: `test_visitor_record_size`, `test_state_account_size`

**`examples/04-aep17-token/src/lib_solana_style.rs`**: `test_token_metadata_size`, `test_token_account_size`, `test_allowance_account_size`

**`tests/integration.rs`**: `test_all_examples_compile`, `test_aef_generation`, `test_solana_style_syntax`, `test_deployment_infrastructure`, `test_dependencies`

**`tests/syscall_tests.rs`**: `test_syscall_runtime_log`, `test_syscall_runtime_notify`, `test_syscall_storage_operations`, `test_syscall_hash_calculation`


---

## ⚙️ Configuration & Manifest Inventory

**47 configuration files orchestrate this project.**

| File | Lines | Package | Version |
|---|---|---|---|
| `.rustfmt.toml` | 12 | - | - |
| `Cargo.toml` | 50 | - | - |
| `deny.toml` | 139 | xxhash-rust | < 0.9.87 |
| `netlify.toml` | 42 | - | - |
| `.github/workflows/build-and-deploy.yml` | 408 | - | - |
| `.github/workflows/ci-basic.yml` | 47 | - | - |
| `.github/workflows/ci-enhanced.yml` | 215 | - | - |
| `.github/workflows/ci.yml` | 133 | - | - |
| `.github/workflows/fixed-ci.yml` | 180 | - | - |
| `.github/workflows/framework-ci.yml` | 123 | - | - |
| `.github/workflows/performance-benchmark.yml` | 215 | - | - |
| `.github/workflows/production-validation.yml` | 335 | - | - |
| `.github/workflows/release-production.yml` | 353 | - | - |
| `.github/workflows/release.yml` | 154 | - | - |
| `.github/workflows/security-audit.yml` | 143 | - | - |
| `.github/workflows/test-coverage.yml` | 122 | - | - |
| `.github/workflows/working-ci.yml` | 238 | - | - |
| `atipicial-compiler/Cargo.toml` | 29 | atipicial-compiler | 1.0.0 |
| `atipicial-contract/Cargo.toml` | 19 | atipicial-contract | 1.0.0 |
| `atipicial-contract-proc-macros/Cargo.toml` | 15 | atipicial-contract-proc-macros | 1.0.0 |
| `examples/01-hello-world/Cargo.toml` | 11 | hello-world-example | 1.0.0 |
| `examples/01-hello-world-solana-style/Cargo.toml` | 15 | hello-world-solana-style | 1.0.0 |
| `examples/01-hello-world-solana-style-simple/Cargo.toml` | 12 | hello-world-solana-simple | 1.0.0 |
| `examples/02-simple-storage/Cargo.toml` | 12 | simple-storage | 1.0.0 |
| `examples/02-simple-token/Cargo.toml` | 12 | simple-token | 1.0.0 |
| `examples/03-counter/Cargo.toml` | 12 | counter | 1.0.0 |
| `examples/04-aep17-token/Cargo.toml` | 11 | aep17-token | 1.0.0 |
| `examples/04-aep17-token-solana-style/Cargo.toml` | 15 | aep17-token-solana-style | 1.0.0 |
| `examples/05-aep11-nft/Cargo.toml` | 12 | aep11-nft | 1.0.0 |
| `examples/06-aep24-royalty-nft/Cargo.toml` | 12 | aep24-royalty-nft | 1.0.0 |
| `examples/07-crowdfunding/Cargo.toml` | 12 | crowdfunding | 1.0.0 |
| `examples/08-staking/Cargo.toml` | 12 | staking | 1.0.0 |
| `examples/09-simple-dex/Cargo.toml` | 12 | simple-dex | 1.0.0 |
| `examples/10-multisig-wallet/Cargo.toml` | 12 | multisig-wallet | 1.0.0 |
| `examples/11-governance/Cargo.toml` | 12 | governance | 1.0.0 |
| `examples/12-oracle-price-feed/Cargo.toml` | 12 | oracle-price-feed | 1.0.0 |
| `examples/13-nft-marketplace/Cargo.toml` | 12 | nft-marketplace | 1.0.0 |
| `examples/14-atipicial-features-showcase/Cargo.toml` | 13 | atipicial-features-showcase | 1.0.0 |
| `examples/15-atipicial-complete-features/Cargo.toml` | 12 | atipicial-complete-features | 1.0.0 |
| `examples/defi/aave-flashloan/Cargo.toml` | 12 | aave-flashloan | 1.0.0 |
| `examples/defi/compound-lending/Cargo.toml` | 12 | compound-lending | 1.0.0 |
| `examples/defi/real-aave-flash/Cargo.toml` | 12 | real-aave-flash | 1.0.0 |
| `examples/defi/real-aep17-token/Cargo.toml` | 12 | real-aep17-token | 1.0.0 |
| `examples/defi/real-compound-lending/Cargo.toml` | 12 | real-compound-lending | 1.0.0 |
| `examples/defi/real-uniswap-amm/Cargo.toml` | 12 | real-uniswap-amm | 1.0.0 |
| `examples/defi/test-tokens/Cargo.toml` | 12 | test-tokens | 1.0.0 |
| `examples/defi/uniswap-v2-amm/Cargo.toml` | 12 | uniswap-v2-amm | 1.0.0 |

---

## 🗺️ The Symbol Atlas — Signature by Signature

Every public symbol in the codebase with its exact Rust signature.
**942 exact signatures, copy-paste-ready.**

If it exists here, it exists in code — copy-paste-ready.


#### `atipicial-compiler/src/aef.rs` — 20 symbols

```rust
pub struct Aef3
pub const MAGIC: u32 = 0x3346454E
pub fn new(compiler: String, source: String, script: Vec<u8>) -> Self
pub fn add_token(&mut self, token: MethodToken)
pub fn to_bytes(&self) -> Result<Vec<u8>>
pub fn from_bytes(bytes: &[u8]) -> Result<Self>
pub fn verify_checksum(&self) -> bool
pub fn size(&self) -> usize
pub struct MethodToken
pub fn new(hash: Vec<u8>, method: String, params_count: u16) -> Self
pub fn to_bytes(&self) -> Result<Vec<u8>>
pub fn from_bytes(bytes: &[u8]) -> Result<Self>
pub fn size(&self) -> usize
pub struct CallFlags
pub const NONE: u8 = 0x00
pub const ALLOW_CALL: u8 = 0x01
pub const ALLOW_NOTIFY: u8 = 0x02
pub const ALLOW_STATES: u8 = 0x04
pub const ALLOW_MODIFY_STATES: u8 = 0x08
pub const ALL: u8 = 0x0F
```

#### `atipicial-compiler/src/debug.rs` — 10 symbols

```rust
pub struct Debugger
pub fn new(aef: &Aef3) -> Self
pub fn add_breakpoint(&mut self, position: usize)
pub fn remove_breakpoint(&mut self, position: usize)
pub fn disassemble(&self) -> String
pub fn step(&mut self) -> Result<StepResult, String>
pub fn reset(&mut self)
pub fn current_position(&self) -> usize
pub fn set_position(&mut self, position: usize)
pub enum StepResult
```

#### `atipicial-compiler/src/lib.rs` — 15 symbols

```rust
pub struct AtipicialCompiler
pub fn new() -> Self
pub fn with_debug(mut self, debug: bool) -> Self
pub fn with_source(mut self, source: String) -> Self
pub fn with_output_dir(mut self, dir: PathBuf) -> Self
pub fn compile(&self, wasm_path: &Path) -> Result<CompilationResult>
pub fn compile_all_examples(&self) -> Result<Vec<CompilationResult>>
pub struct CompilationResult
pub struct WasmModule
pub fn get_function_names(&self) -> HashMap<u32, String>
pub struct WasmImport
pub struct WasmExport
pub struct WasmFunction
pub struct WasmDataSegment
pub struct WasmMemory
```

#### `atipicial-compiler/src/manifest.rs` — 16 symbols

```rust
pub struct Manifest
pub fn from_file(path: &Path) -> Result<Self>
pub fn to_file(&self, path: &Path) -> Result<()>
pub fn for_solana_style(program_name: &str, methods: Vec<Method>) -> Self
pub fn add_aep17_standard(&mut self)
pub fn add_aep11_standard(&mut self)
pub struct Group
pub struct Features
pub struct Abi
pub struct Method
pub fn new(name: String, safe: bool) -> Self
pub fn add_param(mut self, name: &str, type_: &str) -> Self
pub fn returns(mut self, type_: &str) -> Self
pub struct Parameter
pub struct Event
pub struct Permission
```

#### `atipicial-compiler/src/memory_model.rs` — 10 symbols

```rust
pub struct MemoryModelTranslator
pub struct MemoryRegion
pub enum MemoryAccessType
pub struct MemoryOperation
pub enum MemoryOperationType
pub fn new() -> Self
pub fn initialize(&mut self, initial_pages: u32) -> Result<Vec<u8>>
pub fn translate_memory_operation(&mut self, operation: &MemoryOperation) -> Result<Vec<u8>>
pub fn get_memory_stats(&self) -> MemoryStats
pub struct MemoryStats
```

#### `atipicial-compiler/src/opcodes.rs` — 47 symbols

```rust
pub enum OpCode
pub fn from_byte(byte: u8) -> Option<Self>
pub fn to_byte(self) -> u8
pub fn is_jump(&self) -> bool
pub fn is_call(&self) -> bool
pub fn size(&self) -> usize
pub struct SysCall
pub const SYSTEM_CONTRACT_CALL: u32 = 0x627D5B52
pub const SYSTEM_CONTRACT_CALL_NATIVE: u32 = 0x338312F3
pub const SYSTEM_CONTRACT_CREATE_STANDARD_ACCOUNT: u32 = 0x40A92E8B
pub const SYSTEM_CONTRACT_CREATE_MULTISIG_ACCOUNT: u32 = 0xDACE1648
pub const SYSTEM_CONTRACT_GET_CALL_FLAGS: u32 = 0xB7C7FACC
pub const SYSTEM_RUNTIME_PLATFORM: u32 = 0xFDEA5D4E
pub const SYSTEM_RUNTIME_GET_TRIGGER: u32 = 0xD642A42E
pub const SYSTEM_RUNTIME_GET_TIME: u32 = 0xF157E7EA
pub const SYSTEM_RUNTIME_GET_SCRIPT_CONTAINER: u32 = 0x2D728D86
pub const SYSTEM_RUNTIME_GET_EXECUTING_SCRIPT_HASH: u32 = 0x632B6E29
pub const SYSTEM_RUNTIME_GET_CALLING_SCRIPT_HASH: u32 = 0x528D0D00
pub const SYSTEM_RUNTIME_GET_ENTRY_SCRIPT_HASH: u32 = 0x0BEEBEB4
pub const SYSTEM_RUNTIME_CHECK_WITNESS: u32 = 0x3307B520
pub const SYSTEM_RUNTIME_GET_INVOCATION_COUNTER: u32 = 0x2F729FF8
pub const SYSTEM_RUNTIME_GET_GAS_LEFT: u32 = 0x3A3B9A31
pub const SYSTEM_RUNTIME_GET_NOTIFICATIONS: u32 = 0x8166107A
pub const SYSTEM_RUNTIME_GET_NETWORK: u32 = 0x476DC615
pub const SYSTEM_RUNTIME_GET_RANDOM: u32 = 0x8D8B9E42
pub const SYSTEM_RUNTIME_LOG: u32 = 0x8F61E6CE
pub const SYSTEM_RUNTIME_NOTIFY: u32 = 0x9BF667CE
pub const SYSTEM_RUNTIME_GET_TX: u32 = 0x369426FF
pub const SYSTEM_RUNTIME_BURN_GAS: u32 = 0xCF561045
pub const SYSTEM_STORAGE_GET_CONTEXT: u32 = 0x9BF667CE
pub const SYSTEM_STORAGE_GET_READ_ONLY_CONTEXT: u32 = 0x161B7804
pub const SYSTEM_STORAGE_AS_READ_ONLY: u32 = 0xD4FB8203
pub const SYSTEM_STORAGE_GET: u32 = 0x925DE831
pub const SYSTEM_STORAGE_FIND: u32 = 0xC0695219
pub const SYSTEM_STORAGE_PUT: u32 = 0xE63F1884
pub const SYSTEM_STORAGE_DELETE: u32 = 0x6D625B09
pub const SYSTEM_CRYPTO_CHECK_SIG: u32 = 0x41166107
pub const SYSTEM_CRYPTO_CHECK_MULTISIG: u32 = 0xD8258E93
pub const SYSTEM_CRYPTO_SHA256: u32 = 0x0FAAC4E6
pub const SYSTEM_CRYPTO_RIPEMD160: u32 = 0x7A806A87
pub const SYSTEM_CRYPTO_VERIFY_WITH_ECDSA: u32 = 0x95440D7E
pub const SYSTEM_CRYPTO_MURMUR32: u32 = 0x24C5C88A
pub const SYSTEM_ITERATOR_CREATE: u32 = 0xD3CE96E7
pub const SYSTEM_ITERATOR_NEXT: u32 = 0x932BF322
pub const SYSTEM_ITERATOR_VALUE: u32 = 0x61B7C1E5
pub const SYSTEM_JSON_SERIALIZE: u32 = 0x7D12289B
pub const SYSTEM_JSON_DESERIALIZE: u32 = 0x8B2E8A15
```

#### `atipicial-compiler/src/optimizer.rs` — 13 symbols

```rust
pub struct CompilerOptimizer
pub struct OptimizationStats
pub struct BasicBlock
pub struct ControlFlowGraph
pub fn new() -> Self
pub fn optimize(&mut self, bytecode: Vec<u8>) -> Result<Vec<u8>>
pub fn build_control_flow_graph(&self, bytecode: &[u8]) -> Result<ControlFlowGraph>
pub fn eliminate_dead_code(&mut self, bytecode: Vec<u8>) -> Result<Vec<u8>>
pub fn fold_constants(&mut self, bytecode: Vec<u8>) -> Result<Vec<u8>>
pub fn peephole_optimize(&mut self, bytecode: Vec<u8>) -> Result<Vec<u8>>
pub fn combine_instructions(&mut self, bytecode: Vec<u8>) -> Result<Vec<u8>>
pub fn get_stats(&self) -> &OptimizationStats
pub fn reset_stats(&mut self)
```

#### `atipicial-compiler/src/solana_detector.rs` — 8 symbols

```rust
pub struct SolanaStyleDetector<'a>
pub struct HandlerInfo
pub fn new(module: &'a WasmModule) -> Self
pub fn detect(&mut self) -> Result<bool>
pub fn is_solana_style(&self) -> bool
pub fn get_program_module(&self) -> Option<&str>
pub fn get_handlers(&self) -> &HashMap<String, HandlerInfo>
pub fn generate_manifest(&self) -> Result<Manifest>
```

#### `atipicial-compiler/src/translator.rs` — 4 symbols

```rust
pub struct WasmTranslator
pub fn new(debug: bool) -> Self
pub fn set_wasm_bytes(&mut self, wasm_bytes: Vec<u8>)
pub fn translate(&mut self, module: &WasmModule, manifest: &Manifest, source: &str) -> Result<Aef3>
```

#### `atipicial-compiler/src/wasm_parser.rs` — 7 symbols

```rust
pub struct WasmInstructionParser
pub struct ControlLabel
pub enum ControlType
pub struct InstructionMapping
pub fn new() -> Self
pub fn parse_function_body_simple(
pub fn translate_operator(&mut self, op: &Operator, atipicial_bytecode: &mut Vec<u8>) -> Result<()>
```

#### `atipicial-contract/src/account.rs` — 12 symbols

```rust
pub trait AccountSerialize
pub trait AccountDeserialize: Sized
pub trait AccountValidation
pub struct AccountLoader<'info, T>
pub fn load(&self) -> Result<T, ContractError>
pub fn load_mut(&mut self) -> Result<T, ContractError>
pub struct AccountMeta
pub fn new(pubkey: crate::types::H160, is_signer: bool) -> Self
pub fn new_readonly(pubkey: crate::types::H160, is_signer: bool) -> Self
pub trait ToAccountInfo<'info>
pub trait ToAccountMetas
pub struct EmptyAccount
```

#### `atipicial-contract/src/atipicial_features.rs` — 57 symbols

```rust
pub type Script = ByteString
pub enum OracleFilter
pub enum OracleResponseCode
pub fn request(
pub fn handle_response(
pub fn script_hash() -> H160
pub fn symbol() -> ByteString
pub fn decimals() -> u8
pub fn total_supply() -> Int256
pub fn balance_of(account: H160) -> Int256
pub fn transfer(from: H160, to: H160, amount: Int256, data: Any) -> crate::context::Result<bool>
pub fn register_candidate(pubkey: PublicKey) -> crate::context::Result<bool>
pub fn vote(account: H160, candidate: PublicKey) -> crate::context::Result<bool>
pub fn get_candidates() -> crate::context::Result<Array<PublicKey>>
pub fn get_committee() -> crate::context::Result<Array<PublicKey>>
pub fn get_next_block_validators() -> crate::context::Result<Array<PublicKey>>
pub fn get_gas_per_block() -> crate::context::Result<Int256>
pub fn script_hash() -> H160
pub fn symbol() -> ByteString
pub fn decimals() -> u8
pub fn balance_of(account: H160) -> Int256
pub fn transfer(from: H160, to: H160, amount: Int256, data: Any) -> crate::context::Result<bool>
pub fn script_hash() -> H160
pub fn get_fee_per_byte() -> crate::context::Result<Int256>
pub fn get_exec_fee_factor() -> crate::context::Result<u32>
pub fn get_storage_price() -> crate::context::Result<Int256>
pub fn is_blocked(account: H160) -> crate::context::Result<bool>
pub fn script_hash() -> H160
pub fn deploy(aef_file: Bytes, manifest: ByteString) -> crate::context::Result<Contract>
pub fn update(aef_file: Bytes, manifest: ByteString) -> crate::context::Result<()>
pub fn destroy() -> crate::context::Result<()>
pub fn get_contract(hash: H160) -> crate::context::Result<Contract>
pub fn has_method(hash: H160, method: ByteString, params: u32) -> crate::context::Result<bool>
pub fn get_minimum_deployment_fee() -> crate::context::Result<Int256>
pub fn script_hash() -> H160
pub fn sha256(data: Bytes) -> H256
pub fn ripemd160(data: Bytes) -> H160
pub fn verify_with_ecdsa(
pub fn script_hash() -> H160
pub fn serialize(item: Any) -> Bytes
pub fn deserialize(data: Bytes) -> Any
pub fn json_serialize(item: Any) -> ByteString
pub fn json_deserialize(json: ByteString) -> Any
pub fn base64_encode(data: Bytes) -> ByteString
pub fn base64_decode(text: ByteString) -> Bytes
pub fn base58_encode(data: Bytes) -> ByteString
pub fn base58_decode(text: ByteString) -> Bytes
pub fn itoa(value: Int256, base: u32) -> ByteString
pub fn atoi(text: ByteString, base: u32) -> Int256
pub enum NamedCurve
pub fn murmur32(data: Bytes, seed: u32) -> u32
pub fn bls12_381_add(x: Bytes, y: Bytes) -> Bytes
pub fn bls12_381_mul(x: Bytes, k: Bytes) -> Bytes
pub fn bls12_381_pairing(x: Bytes, y: Bytes) -> bool
pub struct Block
pub struct Transaction
pub struct Contract
```

#### `atipicial-contract/src/context.rs` — 32 symbols

```rust
pub struct Context<'info, T>
pub fn new() -> Self
pub fn with_accounts(accounts: T) -> Self
pub struct AccountInfo<'info>
pub struct Account<'info, T>
pub fn is_mutable(&self) -> bool
pub fn exists(&self) -> bool
pub fn has_one<U>(&self, _other: &U) -> bool
pub fn verify_pda(&self) -> bool
pub fn space(&self) -> usize
pub struct Signer<'info>
pub fn is_signer(&self) -> bool
pub fn can_pay(&self) -> bool
pub fn key(&self) -> H160
pub struct SystemAccount<'info>
pub fn key(&self) -> H160
pub struct Program<'info, T>
pub struct System
pub struct Token
pub struct AssociatedToken
pub type Result<T> = core::result::Result<T, crate::error::ContractError>
pub struct Pda
pub fn find_program_address(seeds: &[&[u8]], _program_id: &H160) -> (H160, u8)
pub struct CpiContext<'a, 'b, 'c, 'info, T>
pub fn new(program: AccountInfo<'info>, accounts: T) -> Self
pub fn with_signer(mut self, signer_seeds: &'a [&'b [&'c [u8]]]) -> Self
pub type Pubkey = H160
pub struct Clock
pub fn get() -> Result<Self>
pub struct Rent
pub fn get() -> Result<Self>
pub fn minimum_balance(&self, data_len: usize) -> u64
```

#### `atipicial-contract/src/error.rs` — 4 symbols

```rust
pub enum ContractError
pub fn to_byte_string(&self) -> ByteString
pub fn code(&self) -> u32
pub type Result<T> = core::result::Result<T, ContractError>
```

#### `atipicial-contract/src/serialization.rs` — 3 symbols

```rust
pub trait StorageSerialize: Sized
pub fn storage_get<T: StorageSerialize>(key: ByteString) -> Option<T>
pub fn storage_put<T: StorageSerialize>(key: ByteString, value: T)
```

#### `atipicial-contract/src/smart_contract.rs` — 2 symbols

```rust
pub struct SmartContract
pub fn initialize()
```

#### `atipicial-contract/src/utils.rs` — 1 symbols

```rust
pub fn type_name_of_val<T: ?Sized>(_: &T) -> &'static str
```

#### `atipicial-contract/src/contract/aep.rs` — 6 symbols

```rust
pub trait Aep24
pub trait Aep26
pub trait Aep27
pub trait Aep28
pub trait Aep30
pub trait OnOracleResponse
```

#### `atipicial-contract/src/contract/aep11.rs` — 6 symbols

```rust
pub const PREFIX_TOKEN_ID: u8 = 0x02
pub const PREFIX_TOKEN: u8 = 0x03
pub const PREFIX_ACCOUNT_TOKEN: u8 = 0x04
pub trait TokenState
pub trait Aep11Token<T: TokenState + FromPlaceholder>
pub fn update_aep11_balance(owner: H160, token_id: ByteString, increment: Int256)
```

#### `atipicial-contract/src/contract/aep17.rs` — 5 symbols

```rust
pub const TOTAL_SUPPLY_KEY: u8 = 0x00
pub const PREFIX_BALANCE: u8 = 0x01
pub trait Aep17Token
pub fn update_aep17_balance<const PREFIX: u8>(account: H160, amount: Int256) -> bool
pub fn update_aep17_total_supply<const KEY: u8>(amount: Int256)
```

#### `atipicial-contract/src/contract/aep24.rs` — 15 symbols

```rust
pub struct RoyaltyInfo
pub trait AEP24
pub struct RoyaltyPayment
pub struct AEP24Implementation
pub fn calculate_royalty(sale_price: Int256, royalty_bps: u16) -> Int256
pub fn validate_royalty(amount: u16) -> bool
pub fn store_royalty(token_id: ByteString, recipient: H160, amount: u16)
pub fn get_royalty(token_id: ByteString) -> Option<RoyaltyInfo>
pub fn store_default_royalty(recipient: H160, amount: u16)
pub fn get_default_royalty() -> Option<RoyaltyInfo>
pub fn process_royalty_payment(
pub fn emit_royalty_payment(
pub struct RoyaltyRegistry
pub fn register(
pub fn query(contract: H160, token_id: ByteString) -> Option<RoyaltyInfo>
```

#### `atipicial-contract/src/contract/aep26_27.rs` — 11 symbols

```rust
pub trait AEP26Receiver
pub trait AEP27Receiver
pub struct TransferCallback
pub fn invoke_aep26_callback(
pub fn invoke_aep27_callback(
pub fn safe_nft_transfer(
pub fn safe_token_transfer(
pub struct ReceiverContract
pub fn new() -> Self
pub fn add_accepted_token(&mut self, token: H160)
pub fn add_accepted_nft(&mut self, nft: H160)
```

#### `atipicial-contract/src/contract/event.rs` — 4 symbols

```rust
pub trait OnAep11Transfer
pub trait OnAep17Transfer
pub trait PostAep11Transfer
pub trait PostAep17Transfer
```

#### `atipicial-contract/src/contract/mod.rs` — 4 symbols

```rust
pub fn call(
pub fn get_call_flags() -> CallFlags
pub fn create_standard_account(
pub fn create_multi_signs_account(
```

#### `atipicial-contract/src/contract/native/atipicial.rs` — 18 symbols

```rust
pub struct Atipicial
pub fn hash() -> H160
pub fn symbol() -> ByteString
pub fn decimals() -> u32
pub fn total_supply() -> Int256
pub fn balance_of(account: H160) -> Int256
pub fn transfer(from: H160, to: H160, amount: Int256) -> bool
pub fn get_gas_per_block() -> Int256
pub fn unclaimed_gas(account: H160, end_block: u32) -> Int256
pub fn register_candidate(public_key: PublicKey) -> bool
pub fn unregister_candidate(public_key: PublicKey) -> bool
pub fn vote(account: H160, vote_to: PublicKey) -> bool
pub fn unvote(account: H160) -> bool
pub fn get_candidates() -> Array<contract::AtipicialCandidate>
pub fn get_committee() -> Array<PublicKey>
pub fn get_next_block_validators() -> Array<PublicKey>
pub fn get_account_state(account: H160) -> contract::AtipicialAccountState
pub fn get_candidate_votes(public_key: PublicKey) -> Int256
```

#### `atipicial-contract/src/contract/native/gas.rs` — 7 symbols

```rust
pub struct Gas
pub fn hash() -> H160
pub fn symbol() -> ByteString
pub fn total_supply() -> Int256
pub fn decimals() -> u32
pub fn balance_of(account: H160) -> Int256
pub fn transfer(from: H160, to: H160, amount: Int256) -> bool
```

#### `atipicial-contract/src/contract/native/legder.rs` — 6 symbols

```rust
pub struct Ledger
pub fn hash() -> H160
pub fn current_block_index() -> u32
pub fn current_block_hash() -> H256
pub fn block_of_index(
pub fn block_of_hash(
```

#### `atipicial-contract/src/contract/native/mod.rs` — 12 symbols

```rust
pub struct ContractManagement
pub fn hash() -> H160
pub fn get_min_deployment_fee() -> Int256
pub fn contract_of_hash(hash: H160) -> Contract
pub fn contract_of_id(id: u32) -> Contract
pub fn has_method(hash: H160, method: ByteString, param_count: u32) -> bool
pub fn deploy(aef: ByteString, manifest: ByteString) -> Contract
pub fn update(aef: ByteString, manifest: ByteString)
pub fn destroy()
pub struct RoleManagement
pub fn hash() -> H160
pub fn get_designated_by_role(role: Role, block_index: u32) -> Array<PublicKey>
```

#### `atipicial-contract/src/contract/native/oracle.rs` — 5 symbols

```rust
pub struct Oracle
pub const MINIMUM_RESPONSE_FEE: u64 = 10_000_000
pub fn hash() -> H160
pub fn get_price() -> Int256
pub fn request(
```

#### `atipicial-contract/src/contract/native/policy.rs` — 8 symbols

```rust
pub struct Policy
pub fn hash() -> H160
pub fn get_fee_per_byte() -> Int256
pub fn get_exec_fee_factor() -> Int256
pub fn get_storage_price() -> Int256
pub fn is_blocked(account: H160) -> bool
pub fn get_attribute_fee(attr_type: consts::TxAttrType) -> Int256
pub fn set_attribute_fee(attr_type: consts::TxAttrType, fee: Int256)
```

#### `atipicial-contract/src/crypto/hash.rs` — 3 symbols

```rust
pub trait Sha256<T>
pub trait Ripemd160<T>
pub trait Keccak256<T>
```

#### `atipicial-contract/src/crypto/mod.rs` — 4 symbols

```rust
pub fn check_sign(_public_key: PublicKey, _sign: ByteString) -> bool
pub fn check_multi_signs(_public_keys: Array<PublicKey>, _signs: Array<ByteString>) -> bool
pub fn verify_ecdsa(
pub fn verify_ed25519(_message: ByteString, _public_key: PublicKey, _sign: ByteString) -> bool
```

#### `atipicial-contract/src/native/atipicial.rs` — 6 symbols

```rust
pub fn transfer(_from: H160, _to: H160, _amount: Int256) -> bool
pub fn get_balance(_account: H160) -> Int256
pub fn get_name() -> ByteString
pub fn get_symbol() -> ByteString
pub fn get_decimals() -> u32
pub fn get_total_supply() -> Int256
```

#### `atipicial-contract/src/native/atipicial_governance.rs` — 18 symbols

```rust
pub fn atipicial_contract_hash() -> H160
pub struct AtipicialGovernance
pub fn register_candidate(pubkey: PublicKey) -> bool
pub fn unregister_candidate(pubkey: PublicKey) -> bool
pub fn vote(account: H160, vote_to: Option<PublicKey>) -> bool
pub fn get_candidates() -> Array<Any>
pub fn get_committee() -> Array<PublicKey>
pub fn get_next_block_validators() -> Array<PublicKey>
pub fn get_candidate_votes(pubkey: PublicKey) -> Int256
pub fn get_gas_per_block() -> Int256
pub fn set_gas_per_block(gas_per_block: Int256) -> bool
pub fn get_register_price() -> Int256
pub fn set_register_price(price: Int256) -> bool
pub fn get_account_state(account: H160) -> AccountState
pub fn calculate_bonus(account: H160, end_height: u32) -> Int256
pub fn unclaimed_gas(account: H160, end_height: u32) -> Int256
pub struct AccountState
pub struct CandidateInfo
```

#### `atipicial-contract/src/native/contract.rs` — 4 symbols

```rust
pub fn get_contract(_script_hash: H160) -> Contract
pub fn deploy_contract(_aef_file: ByteString, _manifest: ByteString, _data: Any) -> Contract
pub fn update_contract(_aef_file: ByteString, _manifest: ByteString, _data: Any) -> bool
pub fn destroy_contract() -> bool
```

#### `atipicial-contract/src/native/contract_management.rs` — 6 symbols

```rust
pub struct ContractManagement
pub const SCRIPT_HASH: H160 = H160::from_array([0x72, 0x6b, 0x4a, 0x1a, 0x13, 0x5a, 0x7a, 0x8d, 0x93, 0xee, 0x5d, 0x52, 0x6e, 0x5c, 0x8c, 0x34, 0x0c, 0x58, 0x2f, 0x7a])
pub fn get_contract(script_hash: H160) -> Option<Contract>
pub fn deploy(aef_file: ByteString, manifest: ByteString) -> Contract
pub fn update(aef_file: ByteString, manifest: ByteString)
pub fn destroy()
```

#### `atipicial-contract/src/native/cryptolib.rs` — 11 symbols

```rust
pub fn crypto_lib_hash() -> H160
pub struct CryptoLib
pub fn sha256(data: ByteString) -> ByteString
pub fn ripemd160(data: ByteString) -> ByteString
pub fn keccak256(data: ByteString) -> ByteString
pub fn murmur32(data: ByteString, seed: u32) -> ByteString
pub fn verify_with_ecdsa(
pub fn bls12_381_add(x: ByteString, y: ByteString) -> ByteString
pub fn bls12_381_mul(x: ByteString, mul: ByteString, neg: bool) -> ByteString
pub fn bls12_381_pairing(x: ByteString, y: ByteString) -> ByteString
pub enum EcdsaCurve
```

#### `atipicial-contract/src/native/gas.rs` — 6 symbols

```rust
pub fn transfer(_from: H160, _to: H160, _amount: Int256) -> bool
pub fn get_balance(_account: H160) -> Int256
pub fn get_name() -> ByteString
pub fn get_symbol() -> ByteString
pub fn get_decimals() -> u32
pub fn get_total_supply() -> Int256
```

#### `atipicial-contract/src/native/stdlib.rs` — 6 symbols

```rust
pub fn base64_encode(_data: ByteString) -> ByteString
pub fn base64_decode(_data: ByteString) -> ByteString
pub fn json_serialize(_item: Any) -> ByteString
pub fn json_deserialize(_json: ByteString) -> Any
pub fn itoa(_value: Int256) -> ByteString
pub fn atoi(_value: ByteString) -> Int256
```

#### `atipicial-contract/src/native/stdlib_extended.rs` — 14 symbols

```rust
pub fn stdlib_hash() -> H160
pub struct StdLibExtended
pub fn serialize(item: Any) -> ByteString
pub fn deserialize(data: ByteString) -> Any
pub fn base58_encode(data: ByteString) -> ByteString
pub fn base58_decode(data: ByteString) -> ByteString
pub fn base58_check_encode(data: ByteString) -> ByteString
pub fn base58_check_decode(data: ByteString) -> ByteString
pub fn memory_compare(str1: ByteString, str2: ByteString) -> i32
pub fn memory_search(
pub fn string_split(str: ByteString, separator: ByteString) -> Array<ByteString>
pub fn string_concat(strings: Array<ByteString>) -> ByteString
pub fn itoa_base(value: Int256, base: u8) -> ByteString
pub fn atoi_base(value: ByteString, base: u8) -> Int256
```

#### `atipicial-contract/src/runtime/assert.rs` — 4 symbols

```rust
pub fn assert(condition: bool)
pub fn assert_with_message(condition: bool, message: ByteString)
pub fn abort()
pub fn abort_with_message(message: ByteString)
```

#### `atipicial-contract/src/runtime/mod.rs` — 21 symbols

```rust
pub fn get_trigger() -> TriggerType
pub fn get_platform() -> ByteString
pub fn get_tx() -> Tx
pub fn get_executing_script_hash() -> H160
pub fn get_calling_script_hash() -> H160
pub fn get_entry_script_hash() -> H160
pub fn get_time() -> u64
pub fn get_invocation_counter() -> u32
pub fn get_gas_left() -> Int256
pub fn get_address_version() -> u32
pub fn get_notifications() -> Array<Notification>
pub fn get_notifications_by_hash(script_hash: H160) -> Array<Notification>
pub fn check_witness_with_account(account: H160) -> bool
pub fn check_witness_with_public_key(public_key: PublicKey) -> bool
pub fn log(message: ByteString)
pub fn burn_gas(amount: Int256)
pub fn get_random() -> Int256
pub fn get_network() -> u32
pub fn load_script(script_hash: H160, call_flags: CallFlags, args: Array<Any>) -> Any
pub fn current_signers() -> Array<Signer>
pub fn notify(name: ByteString, data: Array<Any>)
```

#### `atipicial-contract/src/serialize/atipicial_serializable.rs` — 2 symbols

```rust
pub trait AtipicialSerializable: Sized
pub enum SerializationError
```

#### `atipicial-contract/src/serialize/deserialize.rs` — 8 symbols

```rust
pub trait Deserialize: Sized
pub fn deserialize<T: AtipicialSerializable>(bytes: &[u8]) -> Result<T, SerializationError>
pub fn deserialize_from_bytestring<T: AtipicialSerializable>(bytestring: &ByteString) -> Result<T, SerializationError>
pub fn deserialize_multiple<T: AtipicialSerializable>(bytes: &[u8]) -> Result<alloc::vec::Vec<T>, SerializationError>
pub fn deserialize_vec<T: AtipicialSerializable>(bytes: &[u8]) -> Result<alloc::vec::Vec<T>, SerializationError>
pub fn deserialize_option<T: AtipicialSerializable>(bytes: &[u8]) -> Result<Option<T>, SerializationError>
pub fn deserialize_tuple2<T1: AtipicialSerializable, T2: AtipicialSerializable>(
pub fn deserialize_tuple3<T1: AtipicialSerializable, T2: AtipicialSerializable, T3: AtipicialSerializable>(
```

#### `atipicial-contract/src/serialize/serialize.rs` — 8 symbols

```rust
pub trait Serialize
pub fn serialize<T: AtipicialSerializable>(value: &T) -> Result<Bytes, SerializationError>
pub fn serialize_to_bytestring<T: AtipicialSerializable>(value: &T) -> Result<ByteString, SerializationError>
pub fn serialize_multiple<T: AtipicialSerializable>(values: &[T]) -> Result<Bytes, SerializationError>
pub fn serialize_vec<T: AtipicialSerializable>(values: &alloc::vec::Vec<T>) -> Result<Bytes, SerializationError>
pub fn serialize_option<T: AtipicialSerializable>(value: &Option<T>) -> Result<Bytes, SerializationError>
pub fn serialize_tuple2<T1: AtipicialSerializable, T2: AtipicialSerializable>(
pub fn serialize_tuple3<T1: AtipicialSerializable, T2: AtipicialSerializable, T3: AtipicialSerializable>(
```

#### `atipicial-contract/src/services/contract.rs` — 9 symbols

```rust
pub struct Contract
pub fn call(_contract: H160, _method: ByteString, _call_flags: CallFlags, _args: Array<Any>) -> Any
pub fn get_call_flags() -> CallFlags
pub fn create_standard_account(_public_key: PublicKey) -> H160
pub fn create_multisig_account(_min_signers: u32, _public_keys: Array<PublicKey>) -> H160
pub fn call(contract: H160, method: ByteString, call_flags: CallFlags, args: Array<Any>) -> Any
pub fn get_call_flags() -> CallFlags
pub fn create_standard_account(public_key: PublicKey) -> H160
pub fn create_multisig_account(min_signers: u32, public_keys: Array<PublicKey>) -> H160
```

#### `atipicial-contract/src/services/crypto.rs` — 5 symbols

```rust
pub struct Crypto
pub fn check_signature(_public_key: PublicKey, _signature: ByteString) -> bool
pub fn check_multisig(_public_keys: Array<PublicKey>, _signatures: Array<ByteString>) -> bool
pub fn check_signature(public_key: PublicKey, signature: ByteString) -> bool
pub fn check_multisig(public_keys: Array<PublicKey>, signatures: Array<ByteString>) -> bool
```

#### `atipicial-contract/src/services/event.rs` — 3 symbols

```rust
pub struct Event
pub fn emit(name: ByteString, state: Array<Any>)
pub fn emit(name: ByteString, state: Array<Any>)
```

#### `atipicial-contract/src/services/iterator.rs` — 7 symbols

```rust
pub struct Iterator
pub fn next<T>(iterator: StorageIterator<T>) -> bool
pub fn value<T>(iterator: StorageIterator<T>) -> Option<Any>
pub fn key<T>(iterator: StorageIterator<T>) -> Option<Any>
pub fn next<T: crate::types::placeholder::FromPlaceholder>(mut iterator: StorageIterator<T>) -> bool
pub fn value<T: crate::types::placeholder::FromPlaceholder>(iterator: StorageIterator<T>) -> T
pub fn key<T: crate::types::placeholder::FromPlaceholder>(_iterator: StorageIterator<T>) -> crate::types::ByteString
```

#### `atipicial-contract/src/services/runtime.rs` — 45 symbols

```rust
pub struct Runtime
pub fn get_trigger() -> TriggerType
pub fn get_platform() -> ByteString
pub fn get_transaction() -> Tx
pub fn get_executing_script_hash() -> H160
pub fn get_calling_script_hash() -> H160
pub fn get_entry_script_hash() -> H160
pub fn get_time() -> u64
pub fn get_invocation_counter() -> u32
pub fn get_gas_left() -> Int256
pub fn get_address_version() -> u32
pub fn get_notifications(script_hash: Option<H160>) -> Array<Notification>
pub fn check_witness(account: H160) -> bool
pub fn check_witness_with_account(account: H160) -> bool
pub fn check_witness_with_public_key(public_key: PublicKey) -> bool
pub fn get_tx() -> Tx
pub fn log(message: ByteString)
pub fn notify(event_name: ByteString, state: Array<Any>)
pub fn burn_gas(amount: Int256)
pub fn get_random() -> Int256
pub fn get_network() -> u32
pub fn load_script(script: ByteString, call_flags: CallFlags, args: Array<Any>) -> Any
pub fn current_signers() -> Array<Signer>
pub fn get_trigger() -> TriggerType
pub fn get_platform() -> ByteString
pub fn get_transaction() -> Tx
pub fn get_executing_script_hash() -> H160
pub fn get_calling_script_hash() -> H160
pub fn get_entry_script_hash() -> H160
pub fn get_time() -> u64
pub fn get_invocation_counter() -> u32
pub fn get_gas_left() -> Int256
pub fn get_address_version() -> u32
pub fn get_notifications(script_hash: Option<H160>) -> Array<Notification>
pub fn check_witness(account: H160) -> bool
pub fn check_witness_with_account(account: H160) -> bool
pub fn check_witness_with_public_key(public_key: PublicKey) -> bool
pub fn get_tx() -> Tx
pub fn log(message: ByteString)
pub fn notify(event_name: ByteString, state: Array<Any>)
pub fn burn_gas(amount: Int256)
pub fn get_random() -> Int256
pub fn get_network() -> u32
pub fn load_script(script: ByteString, call_flags: CallFlags, args: Array<Any>) -> Any
pub fn current_signers() -> Array<Signer>
```

#### `atipicial-contract/src/services/storage.rs` — 23 symbols

```rust
pub struct Storage
pub fn get_context() -> StorageContext
pub fn get_read_only_context() -> ReadOnlyStorageContext
pub fn as_read_only(context: StorageContext) -> ReadOnlyStorageContext
pub fn get(_context: StorageContext, _key: ByteString) -> Option<ByteString>
pub fn get_with_bytes_key(_context: StorageContext, _key: Bytes) -> Option<ByteString>
pub fn put(_context: StorageContext, _key: ByteString, _value: ByteString)
pub fn put_with_bytes_key(_context: StorageContext, _key: Bytes, _value: ByteString)
pub fn delete(_context: StorageContext, _key: ByteString)
pub fn delete_with_bytes_key(_context: StorageContext, _key: Bytes)
pub fn find<T>(_context: StorageContext, _prefix: ByteString, _options: FindOptions) -> StorageIterator<T>
pub fn find_with_bytes_key<T>(_context: StorageContext, _prefix: Bytes, _options: FindOptions) -> StorageIterator<T>
pub fn get_context() -> StorageContext
pub fn get_read_only_context() -> ReadOnlyStorageContext
pub fn as_read_only(context: StorageContext) -> ReadOnlyStorageContext
pub fn get(context: StorageContext, key: ByteString) -> Option<ByteString>
pub fn get_with_bytes_key(context: StorageContext, key: Bytes) -> Option<ByteString>
pub fn put(context: StorageContext, key: ByteString, value: ByteString)
pub fn put_with_bytes_key(context: StorageContext, key: Bytes, value: ByteString)
pub fn delete(context: StorageContext, key: ByteString)
pub fn delete_with_bytes_key(context: StorageContext, key: Bytes)
pub fn find<T>(context: StorageContext, prefix: ByteString, options: FindOptions) -> StorageIterator<T>
pub fn find_with_bytes_key<T>(context: StorageContext, prefix: Bytes, options: FindOptions) -> StorageIterator<T>
```

#### `atipicial-contract/src/storage/map.rs` — 10 symbols

```rust
pub struct StorageMap
pub struct StorageMap
pub fn new() -> Self
pub fn get(&self, key: ByteString) -> Nullable<ByteString>
pub fn put(&mut self, key: ByteString, value: ByteString)
pub fn delete(&mut self, key: ByteString)
pub fn new() -> Self
pub fn get(&self, key: ByteString) -> Nullable<ByteString>
pub fn put(&mut self, key: ByteString, value: ByteString)
pub fn delete(&mut self, key: ByteString)
```

#### `atipicial-contract/src/storage/mod.rs` — 10 symbols

```rust
pub struct StorageContext(pub Placeholder)
pub fn new() -> Self
pub fn as_readonly(self) -> ReadOnlyStorageContext
pub struct ReadOnlyStorageContext(Placeholder)
pub fn new() -> Self
pub struct Iter<T>
pub fn new() -> Self
pub fn from_placeholder(iter: Placeholder) -> Self
pub fn next(&mut self) -> bool
pub fn value(&self) -> T
```

#### `atipicial-contract/src/types/atipicial.rs` — 15 symbols

```rust
pub struct AtipicialCandidate
pub fn new(public_key: PublicKey, votes: Int256) -> Self
pub struct AtipicialAccountState
pub fn new(balance: Int256, balance_height: u32, vote_to: Option<PublicKey>) -> Self
pub enum TxAttrType
pub fn to_byte(self) -> u8
pub fn from_byte(value: u8) -> Option<Self>
pub enum Role
pub fn to_byte(self) -> u8
pub fn from_byte(value: u8) -> Option<Self>
pub enum VmState
pub fn to_byte(self) -> u8
pub fn from_byte(value: u8) -> Option<Self>
pub fn is_success(self) -> bool
pub fn is_fault(self) -> bool
```

#### `atipicial-contract/src/types/block.rs` — 1 symbols

```rust
pub struct Block
```

#### `atipicial-contract/src/types/consts.rs` — 22 symbols

```rust
pub enum TriggerType
pub enum CallFlags
pub const NONE: CallFlags = CallFlags::None
pub const READ_STATES: CallFlags = CallFlags::ReadStates
pub const WRITE_STATES: CallFlags = CallFlags::WriteStates
pub const ALLOW_CALL: CallFlags = CallFlags::AllowCall
pub const ALLOW_NOTIFY: CallFlags = CallFlags::AllowNotify
pub const STATES: CallFlags = CallFlags::States
pub const READ_ONLY: CallFlags = CallFlags::ReadOnly
pub const ALL: CallFlags = CallFlags::All
pub enum WitnessScope
pub enum WitnessRuleAction
pub enum FindOptions
pub enum WitnessConditionType
pub enum NamedCurveHash
pub enum VmState
pub fn from_u8(value: u8) -> Self
pub fn to_u8(self) -> u8
pub enum OracleResponseCode
pub enum Role
pub enum TxAttrType
pub enum ContractParamType
```

#### `atipicial-contract/src/types/contract.rs` — 20 symbols

```rust
pub struct ContractHash
pub struct Contract
pub fn id(&self) -> u32
pub fn update_counter(&self) -> u32
pub fn hash(&self) -> H160
pub fn aef(&self) -> ByteString
pub struct ContractManifest
pub struct ContractGroup
pub struct ContractPermission
pub struct ContractAbi
pub struct ContractMethodDescriptor
pub struct ContractEventDescriptor
pub struct ContractParam
pub struct AtipicialCandidate
pub fn public_key(&self) -> PublicKey
pub fn votes(&self) -> Int256
pub struct AtipicialAccountState
pub fn balance(&self) -> Int256
pub fn height(&self) -> Int256
pub fn vote_to(&self) -> PublicKey
```

#### `atipicial-contract/src/types/key.rs` — 4 symbols

```rust
pub struct PublicKey(pub ByteString)
pub fn is_valid(&self) -> bool
pub fn from_bytes(bytes: &[u8]) -> Self
pub fn to_bytes(&self) -> alloc::vec::Vec<u8>
```

#### `atipicial-contract/src/types/notification.rs` — 4 symbols

```rust
pub struct Notification
pub fn sender(&self) -> H160
pub fn script_hash(&self) -> H160
pub fn state(&self) -> &Array<Any>
```

#### `atipicial-contract/src/types/placeholder.rs` — 5 symbols

```rust
pub struct Placeholder(i32)
pub fn new<T: Into<i32>>(value: T) -> Self
pub fn is_null(&self) -> bool
pub trait FromPlaceholder
pub trait IntoPlaceholder
```

#### `atipicial-contract/src/types/signer.rs` — 11 symbols

```rust
pub struct Signer
pub struct WitnessRule
pub struct WitnessCondition
pub struct AndCondition
pub struct OrCondition
pub struct NotCondition
pub struct BoolCondition
pub struct CalledByContractCondition
pub struct CalledByGroupCondition
pub struct GroupCondition
pub struct ScriptHashCondition
```

#### `atipicial-contract/src/types/storage.rs` — 15 symbols

```rust
pub struct TypesStorageContext(pub u32)
pub fn to_storage_context(&self) -> crate::storage::StorageContext
pub struct ReadOnlyStorageContext(pub u32)
pub struct StorageIterator(pub u32)
pub enum FindOptions
pub struct StorageItem<T>
pub fn new(context: TypesStorageContext, key: impl Into<ByteString>) -> Self
pub fn get(&self) -> Option<T>
pub fn put(&self, value: T)
pub fn delete(&self)
pub struct StorageMap<K, V>
pub fn new(context: TypesStorageContext, prefix: impl Into<ByteString>) -> Self
pub fn get(&self, key: K) -> Option<V>
pub fn put(&self, key: K, value: V)
pub fn delete(&self, key: K)
```

#### `atipicial-contract/src/types/tx.rs` — 9 symbols

```rust
pub struct Tx
pub fn hash(&self) -> H256
pub fn version(&self) -> u32
pub fn nonce(&self) -> u32
pub fn sender(&self) -> H160
pub fn system_fee(&self) -> Int256
pub fn network_fee(&self) -> Int256
pub fn valid_until_block(&self) -> u32
pub fn script(&self) -> ByteString
```

#### `atipicial-contract/src/types/builtin/any.rs` — 13 symbols

```rust
pub struct Any(Placeholder)
pub struct Any(alloc::boxed::Box<dyn core::any::Any>)
pub fn is<T: 'static>(&self) -> bool
pub fn null() -> Self
pub fn downcast_into<T: 'static + FromPlaceholder>(self) -> T
pub fn is_null(&self) -> bool
pub fn as_bytes(self) -> Option<ByteString>
pub fn as_h160(self) -> Option<H160>
pub fn as_int(self) -> Option<Int256>
pub fn as_bool(self) -> Option<bool>
pub fn as_array<T: 'static>(self) -> Option<Array<T>>
pub fn as_public_key(self) -> Option<PublicKey>
pub trait IntoAny
```

#### `atipicial-contract/src/types/builtin/array.rs` — 20 symbols

```rust
pub struct Array<T>
pub struct Array<T>
pub fn new() -> Self
pub fn from_items(items: &[T]) -> Self
pub fn from_vec(items: alloc::vec::Vec<T>) -> Self
pub fn size(&self) -> usize
pub fn length(&self) -> usize
pub fn push(&mut self, value: T)
pub fn pop(&mut self) -> T
pub fn get(&self, index: usize) -> T
pub fn set(&mut self, index: usize, value: T)
pub fn new() -> Self
pub fn from_items(items: &[T]) -> Self
pub fn from_vec(items: alloc::vec::Vec<T>) -> Self
pub fn size(&self) -> usize
pub fn length(&self) -> usize
pub fn push(&mut self, value: T)
pub fn pop(&mut self) -> T
pub fn get(&self, index: usize) -> T
pub fn set(&mut self, index: usize, value: T)
```

#### `atipicial-contract/src/types/builtin/buffer.rs` — 7 symbols

```rust
pub struct Buffer(alloc::vec::Vec<u8>)
pub struct Buffer(Placeholder)
pub type Bytes = Buffer
pub fn new(size: usize) -> Self
pub fn size(&self) -> usize
pub fn new(size: usize) -> Self
pub fn size(&self) -> usize
```

#### `atipicial-contract/src/types/builtin/bytes.rs` — 8 symbols

```rust
pub struct Bytes(Placeholder)
pub struct Bytes(alloc::vec::Vec<u8>)
pub fn new() -> Self
pub fn from_slice(slice: &[u8]) -> Self
pub fn len(&self) -> usize
pub fn is_empty(&self) -> bool
pub fn as_bytes(&self) -> &[u8]
pub fn as_slice(&self) -> &[u8]
```

#### `atipicial-contract/src/types/builtin/h160.rs` — 11 symbols

```rust
pub struct H160(pub [u8
pub struct H160(Placeholder)
pub const SIZE: usize = 20
pub const ZERO: Self = H160([0u8
pub fn zero() -> Self
pub fn hex_encode(&self) -> ByteString
pub fn to_bytes(&self) -> alloc::vec::Vec<u8>
pub fn from_bytes(bytes: &[u8]) -> Self
pub fn is_zero(&self) -> bool
pub const fn from_array(bytes: [u8
pub fn to_string(&self) -> ByteString
```

#### `atipicial-contract/src/types/builtin/h256.rs` — 7 symbols

```rust
pub struct H256(pub [u8
pub struct H256(Placeholder)
pub const SIZE: usize = 32
pub fn zero() -> Self
pub fn hex_encode(&self) -> ByteString
pub fn to_bytes(&self) -> [u8
pub fn from_bytes(bytes: &[u8]) -> Self
```

#### `atipicial-contract/src/types/builtin/int256.rs` — 51 symbols

```rust
pub struct Int256(num256::Int256)
pub struct Int256(Placeholder)
pub const SIZE: usize = 32
pub fn new(n: i64) -> Self
pub fn from_u64(n: u64) -> Self
pub fn zero() -> Self
pub fn one() -> Self
pub fn minus_one() -> Self
pub fn is_zero(&self) -> bool
pub fn is_one(&self) -> bool
pub fn is_positive(&self) -> bool
pub fn is_negative(&self) -> bool
pub fn checked_add(&self, other: &Self) -> Self
pub fn checked_inc(&self) -> Self
pub fn checked_sub(&self, other: &Self) -> Self
pub fn checked_dec(&self) -> Self
pub fn checked_mul(&self, other: &Self) -> Self
pub fn checked_div(&self, other: &Self) -> Self
pub fn checked_mod(&self, other: &Self) -> Self
pub fn checked_neg(&self) -> Self
pub fn checked_abs(&self) -> Self
pub fn checked_pow(&self, exponent: u32) -> Self
pub fn checked_sqrt(&self) -> Self
pub fn checked_mulmod(&self, other: &Self, modulus: &Self) -> Self
pub fn checked_modpow(&self, exponent: i32, modulus: &Self) -> Self
pub fn checked_shr(&self, shift: u32) -> Self
pub fn checked_shl(&self, shift: u32) -> Self
pub fn new(n: i64) -> Self
pub fn from_u64(n: u64) -> Self
pub fn zero() -> Self
pub fn one() -> Self
pub fn minus_one() -> Self
pub fn is_zero(&self) -> bool
pub fn is_positive(&self) -> bool
pub fn is_negative(&self) -> bool
pub fn checked_add(&self, other: &Self) -> Self
pub fn checked_inc(&self) -> Self
pub fn checked_sub(&self, other: &Self) -> Self
pub fn checked_dec(&self) -> Self
pub fn checked_mul(&self, other: &Self) -> Self
pub fn checked_div(&self, other: &Self) -> Self
pub fn checked_mod(&self, other: &Self) -> Self
pub fn checked_neg(&self) -> Self
pub fn checked_abs(&self) -> Self
pub fn to_i32(&self) -> Option<i32>
pub fn checked_pow(&self, exponent: u32) -> Self
pub fn checked_sqrt(&self) -> Self
pub fn checked_shr(&self, shift: u32) -> Self
pub fn checked_shl(&self, shift: u32) -> Self
pub fn to_bytes(&self) -> alloc::vec::Vec<u8>
pub fn from_bytes(bytes: &[u8]) -> Self
```

#### `atipicial-contract/src/types/builtin/interop.rs` — 2 symbols

```rust
pub struct Interop(Placeholder)
pub struct Interop(Placeholder)
```

#### `atipicial-contract/src/types/builtin/map.rs` — 22 symbols

```rust
pub struct Map<K: Primitive + Ord + Clone, V: Clone>
pub struct Map<K: Primitive + Clone, V: Clone>
pub fn new() -> Self
pub fn size(&self) -> usize
pub fn is_empty(&self) -> bool
pub fn put(&mut self, key: K, value: V)
pub fn get(&self, key: &K) -> Option<V>
pub fn remove(&mut self, key: &K) -> Option<V>
pub fn contains_key(&self, key: &K) -> bool
pub fn keys(&self) -> Array<K>
pub fn values(&self) -> Array<V>
pub fn clear(&mut self)
pub fn new() -> Self
pub fn size(&self) -> usize
pub fn is_empty(&self) -> bool
pub fn put(&mut self, key: K, value: V)
pub fn get(&self, key: &K) -> Option<&V>
pub fn remove(&mut self, key: &K) -> Option<V>
pub fn contains_key(&self, key: &K) -> bool
pub fn keys(&self) -> Array<K>
pub fn values(&self) -> Array<V>
pub fn clear(&mut self)
```

#### `atipicial-contract/src/types/builtin/mod.rs` — 3 symbols

```rust
pub trait Builtin: inner::Sealed
pub trait Primitive: Builtin + Eq + PartialEq
pub trait Sealed
```

#### `atipicial-contract/src/types/builtin/nullable.rs` — 12 symbols

```rust
pub struct Nullable<T>
pub struct Nullable<T>
pub fn new(value: T) -> Self
pub fn null() -> Self
pub fn is_null(&self) -> bool
pub fn unwrap_or(self, default: T) -> T
pub fn unwrap(self) -> T
pub fn new(value: T) -> Self
pub fn null() -> Self
pub fn is_null(&self) -> bool
pub fn unwrap_or(self, default: T) -> T
pub fn unwrap(self) -> T
```

#### `atipicial-contract/src/types/builtin/primitive.rs` — 1 symbols

```rust
pub trait Primitive: Clone + PartialEq + Eq + PartialOrd + Ord + 'static
```

#### `atipicial-contract/src/types/builtin/string.rs` — 28 symbols

```rust
pub struct ByteString(alloc::vec::Vec<u8>)
pub struct ByteString(Placeholder)
pub fn empty() -> Self
pub fn from_bytes(bytes: &[u8]) -> Self
pub fn to_bytes(&self) -> alloc::vec::Vec<u8>
pub fn as_bytes(&self) -> &[u8]
pub fn from_slice(bytes: &[u8]) -> Self
pub fn len(&self) -> usize
pub fn is_empty(&self) -> bool
pub fn substr(&self, start_index: usize, count: usize) -> Self
pub fn concat(&self, other: &Self) -> Self
pub fn hex_encode(&self) -> Self
pub fn from_literal(literal: &str) -> Self
pub fn extend(&mut self, other: ByteString)
pub fn new(value: impl Into<alloc::vec::Vec<u8>>) -> Self
pub fn empty() -> Self
pub fn from_bytes(bytes: &[u8]) -> Self
pub fn from_slice(bytes: &[u8]) -> Self
pub fn to_bytes(&self) -> alloc::vec::Vec<u8>
pub fn len(&self) -> usize
pub fn is_empty(&self) -> bool
pub fn substr(&self, start_index: usize, count: usize) -> Self
pub fn concat(&self, other: &Self) -> Self
pub fn hex_encode(&self) -> Self
pub fn from_literal(literal: &str) -> Self
pub fn extend(&mut self, other: ByteString)
pub trait IntoByteString
pub trait FromByteString
```

#### `atipicial-contract/src/types/builtin/structs.rs` — 2 symbols

```rust
pub fn internal_struct_get<const N: usize, T: FromPlaceholder>(structure: Placeholder) -> T
pub fn internal_struct_set<const N: usize, T: IntoPlaceholder>(structure: Placeholder, value: T)
```

#### `atipicial-contract-proc-macros/src/contract.rs` — 11 symbols

```rust
pub fn _initialize()
pub fn total_supply() -> atipicial_contract::types::Int256
pub fn balance_of(owner: atipicial_contract::types::H160) -> atipicial_contract::types::Int256
pub fn transfer(
pub fn symbol() -> atipicial_contract::types::ByteString
pub fn decimals() -> u8
pub fn totalSupply() -> atipicial_contract::types::Int256
pub fn balanceOf(owner: atipicial_contract::types::H160) -> atipicial_contract::types::Int256
pub fn tokensOf(owner: atipicial_contract::types::H160) -> atipicial_contract::types::Array<atipicial_contract::types::ByteString>
pub fn ownerOf(tokenId: atipicial_contract::types::ByteString) -> atipicial_contract::types::H160
pub fn transfer(to: atipicial_contract::types::H160, tokenId: atipicial_contract::types::ByteString, data: atipicial_contract::types::Any) -> bool
```

#### `atipicial-contract-proc-macros/src/lib.rs` — 24 symbols

```rust
pub fn contract(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn structs(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn contract_impl(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn method(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn safe(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn wasm_export(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn contract_author(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn contract_permission(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn contract_standards(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn contract_version(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn contract_meta(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn owner_only(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn require_witness(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn validate(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn gas_limit(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn program(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn accounts(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn account(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn declare_id(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn error_code(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn event(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn error_code_attr(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn init_if_needed(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn init(_args: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream
```

#### `atipicial-contract-proc-macros/src/program.rs` — 13 symbols

```rust
pub fn expand_program(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn expand_derive_accounts(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn validate(&self) -> atipicial_contract::context::Result<()>
pub fn expand_account(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub const SIZE: usize = 512
pub fn serialize(&self) -> atipicial_contract::types::Bytes
pub fn deserialize(_data: &[u8]) -> atipicial_contract::context::Result<Self>
pub fn expand_declare_id(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub const PROGRAM_ID: &str = #id_value
pub fn id() -> atipicial_contract::types::H160
pub fn expand_error_code(input: proc_macro::TokenStream) -> proc_macro::TokenStream
pub fn code(&self) -> u32
pub fn message(&self) -> &'static str
```

---

## 🧱 Type Anatomy — Structs & Enums, Field by Field


#### `atipicial-compiler/src/aef.rs`

**278 types dissected, field by field.**

**struct `Aef3`** (7 members)
```rust
    pub magic: u32
    pub compiler: String
    pub source: String
    pub reserved: Vec<u8>
    pub tokens: Vec<MethodToken>
    pub script: Vec<u8>
    pub checksum: u32
```

**struct `MethodToken`** (5 members)
```rust
    pub hash: Vec<u8>
    pub method: String
    pub params_count: u16
    pub has_return_value: bool
    pub call_flags: u8
```


#### `atipicial-compiler/src/debug.rs`

**struct `Debugger`** (3 members)
```rust
    script: Vec<u8>
    breakpoints: Vec<usize>
    current_position: usize
```

**enum `StepResult`** (5 members)
```rust
    Normal {
    position: usize
    opcode: OpCode
    operands: Vec<u8>
    next_position: usize
```


#### `atipicial-compiler/src/lib.rs`

**struct `AtipicialCompiler`** (3 members)
```rust
    debug: bool
    source: String
    output_dir: PathBuf
```

**struct `CompilationResult`** (5 members)
```rust
    pub aef_path: PathBuf
    pub manifest_path: PathBuf
    pub aef: Aef3
    pub manifest: Manifest
    pub is_solana_style: bool
```

**struct `WasmModule`** (8 members)
```rust
    pub types: Vec<u32>, // Type indices
    pub imports: Vec<WasmImport>
    pub function_types: Vec<u32>
    pub functions: Vec<WasmFunction>
    pub exports: Vec<WasmExport>
    pub function_names: HashMap<u32, String>
    pub data_segments: Vec<WasmDataSegment>
    pub memories: Vec<WasmMemory>
```

**struct `WasmImport`** (2 members)
```rust
    pub module: String
    pub name: String
```

**struct `WasmExport`** (2 members)
```rust
    pub name: String
    pub index: u32
```

**struct `WasmFunction`** (2 members)
```rust
    pub locals: Vec<(u32, ValType)>
    pub body: std::ops::Range<usize>
```

**struct `WasmDataSegment`** (3 members)
```rust
    pub index: u32
    pub offset: u32
    pub data: Vec<u8>
```

**struct `WasmMemory`** (2 members)
```rust
    pub initial: u64
    pub maximum: Option<u64>
```


#### `atipicial-compiler/src/manifest.rs`

**struct `Manifest`** (8 members)
```rust
    pub name: String
    pub groups: Vec<Group>
    pub features: Features
    pub supported_standards: Vec<String>
    pub abi: Abi
    pub permissions: Vec<Permission>
    pub trusts: Vec<String>
    pub extra: Option<serde_json::Value>
```

**struct `Group`** (2 members)
```rust
    pub pubkey: String
    pub signature: String
```

**struct `Features`** (2 members)
```rust
    pub storage: bool
    pub payable: bool
```

**struct `Abi`** (2 members)
```rust
    pub methods: Vec<Method>
    pub events: Vec<Event>
```

**struct `Method`** (5 members)
```rust
    pub name: String
    pub parameters: Vec<Parameter>
    pub return_type: String
    pub offset: u32
    pub safe: bool
```

**struct `Parameter`** (2 members)
```rust
    pub name: String
    pub type_: String
```

**struct `Event`** (2 members)
```rust
    pub name: String
    pub parameters: Vec<Parameter>
```

**struct `Permission`** (2 members)
```rust
    pub contract: String
    pub methods: Vec<String>
```


#### `atipicial-compiler/src/memory_model.rs`

**struct `MemoryModelTranslator`** (4 members)
```rust
    page_size: u32
    current_pages: u32
    memory_regions: HashMap<MemoryRegion, String>
    storage_prefix: String
```

**struct `MemoryRegion`** (3 members)
```rust
    pub start: u32
    pub size: u32
    pub access_type: MemoryAccessType
```

**enum `MemoryAccessType`** (6 members)
```rust
    ReadWrite
    ReadOnly
    WriteOnly
    Stack
    Heap
    Static
```

**struct `MemoryOperation`** (4 members)
```rust
    pub operation_type: MemoryOperationType
    pub address: u32
    pub size: u32
    pub alignment: u32
```

**enum `MemoryOperationType`** (6 members)
```rust
    Load
    Store
    Grow
    Size
    Copy
    Fill
```

**struct `MemoryStats`** (6 members)
```rust
    pub total_pages: u32
    pub total_bytes: u32
    pub regions_count: usize
    pub stack_size: u32
    pub heap_size: u32
    pub static_size: u32
```


#### `atipicial-compiler/src/opcodes.rs`

**enum `OpCode`** (187 members)
```rust
    PushInt8 = 0x00
    PushInt16 = 0x01
    PushInt32 = 0x02
    PushInt64 = 0x03
    PushInt128 = 0x04
    PushInt256 = 0x05
    PushTrue = 0x08
    PushFalse = 0x09
    PushNull = 0x0B
    PushData1 = 0x0C
    PushData2 = 0x0D
    PushData4 = 0x0E
    PushM1 = 0x0F
    Push0 = 0x10
    Push1 = 0x11
    Push2 = 0x12
    Push3 = 0x13
    Push4 = 0x14
    Push5 = 0x15
    Push6 = 0x16
    Push7 = 0x17
    Push8 = 0x18
    Push9 = 0x19
    Push10 = 0x1A
    Push11 = 0x1B
    // …162 more members
```


#### `atipicial-compiler/src/optimizer.rs`

**struct `CompilerOptimizer`** (5 members)
```rust
    pub enable_dead_code_elimination: bool
    pub enable_constant_folding: bool
    pub enable_peephole_optimization: bool
    pub enable_instruction_combining: bool
    pub stats: OptimizationStats
```

**struct `OptimizationStats`** (6 members)
```rust
    pub dead_instructions_removed: usize
    pub constants_folded: usize
    pub peephole_optimizations: usize
    pub instructions_combined: usize
    pub size_reduction_bytes: usize
    pub optimization_passes: usize
```

**struct `BasicBlock`** (7 members)
```rust
    pub id: usize
    pub start_offset: usize
    pub end_offset: usize
    pub instructions: Vec<u8>
    pub predecessors: Vec<usize>
    pub successors: Vec<usize>
    pub is_reachable: bool
```

**struct `ControlFlowGraph`** (3 members)
```rust
    pub blocks: Vec<BasicBlock>
    pub entry_block: usize
    pub block_map: HashMap<usize, usize>, // offset -> block_id
```


#### `atipicial-compiler/src/solana_detector.rs`

**struct `SolanaStyleDetector`** (4 members)
```rust
    module: &'a WasmModule
    is_solana_style: bool
    program_module: Option<String>
    handlers: HashMap<String, HandlerInfo>
```

**struct `HandlerInfo`** (4 members)
```rust
    pub name: String
    pub func_index: u32
    pub is_read_only: bool
    pub has_context: bool
```


#### `atipicial-compiler/src/translator.rs`

**struct `WasmTranslator`** (8 members)
```rust
    debug: bool
    script: Vec<u8>
    labels: HashMap<u32, usize>
    pending_jumps: Vec<PendingJump>
    wasm_parser: WasmInstructionParser
    function_offsets: HashMap<u32, usize>
    wasm_bytes: Option<Vec<u8>>
    optimizer: CompilerOptimizer
```


#### `atipicial-compiler/src/wasm_parser.rs`

**struct `WasmInstructionParser`** (5 members)
```rust
    pub offset: usize
    pub locals: Vec<wasmparser::ValType>
    pub label_stack: Vec<ControlLabel>
    pub instruction_map: HashMap<u8, InstructionMapping>
    pub memory_translator: MemoryModelTranslator
```

**struct `ControlLabel`** (5 members)
```rust
    pub label_type: ControlType
    pub start_offset: usize
    pub end_offset: Option<usize>
    pub continuation_offset: Option<usize>
    pub jump_positions: Vec<usize>, // Positions that need to be patched
```

**enum `ControlType`** (6 members)
```rust
    Block
    Loop
    If
    Else
    Try
    Catch
```

**struct `InstructionMapping`** (4 members)
```rust
    pub wasm_opcode: u8
    pub atipicial_opcodes: Vec<OpCode>
    pub immediate_handler: Option<fn(&[u8]) -> Vec<u8>>
    pub stack_effect: i32, // Net stack change
```


#### `atipicial-compiler/tests/compilation_pipeline_comprehensive.rs`

**struct `Initialize`** (1 members)
```rust
    pub data_account: Account<'info, GreetingAccount>
```

**struct `Greet`** (1 members)
```rust
    pub data_account: Account<'info, GreetingAccount>
```

**struct `GreetingAccount`** (1 members)
```rust
    pub message: ByteString
```

**struct `Initialize`** (3 members)
```rust
    pub data_account: Account<'info, DataAccount>
    pub user: Signer<'info>
    pub system_program: Program<'info, System>
```

**struct `UpdateData`** (2 members)
```rust
    pub data_account: Account<'info, DataAccount>
    pub user: Signer<'info>
```

**struct `DataAccount`** (2 members)
```rust
    pub data: u64
    pub authority: Pubkey
```

**enum `ErrorCode`** (3 members)
```rust
    InsufficientFunds
    Unauthorized
    InvalidInput
```

**struct `CreateToken`** (3 members)
```rust
    pub token: Account<'info, Token>
    pub authority: Signer<'info>
    pub system_program: Program<'info, System>
```

**struct `TransferTokens`** (3 members)
```rust
    pub from_token_account: Account<'info, TokenAccount>
    pub to_token_account: Account<'info, TokenAccount>
    pub owner: Signer<'info>
```

**struct `Token`** (5 members)
```rust
    pub authority: Pubkey
    pub name: String
    pub symbol: String
    pub decimals: u8
    pub total_supply: u64
```

**struct `TokenAccount`** (3 members)
```rust
    pub owner: Pubkey
    pub amount: u64
    pub token: Pubkey
```

**struct `TokenCreated`** (4 members)
```rust
    pub token: Pubkey
    pub name: String
    pub symbol: String
    pub initial_supply: u64
```

**struct `Transfer`** (3 members)
```rust
    pub from: Pubkey
    pub to: Pubkey
    pub amount: u64
```

**enum `ErrorCode`** (1 members)
```rust
    InsufficientFunds
```

**struct `ComplexConstraints`** (14 members)
```rust
    init
    payer = payer
    space = 8 + 32 + 64
    seeds = [b"account", user.key().as_ref()]
    bump
    )]
    pub user_account: Account<'info, UserAccount>
    mut
    has_one = authority
    constraint = user_account.balance >= min_balance
    )]
    pub token_account: Account<'info, TokenAccount>
    pub payer: Signer<'info>
    pub system_program: UncheckedAccount<'info>
```

**struct `Initialize`** (3 members)
```rust
    pub data_account: Account<'info, DataAccount>
    pub authority: Signer<'info>
    pub system_program: Program<'info, System>
```

**struct `UpdateValue`** (2 members)
```rust
    pub data_account: Account<'info, DataAccount>
    pub authority: Signer<'info>
```

**struct `DataAccount`** (2 members)
```rust
    pub value: u64
    pub authority: Pubkey
```

**struct `Initialized`** (3 members)
```rust
    pub account: Pubkey
    pub initial_value: u64
    pub authority: Pubkey
```

**struct `ValueUpdated`** (4 members)
```rust
    pub account: Pubkey
    pub old_value: u64
    pub new_value: u64
    pub authority: Pubkey
```

**enum `ErrorCode`** (1 members)
```rust
    Unauthorized
```


#### `atipicial-compiler/tests/comprehensive_compiler_tests.rs`

**struct `ContractTestFramework`** (1 members)
```rust
    storage_helper: StorageTestHelper
```

**struct `TestScenario`** (3 members)
```rust
    name: String
    steps: Vec<Box<dyn Fn() -> bool>>
    framework: ContractTestFramework
```


#### `atipicial-compiler/tests/e2e_tests.rs`

**struct `TestContract`** (2 members)
```rust
    is_initialized: bool
    value: u64
```


#### `atipicial-contract/src/account.rs`

**struct `AccountLoader`** (2 members)
```rust
    acc_info: crate::context::AccountInfo<'info>
    _phantom: core::marker::PhantomData<T>
```

**struct `AccountMeta`** (3 members)
```rust
    pub pubkey: crate::types::H160
    pub is_signer: bool
    pub is_writable: bool
```


#### `atipicial-contract/src/atipicial_features.rs`

**enum `OracleFilter`** (3 members)
```rust
    None
    JsonPath(ByteString)
    XPath(ByteString)
```

**enum `OracleResponseCode`** (9 members)
```rust
    Success = 0x00
    ProtocolNotSupported = 0x10
    ConsensusUnreachable = 0x12
    NotFound = 0x14
    Timeout = 0x16
    Forbidden = 0x18
    ResponseTooLarge = 0x1a
    InsufficientFunds = 0x1c
    Error = 0xff
```

**enum `NamedCurve`** (2 members)
```rust
    Secp256k1 = 22
    Secp256r1 = 23
```

**struct `Block`** (10 members)
```rust
    pub hash: H256
    pub version: u32
    pub prev_hash: H256
    pub merkle_root: H256
    pub timestamp: u64
    pub nonce: u64
    pub index: u32
    pub primary_index: u8
    pub next_consensus: H160
    pub transaction_count: u32
```

**struct `Transaction`** (8 members)
```rust
    pub hash: H256
    pub version: u8
    pub nonce: u32
    pub sender: H160
    pub sys_fee: Int256
    pub net_fee: Int256
    pub valid_until_block: u32
    pub script: Bytes
```

**struct `Contract`** (5 members)
```rust
    pub id: u32
    pub update_counter: u16
    pub hash: H160
    pub aef: Bytes
    pub manifest: ByteString
```


#### `atipicial-contract/src/context.rs`

**struct `Context`** (3 members)
```rust
    pub program_id: H160
    pub accounts: T
    pub remaining_accounts: Vec<AccountInfo<'info>>
```

**struct `AccountInfo`** (4 members)
```rust
    pub key: H160
    pub is_signer: bool
    pub is_writable: bool
    pub data: &'info [u8]
```

**struct `Account`** (2 members)
```rust
    pub info: AccountInfo<'info>
    pub data: T
```

**struct `Signer`** (1 members)
```rust
    pub info: AccountInfo<'info>
```

**struct `SystemAccount`** (1 members)
```rust
    pub info: AccountInfo<'info>
```

**struct `Program`** (2 members)
```rust
    pub info: AccountInfo<'info>
    _phantom: core::marker::PhantomData<T>
```

**struct `CpiContext`** (3 members)
```rust
    pub program: AccountInfo<'info>
    pub accounts: T
    pub signer_seeds: &'a [&'b [&'c [u8]]]
```

**struct `Clock`** (5 members)
```rust
    pub slot: u64
    pub epoch_start_timestamp: i64
    pub epoch: u64
    pub leader_schedule_epoch: u64
    pub unix_timestamp: i64
```

**struct `Rent`** (3 members)
```rust
    pub lamports_per_byte_year: u64
    pub exemption_threshold: f64
    pub burn_percent: u8
```


#### `atipicial-contract/src/error.rs`

**enum `ContractError`** (25 members)
```rust
    AccountNotFound
    AccountAlreadyExists
    AccountNotMutable
    InvalidAccountData
    InvalidDiscriminator
    InvalidAccountRelation
    InvalidPDA
    InsufficientFunds
    InsufficientSpace
    MissingSigner
    InvalidInstruction
    ArithmeticOverflow
    Unauthorized
    InvalidArgument
    Custom(u32, String)
    CustomString(ByteString)
    DataCorruption
    InvalidDataFormat
    DataTooLarge
    SerializationFailure
    DeserializationFailure
    ValidationFailure(ByteString)
    StorageAccessDenied
    ReentrancyDetected
    RateLimitExceeded
```


#### `atipicial-contract/src/contract/aep24.rs`

**struct `RoyaltyInfo`** (2 members)
```rust
    pub recipient: H160
    pub amount: u16
```

**struct `RoyaltyPayment`** (2 members)
```rust
    pub recipient: H160
    pub amount: Int256
```


#### `atipicial-contract/src/contract/aep26_27.rs`

**struct `ReceiverContract`** (2 members)
```rust
    accepted_tokens: alloc::vec::Vec<H160>
    accepted_nfts: alloc::vec::Vec<H160>
```


#### `atipicial-contract/src/native/atipicial_governance.rs`

**struct `AccountState`** (3 members)
```rust
    pub balance: Int256
    pub balance_height: Int256
    pub vote_to: Option<PublicKey>
```

**struct `CandidateInfo`** (3 members)
```rust
    pub pubkey: PublicKey
    pub votes: Int256
    pub registered: bool
```


#### `atipicial-contract/src/native/cryptolib.rs`

**enum `EcdsaCurve`** (2 members)
```rust
    Secp256k1 = 0
    Secp256r1 = 1
```


#### `atipicial-contract/src/serialize/atipicial_serializable.rs`

**enum `SerializationError`** (4 members)
```rust
    InsufficientData
    InvalidFormat
    UnsupportedType
    Custom(&'static str)
```


#### `atipicial-contract/src/storage/map.rs`

**struct `StorageMap`** (1 members)
```rust
    cx: StorageContext
```

**struct `StorageMap`** (1 members)
```rust
    items: alloc::collections::BTreeMap<alloc::vec::Vec<u8>, alloc::vec::Vec<u8>>
```


#### `atipicial-contract/src/storage/mod.rs`

**struct `Iter`** (2 members)
```rust
    iter: Placeholder
    _marker: core::marker::PhantomData<T>
```


#### `atipicial-contract/src/types/atipicial.rs`

**struct `AtipicialCandidate`** (2 members)
```rust
    pub public_key: PublicKey
    pub votes: Int256
```

**struct `AtipicialAccountState`** (3 members)
```rust
    pub balance: Int256
    pub balance_height: u32
    pub vote_to: Option<PublicKey>
```

**enum `TxAttrType`** (5 members)
```rust
    HighPriority = 0x01
    OracleResponse = 0x11
    NotValidBefore = 0x20
    Conflicts = 0x21
    NotValidAfter = 0x22
```

**enum `Role`** (4 members)
```rust
    StateValidator = 4
    Oracle = 8
    AtipicialFsAlphabet = 16
    P2PNotary = 32
```

**enum `VmState`** (4 members)
```rust
    None = 0
    Halt = 1
    Fault = 2
    Break = 4
```


#### `atipicial-contract/src/types/block.rs`

**struct `Block`** (10 members)
```rust
    hash: H256
    version: u32
    prev_hash: H256
    merkle_root: H256
    timestamp: u64
    nonce: u64
    index: u32, // current block index
    primary_index: u32
    next_consensus: H160
    tx_count: u32
```


#### `atipicial-contract/src/types/consts.rs`

**enum `TriggerType`** (6 members)
```rust
    OnPersist = 0x01
    PostPersist = 0x02
    Verification = 0x20
    Application = 0x40
    System = 0x01 | 0x02
    All = 0x01 | 0x02 | 0x20 | 0x40
```

**enum `CallFlags`** (8 members)
```rust
    None = 0x00
    ReadStates = 0x01
    WriteStates = 0x02
    AllowCall = 0x04
    AllowNotify = 0x08
    States = 0x01 | 0x02
    ReadOnly = 0x01 | 0x04
    All = 0x01 | 0x02 | 0x04 | 0x08
```

**enum `WitnessScope`** (6 members)
```rust
    None = 0x00
    CalledByEntry = 0x01
    CustomContracts = 0x10
    CustomGroups = 0x20
    WitnessRules = 0x40
    Global = 0x80
```

**enum `WitnessRuleAction`** (2 members)
```rust
    Deny = 0x00
    Allow = 0x01
```

**enum `FindOptions`** (7 members)
```rust
    None = 0
    KeysOnly = 1 << 0
    RemovePrefix = 1 << 1
    ValuesOnly = 1 << 2
    DeserializeValues = 1 << 3
    PickField0 = 1 << 4
    PickField1 = 1 << 5
```

**enum `WitnessConditionType`** (9 members)
```rust
    Bool = 0x00
    Not = 0x01
    And = 0x02
    Or = 0x03
    ScriptHash = 0x18
    Group = 0x19
    CalledByEntry = 0x20
    CalledByContract = 0x28
    CalledByGroup = 0x29
```

**enum `NamedCurveHash`** (4 members)
```rust
    Secp256k1SHA256 = 22
    Secp256r1SHA256 = 23
    Secp256k1Keccak256 = 122
    Secp256r1Keccak256 = 123
```

**enum `VmState`** (4 members)
```rust
    None = 0
    Halt = 1
    Fault = 2
    Break = 4
```

**enum `OracleResponseCode`** (10 members)
```rust
    Success = 0x00
    ProtocolNotSupported = 0x10
    ConsensusUnreachable = 0x12
    NotFound = 0x14
    Timeout = 0x16
    Forbidden = 0x18
    ResponseTooLarge = 0x1a
    InsufficientFunds = 0x1c
    ContentTypeNotSupported = 0x1f
    Error = 0xff
```

**enum `Role`** (4 members)
```rust
    StateValidator = 4
    Oracle = 8
    AtipicialFsAlphabet = 16
    P2PNotary = 32
```

**enum `TxAttrType`** (4 members)
```rust
    HighPriority = 0x01
    OracleResponse = 0x11
    NotValidBefore = 0x20
    Conflicts = 0x21
```

**enum `ContractParamType`** (13 members)
```rust
    Any = 0x00
    Bool = 0x10
    Int = 0x11
    Bytes = 0x12
    String = 0x13
    Hash160 = 0x14
    Hash256 = 0x15
    PublicKey = 0x16
    Sign = 0x17
    Array = 0x20
    Map = 0x22
    Interop = 0x30
    Void = 0xff
```


#### `atipicial-contract/src/types/contract.rs`

**struct `ContractHash`** (2 members)
```rust
    id: u32
    hash: H160
```

**struct `Contract`** (5 members)
```rust
    id: u32
    update_counter: u32
    hash: H160
    aef: ByteString
    manifest: ContractManifest
```

**struct `ContractManifest`** (8 members)
```rust
    name: ByteString
    groups: Array<ContractGroup>
    _reserved: Any
    supported_standards: Array<ByteString>
    abi: ContractAbi
    permissions: Array<ContractPermission>
    trusts: Array<ByteString>
    extra: ByteString
```

**struct `ContractGroup`** (2 members)
```rust
    public_key: PublicKey
    sign: ByteString
```

**struct `ContractPermission`** (2 members)
```rust
    contract: ByteString
    methods: Array<ByteString>
```

**struct `ContractAbi`** (2 members)
```rust
    methods: Array<ContractMethodDescriptor>
    events: Array<ContractEventDescriptor>
```

**struct `ContractMethodDescriptor`** (5 members)
```rust
    name: ByteString
    params: Array<ContractParam>
    return_type: ContractParamType
    offset: u32
    safe: bool
```

**struct `ContractEventDescriptor`** (2 members)
```rust
    name: ByteString
    params: Array<ContractParam>
```

**struct `ContractParam`** (2 members)
```rust
    name: ByteString
    param_type: ContractParamType
```

**struct `AtipicialCandidate`** (2 members)
```rust
    public_key: PublicKey
    votes: Int256
```

**struct `AtipicialAccountState`** (3 members)
```rust
    balance: Int256
    height: Int256
    vote_to: PublicKey
```


#### `atipicial-contract/src/types/notification.rs`

**struct `Notification`** (3 members)
```rust
    sender: H160
    script_hash: H160
    state: Array<Any>
```


#### `atipicial-contract/src/types/signer.rs`

**struct `Signer`** (5 members)
```rust
    account: H160
    scopes: WitnessScope
    allowed_contracts: Array<H160>
    allowed_groups: Array<PublicKey>
    rules: Array<WitnessRule>
```

**struct `WitnessRule`** (2 members)
```rust
    action: WitnessRuleAction
    condition: WitnessCondition
```

**struct `WitnessCondition`** (2 members)
```rust
    condition_type: WitnessConditionType
    condition: i32, // placeholder, and cannot use directly
```

**struct `AndCondition`** (1 members)
```rust
    expressions: Array<WitnessCondition>
```

**struct `OrCondition`** (1 members)
```rust
    expressions: Array<WitnessCondition>
```

**struct `NotCondition`** (1 members)
```rust
    expression: WitnessCondition
```

**struct `BoolCondition`** (1 members)
```rust
    expression: bool
```

**struct `CalledByContractCondition`** (1 members)
```rust
    hash: H160, // contract hash
```

**struct `CalledByGroupCondition`** (1 members)
```rust
    group: PublicKey, // group public key
```

**struct `GroupCondition`** (1 members)
```rust
    group: PublicKey, // group public key
```

**struct `ScriptHashCondition`** (1 members)
```rust
    hash: H160, // script hash
```


#### `atipicial-contract/src/types/storage.rs`

**enum `FindOptions`** (6 members)
```rust
    All = 0
    KeysOnly = 1
    ValuesOnly = 2
    Descending = 4
    DescendingKeysOnly = 5
    DescendingValuesOnly = 6
```

**struct `StorageItem`** (3 members)
```rust
    context: TypesStorageContext
    key: ByteString
    _marker: core::marker::PhantomData<T>
```

**struct `StorageMap`** (4 members)
```rust
    context: TypesStorageContext
    prefix: ByteString
    _marker_k: core::marker::PhantomData<K>
    _marker_v: core::marker::PhantomData<V>
```


#### `atipicial-contract/src/types/tx.rs`

**struct `Tx`** (8 members)
```rust
    hash: H256
    version: u32
    nonce: u32
    sender: H160
    system_fee: Int256
    network_fee: Int256
    valid_until_block: u32
    script: ByteString
```


#### `atipicial-contract/src/types/builtin/array.rs`

**struct `Array`** (1 members)
```rust
    value: alloc::vec::Vec<T>
```

**struct `Array`** (2 members)
```rust
    value: Placeholder
    _marker: core::marker::PhantomData<T>
```


#### `atipicial-contract/src/types/builtin/map.rs`

**struct `Map`** (1 members)
```rust
    value: BTreeMap<K, V>
```

**struct `Map`** (2 members)
```rust
    value: Placeholder
    _marker: core::marker::PhantomData<(K, V)>
```


#### `atipicial-contract/src/types/builtin/nullable.rs`

**struct `Nullable`** (2 members)
```rust
    value: Placeholder
    _marker: core::marker::PhantomData<T>
```

**struct `Nullable`** (1 members)
```rust
    value: Option<T>
```


#### `atipicial-contract/tests/aep_standards_comprehensive.rs`

**struct `AEP17TestHelper`** (2 members)
```rust
    balances: std::collections::HashMap<String, Int256>
    total_supply: Int256
```

**struct `AEP11TestHelper`** (2 members)
```rust
    tokens: std::collections::HashMap<String, H160>
    token_properties: std::collections::HashMap<String, std::collections::HashMap<String, String>>
```


#### `atipicial-contract/tests/comprehensive_unit_tests.rs`

**struct `StorageTestHelper`** (1 members)
```rust
    context: StorageContext
```


#### `atipicial-contract/tests/contract_attributes_tests.rs`

**struct `TestAttributeContract`** (1 members)
```rust
    storage_key: ByteString
```

**struct `MinimalContract`** (1 members)
```rust
    counter: ByteString
```

**struct `PermissionTestContract`** (1 members)
```rust
    data: ByteString
```

**struct `StandardsContract`** (1 members)
```rust
    token_data: ByteString
```


#### `atipicial-contract/tests/core_functionality_tests.rs`

**struct `TestContract`** (1 members)
```rust
    value: Int256
```

**struct `FeatureContract`** (2 members)
```rust
    storage_enabled: bool
    payable: bool
```

**struct `SolanaStyleContract`** (2 members)
```rust
    owner: H160
    initialized: bool
```


#### `atipicial-contract/tests/enhanced_mock_env.rs`

**struct `EnhancedMockEnvironment`** (5 members)
```rust
    pub storage: Arc<Mutex<MockStorage>>
    pub runtime: Arc<Mutex<MockRuntime>>
    pub crypto: Arc<Mutex<MockCrypto>>
    pub contracts: Arc<Mutex<MockContractManager>>
    pub events: Arc<Mutex<Vec<MockEvent>>>
```

**struct `MockStorage`** (4 members)
```rust
    data: HashMap<String, Vec<u8>>
    contexts: HashMap<String, StorageContext>
    read_only_contexts: Vec<String>
    transaction_log: Vec<StorageOperation>
```

**struct `StorageOperation`** (5 members)
```rust
    pub operation_type: StorageOpType
    pub key: String
    pub value: Option<Vec<u8>>
    pub timestamp: u64
    pub context: String
```

**enum `StorageOpType`** (4 members)
```rust
    Put
    Get
    Delete
    Find
```

**struct `StorageStats`** (4 members)
```rust
    pub key_count: usize
    pub total_size: usize
    pub avg_value_size: usize
    pub operation_count: usize
```

**struct `MockRuntime`** (14 members)
```rust
    current_time: u64
    gas_left: Int256
    gas_limit: Int256
    witnesses: Vec<H160>
    executing_script_hash: H160
    calling_script_hash: H160
    entry_script_hash: H160
    invocation_counter: u32
    random_seed: u64
    network_id: u32
    address_version: u32
    signers: Vec<Signer>
    notifications: Vec<MockNotification>
    log_entries: Vec<String>
```

**struct `MockNotification`** (3 members)
```rust
    pub script_hash: H160
    pub event_name: String
    pub state: Vec<String>, // Simplified state representation
```

**struct `MockEvent`** (4 members)
```rust
    pub name: String
    pub data: Vec<String>
    pub timestamp: u64
    pub contract: H160
```

**struct `MockCrypto`** (2 members)
```rust
    hash_cache: HashMap<String, Vec<u8>>
    signature_results: HashMap<String, bool>
```

**struct `MockContractManager`** (3 members)
```rust
    deployed_contracts: HashMap<H160, MockContractInfo>
    contract_storage: HashMap<H160, HashMap<String, Vec<u8>>>
    call_history: Vec<MockContractCall>
```

**struct `MockContractInfo`** (4 members)
```rust
    pub name: String
    pub script_hash: H160
    pub methods: Vec<String>
    pub is_native: bool
```

**struct `MockContractCall`** (6 members)
```rust
    pub caller: H160
    pub target: H160
    pub method: String
    pub parameters: Vec<String>
    pub result: String
    pub timestamp: u64
```

**struct `PerformanceTester`** (1 members)
```rust
    env: EnhancedMockEnvironment
```

**struct `DEXTestScenario`** (5 members)
```rust
    env: EnhancedMockEnvironment
    token_a: H160
    token_b: H160
    dex_contract: H160
    users: Vec<H160>
```

**struct `LendingTestScenario`** (5 members)
```rust
    env: EnhancedMockEnvironment
    lending_contract: H160
    collateral_token: H160
    borrow_token: H160
    users: Vec<H160>
```

**struct `StorageTestHelper`** (1 members)
```rust
    context_id: String
```


#### `atipicial-contract/tests/integration_tests.rs`

**struct `BasicContract`** (1 members)
```rust
    name: ByteString
```


#### `atipicial-contract/tests/mock_env.rs`

**struct `Notification`** (2 members)
```rust
    pub name: ByteString
    pub data: Any
```

**struct `MockAtipicialEnvironment`** (8 members)
```rust
    storage: HashMap<Vec<u8>, Vec<u8>>
    witnesses: Vec<H160>
    timestamp: u64
    gas_left: u64
    notifications: Vec<Notification>
    executing_script_hash: H160
    calling_script_hash: H160
    entry_script_hash: H160
```

**struct `MockStorageMap`** (1 members)
```rust
    env: &'a mut MockAtipicialEnvironment
```


#### `atipicial-contract/tests/solana_contracts_tests.rs`

**struct `TestContract`** (1 members)
```rust
    initialized: bool
```


#### `atipicial-contract/tests/solana_style_tests.rs`

**struct `TestContract`** (1 members)
```rust
    value: u64
```

**struct `ValidationContract`** (1 members)
```rust
    owner: H160
```


#### `atipicial-contract/tests/test_utils.rs`

**struct `StorageTestHelper`** (1 members)
```rust
    context: StorageContext
```

**struct `AEP17TestHelper`** (1 members)
```rust
    storage: StorageTestHelper
```

**struct `AEP11TestHelper`** (1 members)
```rust
    storage: StorageTestHelper
```

**struct `TestScenario`** (2 members)
```rust
    name: String
    steps: Vec<Box<dyn Fn() -> bool>>
```


#### `atipicial-contract-proc-macros/src/lib.rs`

**struct `TokenContract`** (0 members)
```rust
```

**struct `MyContract`** (0 members)
```rust
```

**struct `Initialize`** (0 members)
```rust
```

**struct `DataAccount`** (0 members)
```rust
```

**enum `MyError`** (0 members)
```rust
```


#### `examples/01-hello-world/src/lib.rs`

**struct `HelloWorld`** (1 members)
```rust
    greeting: ByteString
```


#### `examples/01-hello-world/src/lib_solana_style.rs`

**struct `Initialize`** (3 members)
```rust
    pub state: Account<'info, StateAccount>
    pub authority: Signer<'info>
    pub system_program: Program<'info, System>
```

**struct `GetGreeting`** (1 members)
```rust
    pub state: Account<'info, StateAccount>
```

**struct `SetGreeting`** (2 members)
```rust
    pub state: Account<'info, StateAccount>
    pub authority: Signer<'info>
```

**struct `SayHello`** (2 members)
```rust
    pub state: Account<'info, StateAccount>
    pub visitor: Signer<'info>
```

**struct `GetVisitorCount`** (1 members)
```rust
    pub state: Account<'info, StateAccount>
```

**struct `GetRecentVisitors`** (1 members)
```rust
    pub state: Account<'info, StateAccount>
```

**struct `GetInfo`** (1 members)
```rust
    pub state: Account<'info, StateAccount>
```

**struct `Reset`** (2 members)
```rust
    pub state: Account<'info, StateAccount>
    pub authority: Signer<'info>
```

**struct `StateAccount`** (5 members)
```rust
    pub greeting: String
    pub authority: Pubkey
    pub visitor_count: u64
    pub recent_visitors: Vec<VisitorRecord>
    pub is_initialized: bool
```

**struct `VisitorRecord`** (4 members)
```rust
    pub name: String
    pub address: Pubkey
    pub timestamp: i64
    pub visitor_number: u64
```

**struct `ContractInfo`** (5 members)
```rust
    pub name: String
    pub version: String
    pub author: String
    pub visitor_count: u64
    pub current_greeting: String
```

**enum `ErrorCode`** (5 members)
```rust
    AlreadyInitialized
    InvalidGreeting
    InvalidVisitorName
    Overflow
    Unauthorized
```

**struct `ProgramInitialized`** (2 members)
```rust
    pub authority: Pubkey
    pub greeting: String
```

**struct `GreetingChanged`** (3 members)
```rust
    pub old_greeting: String
    pub new_greeting: String
    pub authority: Pubkey
```

**struct `VisitorRegistered`** (1 members)
```rust
    pub visitor: VisitorRecord
```

**struct `ContractReset`** (1 members)
```rust
    pub authority: Pubkey
```


#### `examples/01-hello-world-solana-style/src/lib.rs`

**struct `HelloWorld`** (4 members)
```rust
    authority: H160
    greeting: ByteString
    visitor_count: Int256
    is_initialized: bool
```


#### `examples/01-hello-world-solana-style-simple/src/lib.rs`

**struct `HelloWorld`** (1 members)
```rust
    greeting: ByteString
```


#### `examples/02-simple-storage/src/lib.rs`

**struct `SimpleStorage`** (1 members)
```rust
    owner: H160
```


#### `examples/02-simple-token/src/lib.rs`

**struct `SimpleToken`** (5 members)
```rust
    owner: H160
    symbol: ByteString
    decimals: u32
    total_supply: Int256
    paused: bool
```


#### `examples/03-counter/src/lib.rs`

**struct `Counter`** (1 members)
```rust
    count: Int256
```


#### `examples/04-aep17-token/src/lib.rs`

**struct `Aep17Token`** (9 members)
```rust
    symbol_key: ByteString
    decimals_key: ByteString
    total_supply_key: ByteString
    balance_prefix: ByteString
    allowance_prefix: ByteString
    owner_key: ByteString
    minters_prefix: ByteString
    paused_key: ByteString
    max_supply_key: ByteString
```


#### `examples/04-aep17-token/src/lib_solana_style.rs`

**struct `Initialize`** (4 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub initial_holder: Account<'info, TokenAccount>
    pub mint_authority: Signer<'info>
    pub system_program: Program<'info, System>
```

**struct `GetMetadata`** (1 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
```

**struct `BalanceOf`** (1 members)
```rust
    pub token_account: Account<'info, TokenAccount>
```

**struct `Transfer`** (4 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub from_account: Account<'info, TokenAccount>
    pub to_account: Account<'info, TokenAccount>
    pub owner: Signer<'info>
```

**struct `Approve`** (4 members)
```rust
    pub allowance: Account<'info, AllowanceAccount>
    pub owner: Signer<'info>
    pub spender: AccountInfo<'info>
    pub system_program: Program<'info, System>
```

**struct `GetAllowance`** (1 members)
```rust
    pub allowance: Account<'info, AllowanceAccount>
```

**struct `TransferFrom`** (5 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub allowance: Account<'info, AllowanceAccount>
    pub from_account: Account<'info, TokenAccount>
    pub to_account: Account<'info, TokenAccount>
    pub spender: Signer<'info>
```

**struct `Mint`** (3 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub to_account: Account<'info, TokenAccount>
    pub mint_authority: Signer<'info>
```

**struct `Burn`** (3 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub from_account: Account<'info, TokenAccount>
    pub owner: Signer<'info>
```

**struct `FreezeAccount`** (3 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub target_account: Account<'info, TokenAccount>
    pub freeze_authority: Signer<'info>
```

**struct `ThawAccount`** (3 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub target_account: Account<'info, TokenAccount>
    pub freeze_authority: Signer<'info>
```

**struct `Pause`** (2 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub mint_authority: Signer<'info>
```

**struct `Unpause`** (2 members)
```rust
    pub token_metadata: Account<'info, TokenMetadata>
    pub mint_authority: Signer<'info>
```

**struct `TokenMetadata`** (8 members)
```rust
    pub name: String
    pub symbol: String
    pub decimals: u8
    pub total_supply: u128
    pub mint_authority: Pubkey
    pub freeze_authority: Option<Pubkey>
    pub is_paused: bool
    pub is_initialized: bool
```

**struct `TokenAccount`** (3 members)
```rust
    pub owner: Pubkey
    pub balance: u128
    pub is_frozen: bool
```

**struct `AllowanceAccount`** (3 members)
```rust
    pub owner: Pubkey
    pub spender: Pubkey
    pub amount: u128
```

**enum `TokenError`** (11 members)
```rust
    AlreadyInitialized
    InvalidSupply
    InvalidDecimals
    InvalidAmount
    InsufficientBalance
    InsufficientAllowance
    ArithmeticError
    NoFreezeAuthority
    AccountFrozen
    TokenPaused
    Unauthorized
```

**struct `TokenInitialized`** (5 members)
```rust
    pub name: String
    pub symbol: String
    pub decimals: u8
    pub total_supply: u128
    pub mint_authority: Pubkey
```

**struct `TokenTransfer`** (3 members)
```rust
    pub from: Pubkey
    pub to: Pubkey
    pub amount: u128
```

**struct `TokenApproval`** (3 members)
```rust
    pub owner: Pubkey
    pub spender: Pubkey
    pub amount: u128
```

**struct `TokenMinted`** (3 members)
```rust
    pub to: Pubkey
    pub amount: u128
    pub new_supply: u128
```

**struct `TokenBurned`** (3 members)
```rust
    pub from: Pubkey
    pub amount: u128
    pub new_supply: u128
```

**struct `AccountFrozen`** (2 members)
```rust
    pub account: Pubkey
    pub authority: Pubkey
```

**struct `AccountThawed`** (2 members)
```rust
    pub account: Pubkey
    pub authority: Pubkey
```

**struct `TokenPaused`** (1 members)
```rust
    pub authority: Pubkey
```

**struct `TokenUnpaused`** (1 members)
```rust
    pub authority: Pubkey
```


#### `examples/04-aep17-token-solana-style/src/lib.rs`

**struct `AEP17TokenSolanaStyle`** (6 members)
```rust
    name_key: ByteString
    symbol_key: ByteString
    decimals_key: ByteString
    total_supply_key: ByteString
    owner_key: ByteString
    initialized_key: ByteString
```


#### `examples/05-aep11-nft/src/lib.rs`

**struct `AEP11NFT`** (5 members)
```rust
    name_key: ByteString
    symbol_key: ByteString
    total_supply_key: ByteString
    owner_key: ByteString
    initialized_key: ByteString
```


#### `examples/06-aep24-royalty-nft/src/lib.rs`

**struct `AEP24RoyaltyNFT`** (5 members)
```rust
    name_key: ByteString
    symbol_key: ByteString
    total_supply_key: ByteString
    owner_key: ByteString
    initialized_key: ByteString
```


#### `examples/07-crowdfunding/src/lib.rs`

**struct `Crowdfunding`** (6 members)
```rust
    creator_key: ByteString
    target_amount_key: ByteString
    current_amount_key: ByteString
    deadline_key: ByteString
    active_key: ByteString
    initialized_key: ByteString
```


#### `examples/08-staking/src/lib.rs`

**struct `Staking`** (4 members)
```rust
    admin_key: ByteString
    reward_rate_key: ByteString
    total_staked_key: ByteString
    initialized_key: ByteString
```


#### `examples/09-simple-dex/src/lib.rs`

**struct `LiquidityPool`** (7 members)
```rust
    pub token_a: H160
    pub token_b: H160
    pub reserve_a: Int256
    pub reserve_b: Int256
    pub total_liquidity: Int256
    pub fee_rate: u32, // Fee in basis points (e.g., 30 = 0.3%)
    pub is_active: bool
```

**struct `LpPosition`** (4 members)
```rust
    pub pool_id: Int256
    pub provider: H160
    pub liquidity_tokens: Int256
    pub timestamp: u64
```

**struct `SimpleDex`** (11 members)
```rust
    pool_prefix: ByteString,           // pool_id -> pool data
    pool_count_key: ByteString,        // total number of pools
    token_pair_prefix: ByteString,     // token_a + token_b -> pool_id
    lp_position_prefix: ByteString,    // pool_id + provider -> position
    provider_pools_prefix: ByteString, // provider -> list of pool_ids
    owner_key: ByteString
    paused_key: ByteString
    min_liquidity_key: ByteString,     // minimum liquidity for new pools
    max_slippage_key: ByteString,      // maximum allowed slippage
    protocol_fee_key: ByteString,      // protocol fee rate
    collected_fees_prefix: ByteString, // token -> collected fees
```


#### `examples/10-multisig-wallet/src/lib.rs`

**enum `ProposalStatus`** (4 members)
```rust
    Pending = 0
    Executed = 1
    Cancelled = 2
    Expired = 3
```

**struct `TransactionProposal`** (9 members)
```rust
    pub proposer: H160
    pub target: H160
    pub token: H160,        // H160::zero() for native transfers
    pub amount: Int256
    pub data: ByteString,   // Additional call data
    pub expiration: i64
    pub status: ProposalStatus
    pub confirmations: u32
    pub required_confirmations: u32
```

**struct `MultisigWallet`** (13 members)
```rust
    owners_key: ByteString,             // List of wallet owners
    required_confirmations_key: ByteString, // M in M-of-N
    owner_count_key: ByteString,        // Total number of owners
    proposal_prefix: ByteString,        // proposal_id -> proposal data
    proposal_count_key: ByteString,     // Total number of proposals
    confirmations_prefix: ByteString,   // proposal_id + owner -> confirmation status
    is_owner_prefix: ByteString,        // owner -> true/false
    owner_index_prefix: ByteString,     // owner -> index in owners list
    max_owners_key: ByteString,         // Maximum number of owners
    proposal_lifetime_key: ByteString,  // Default proposal expiration time
    emergency_recovery_key: ByteString, // Emergency recovery address
    recovery_delay_key: ByteString,     // Delay before recovery can be executed
    executed_prefix: ByteString,        // transaction_id -> executed status
```


#### `examples/11-governance/src/lib.rs`

**enum `ProposalStatus`** (8 members)
```rust
    Pending = 0
    Active = 1
    Succeeded = 2
    Defeated = 3
    Queued = 4
    Executed = 5
    Cancelled = 6
    Expired = 7
```

**enum `VoteChoice`** (3 members)
```rust
    Against = 0
    For = 1
    Abstain = 2
```

**struct `Proposal`** (14 members)
```rust
    pub id: Int256
    pub proposer: H160
    pub title: ByteString
    pub description: ByteString
    pub target_contract: H160
    pub call_data: ByteString
    pub start_time: u64
    pub end_time: u64
    pub execution_time: u64
    pub for_votes: Int256
    pub against_votes: Int256
    pub abstain_votes: Int256
    pub status: ProposalStatus
    pub quorum_required: Int256
```

**struct `Vote`** (5 members)
```rust
    pub proposal_id: Int256
    pub voter: H160
    pub choice: VoteChoice
    pub voting_power: Int256
    pub timestamp: u64
```

**struct `Governance`** (16 members)
```rust
    proposal_prefix: ByteString,       // proposal_id -> proposal data
    proposal_count_key: ByteString,    // total number of proposals
    vote_prefix: ByteString,           // proposal_id + voter -> vote data
    voter_proposals_prefix: ByteString, // voter -> list of proposal_ids
    governance_token_key: ByteString,  // governance token contract
    voting_delay_key: ByteString,      // delay before voting starts
    voting_period_key: ByteString,     // voting duration
    execution_delay_key: ByteString,   // delay before execution
    proposal_threshold_key: ByteString, // minimum tokens to propose
    quorum_percentage_key: ByteString, // required quorum percentage
    admin_key: ByteString
    guardian_key: ByteString,          // emergency guardian
    timelock_key: ByteString,          // timelock contract
    treasury_prefix: ByteString,       // token -> treasury balance
    delegate_prefix: ByteString,       // delegator -> delegate
    delegated_votes_prefix: ByteString, // delegate -> total delegated votes
```


#### `examples/12-oracle-price-feed/src/lib.rs`

**struct `PriceData`** (5 members)
```rust
    pub symbol: ByteString
    pub price: Int256
    pub timestamp: u64
    pub source: ByteString
    pub confidence: u32, // Confidence level in basis points
```

**struct `OracleRequest`** (8 members)
```rust
    pub id: Int256
    pub url: ByteString
    pub filter: ByteString
    pub callback: ByteString
    pub user_data: ByteString
    pub gas_for_response: Int256
    pub timestamp: u64
    pub status: u8, // 0=pending, 1=completed, 2=failed
```

**struct `OraclePriceFeed`** (15 members)
```rust
    price_prefix: ByteString,           // symbol -> latest price data
    historical_prefix: ByteString,      // symbol + timestamp -> price data
    price_sources_prefix: ByteString,   // symbol -> list of sources
    request_prefix: ByteString,         // request_id -> request data
    request_count_key: ByteString,      // total number of requests
    pending_requests_key: ByteString,   // list of pending request IDs
    owner_key: ByteString
    authorized_oracles_prefix: ByteString, // oracle_address -> authorized
    min_sources_key: ByteString,        // minimum sources for consensus
    max_price_age_key: ByteString,      // maximum age for valid prices
    price_deviation_key: ByteString,    // maximum allowed price deviation
    subscribers_prefix: ByteString,     // user -> subscription data
    subscription_fee_key: ByteString,   // fee for price feed access
    circuit_breaker_key: ByteString,    // emergency stop
    emergency_price_prefix: ByteString, // emergency fallback prices
```


#### `examples/13-nft-marketplace/src/lib.rs`

**struct `NftMarketplace`** (1 members)
```rust
    storage_keys: StorageKeys
```


#### `examples/13-nft-marketplace/src/royalties.rs`

**struct `RoyaltyPayment`** (4 members)
```rust
    pub recipient: H160
    pub amount: Int256
    pub token: H160
    pub timestamp: u64
```


#### `examples/13-nft-marketplace/src/storage.rs`

**struct `StorageKeys`** (26 members)
```rust
    pub owner_key: ByteString
    pub platform_fee_key: ByteString
    pub paused_key: ByteString
    pub min_duration_key: ByteString
    pub max_duration_key: ByteString
    pub min_auction_duration_key: ByteString
    pub max_auction_duration_key: ByteString
    pub listing_count_key: ByteString
    pub auction_count_key: ByteString
    pub offer_count_key: ByteString
    pub sale_count_key: ByteString
    pub listing_prefix: ByteString
    pub auction_prefix: ByteString
    pub offer_prefix: ByteString
    pub bid_prefix: ByteString
    pub sale_prefix: ByteString
    pub seller_listings_prefix: ByteString
    pub nft_listings_prefix: ByteString
    pub active_auctions_prefix: ByteString
    pub user_offers_prefix: ByteString
    pub nft_offers_prefix: ByteString
    pub escrow_prefix: ByteString
    pub pending_withdrawals_prefix: ByteString
    pub royalty_cache_prefix: ByteString
    pub emergency_stop_key: ByteString
    // …1 more members
```


#### `examples/13-nft-marketplace/src/types.rs`

**enum `ListingStatus`** (4 members)
```rust
    Active = 0
    Sold = 1
    Cancelled = 2
    Expired = 3
```

**enum `AuctionStatus`** (4 members)
```rust
    Active = 0
    Ended = 1
    Cancelled = 2
    Settled = 3
```

**enum `OfferStatus`** (5 members)
```rust
    Active = 0
    Accepted = 1
    Rejected = 2
    Expired = 3
    Withdrawn = 4
```

**struct `Listing`** (9 members)
```rust
    pub id: Int256
    pub nft_contract: H160
    pub token_id: ByteString
    pub seller: H160
    pub price: Int256
    pub payment_token: H160
    pub created_at: u64
    pub expires_at: u64
    pub status: ListingStatus
```

**struct `Auction`** (13 members)
```rust
    pub id: Int256
    pub nft_contract: H160
    pub token_id: ByteString
    pub seller: H160
    pub starting_price: Int256
    pub reserve_price: Int256
    pub current_bid: Int256
    pub highest_bidder: H160
    pub payment_token: H160
    pub created_at: u64
    pub ends_at: u64
    pub status: AuctionStatus
    pub bid_count: u32
```

**struct `Bid`** (4 members)
```rust
    pub auction_id: Int256
    pub bidder: H160
    pub amount: Int256
    pub timestamp: u64
```

**struct `Offer`** (9 members)
```rust
    pub id: Int256
    pub nft_contract: H160
    pub token_id: ByteString
    pub offerer: H160
    pub amount: Int256
    pub payment_token: H160
    pub created_at: u64
    pub expires_at: u64
    pub status: OfferStatus
```

**struct `RoyaltyRecipient`** (2 members)
```rust
    pub recipient: H160
    pub percentage: u32, // Basis points
```

**struct `Sale`** (10 members)
```rust
    pub nft_contract: H160
    pub token_id: ByteString
    pub seller: H160
    pub buyer: H160
    pub price: Int256
    pub payment_token: H160
    pub platform_fee: Int256
    pub royalty_fee: Int256
    pub timestamp: u64
    pub sale_type: SaleType
```

**enum `SaleType`** (3 members)
```rust
    DirectSale = 0
    Auction = 1
    Offer = 2
```

**struct `FeeCalculation`** (3 members)
```rust
    pub platform_fee: Int256
    pub royalty_fees: Vec<RoyaltyRecipient>
    pub seller_proceeds: Int256
```

**struct `MarketplaceConfig`** (7 members)
```rust
    pub platform_fee_rate: u32
    pub min_listing_duration: u64
    pub max_listing_duration: u64
    pub min_auction_duration: u64
    pub max_auction_duration: u64
    pub bid_extension_time: u64
    pub min_bid_increment: u32
```

**struct `ListingEvent`** (5 members)
```rust
    pub listing_id: Int256
    pub nft_contract: H160
    pub token_id: ByteString
    pub seller: H160
    pub price: Int256
```

**struct `AuctionEvent`** (6 members)
```rust
    pub auction_id: Int256
    pub nft_contract: H160
    pub token_id: ByteString
    pub seller: H160
    pub starting_price: Int256
    pub ends_at: u64
```

**struct `BidEvent`** (4 members)
```rust
    pub auction_id: Int256
    pub bidder: H160
    pub amount: Int256
    pub is_winning: bool
```

**struct `SaleEvent`** (6 members)
```rust
    pub nft_contract: H160
    pub token_id: ByteString
    pub seller: H160
    pub buyer: H160
    pub price: Int256
    pub sale_type: SaleType
```

**struct `OfferEvent`** (5 members)
```rust
    pub offer_id: Int256
    pub nft_contract: H160
    pub token_id: ByteString
    pub offerer: H160
    pub amount: Int256
```


#### `examples/14-atipicial-features-showcase/src/lib.rs`

**struct `AtipicialFeaturesShowcase`** (1 members)
```rust
    owner: H160
```


#### `examples/15-atipicial-complete-features/src/lib.rs`

**struct `AtipicialCompleteFeatures`** (2 members)
```rust
    owner: H160
    is_initialized: bool
```


#### `examples/15-atipicial-complete-features/src/lib_fixed.rs`

**struct `AtipicialCompleteFeatures`** (2 members)
```rust
    owner: H160
    is_initialized: bool
```


#### `tests/mock_env.rs`

**struct `Syscall`** (2 members)
```rust
    pub name: String
    pub args: Vec<String>
```

**struct `Notification`** (2 members)
```rust
    pub name: ByteString
    pub data: Any
```

**struct `MockAtipicialEnvironment`** (8 members)
```rust
    storage: HashMap<Vec<u8>, Vec<u8>>
    witnesses: Vec<H160>
    timestamp: u64
    gas_left: u64
    notifications: Vec<Notification>
    executing_script_hash: H160
    calling_script_hash: H160
    entry_script_hash: H160
```

**struct `MockStorageMap`** (1 members)
```rust
    env: &'a mut MockAtipicialEnvironment
```


---

## 🚨 Error Message Atlas — Every Way This System Can Fail

**0 distinct error messages.**


---

## ⚙️ Function Inventory — src/, Complete

**0 functions inventoried.**


---

## 📚 Documentation Index

**1. [`docs/CHANGELOG.md`](docs/CHANGELOG.md)** — Changelog
> Atipicial Rust Smart Contract Framework - Changelog

**2. [`docs/DEPLOYMENT.md`](docs/DEPLOYMENT.md)** — Deployment
> Atipicial Smart Contract Deployment Guide

**3. [`docs/SOLANA_STYLE_GUIDE.md`](docs/SOLANA_STYLE_GUIDE.md)** — Solana Style Guide
> Atipicial Smart Contracts with Solana-Style Syntax

**4. [`docs/SUMMARY.md`](docs/SUMMARY.md)** — Summary
> Atipicial Rust Smart Contract Framework - Documentation

**5. [`docs/aep11-guide.md`](docs/aep11-guide.md)** — Aep11 Guide
> AEP-11 Implementation Guide

**6. [`docs/atipicial-syscall-implementation.md`](docs/atipicial-syscall-implementation.md)** — Atipicial Syscall Implementation
> Atipicial Syscall Implementation Details

**7. [`docs/code-documentation-style.md`](docs/code-documentation-style.md)** — Code Documentation Style
> Code Documentation Style Guide

**8. [`docs/contract-attributes.md`](docs/contract-attributes.md)** — Contract Attributes
> Contract Attributes

**9. [`docs/efficient-contracts.md`](docs/efficient-contracts.md)** — Efficient Contracts
> Writing Efficient Atipicial Smart Contracts

**10. [`docs/getting-started.md`](docs/getting-started.md)** — Getting Started
> Getting Started with Atipicial Rust Smart Contract Framework

**11. [`docs/manifest-generation.md`](docs/manifest-generation.md)** — Manifest Generation
> Atipicial Contract Manifest Generation

**12. [`docs/oracle-framework.md`](docs/oracle-framework.md)** — Oracle Framework
> Oracle Framework for Atipicial Rust Smart Contracts

**13. [`docs/safe-methods.md`](docs/safe-methods.md)** — Safe Methods
> Safe Methods in Atipicial Smart Contracts

**14. [`docs/serialization-guide.md`](docs/serialization-guide.md)** — Serialization Guide
> Custom Serialization Guide for atipicial-contract-rs

**15. [`docs/solana-style-syntax-guide.md`](docs/solana-style-syntax-guide.md)** — Solana Style Syntax Guide
> Solana-Style Syntax for Atipicial Smart Contracts

**16. [`docs/syscall-hash-calculation.md`](docs/syscall-hash-calculation.md)** — Syscall Hash Calculation
> Syscall Hash Calculation in Atipicial

**17. [`docs/testing-guide.md`](docs/testing-guide.md)** — Testing Guide
> Testing Guide for Atipicial Rust Smart Contracts

**18. [`docs/understanding-atipicial-manifests.md`](docs/understanding-atipicial-manifests.md)** — Understanding Atipicial Manifests
> Understanding and Customizing ATC Contract Manifests


---

## 🤝 Contributing

Read the design laws above. Priorities, in order: deterministic correctness → exact parity → clear boundaries → measured performance → usability. Determinism is not negotiable.

---

<div align="center">

## 👑 FOUNDER

<table>
<tr><td align="center" width="33%">

### **xmoohad**

</td></tr>
<tr><td align="center">

**Founder · Architect · Blockchain Scientist · Computer Programmer**

</td></tr>
<tr><td align="center">

*Atipicial Chain is a sovereign Layer-1 blockchain for smart contracts,
digital assets, and decentralized applications.*

Every crate, every opcode, every line of this repository descends from a
single engineering vision: **build a reliable blockchain platform for
smart contracts, digital assets, and decentralized applications.**

</td></tr>
</table>

`ATC` — Atipicial Coin · `ATD` — AtipicialDollar · addresses begin with **A**

</div>

---

*© Atipicial Chain · Founded by xmoohad · MIT License*
