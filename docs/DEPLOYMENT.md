<!-- Atipicial Chain · sovereign Layer-1 for smart contracts and digital assets -->
<!-- 👑 Founded & engineered by xmoohad — Blockchain Scientist · Computer Programmer -->

# Atipicial Smart Contract Deployment Guide

## Overview

This guide explains how to compile, deploy, and test Atipicial smart contracts using the integrated atipicial-compiler and Atipicial Express.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quick Start](#quick-start)
3. [Compilation](#compilation)
4. [Deployment with Atipicial Express](#deployment-with-atipicial-express)
5. [Testing Deployed Contracts](#testing-deployed-contracts)
6. [MainNet/TestNet Deployment](#mainnet-testnet-deployment)
7. [Troubleshooting](#troubleshooting)

## Prerequisites

### Required Tools

1. **Rust with WASM target**:
```bash
rustup target add wasm32-unknown-unknown
rustup component add rustfmt clippy
```

2. **Atipicial Express** (for local testing):
```bash
# Install .NET SDK
dotnet tool install Atipicial.Express -g
```

3. **Atipicial CLI** (optional, for MainNet/TestNet):
```bash
dotnet tool install Atipicial.CLI -g
```

## Quick Start

Deploy all contracts to Atipicial Express in one command:

```bash
# Clean, build, compile, and deploy everything
make clean all deploy
```

## Compilation

### Building WASM Files

All examples use a standardized build process:

```bash
# Build all examples
make build-all

# Build specific example
make 04-aep17-token

# Build with debug symbols
make BUILD_MODE=debug build-all
```

### Compiling to AEF

The atipicial-compiler converts WASM files to Atipicial Executable Format (AEF):

```bash
# Compile all WASM files to AEF
make compile

# Compile specific WASM file
cargo run -p atipicial-compiler -- compile path/to/contract.wasm --output build/

# Verify AEF file
cargo run -p atipicial-compiler -- verify build/contract.aef
```

### Compilation Output

For each contract, the compiler generates:
- `.aef` - Atipicial Executable Format file (bytecode)
- `.manifest.json` - Contract manifest with metadata and ABI

## Deployment with Atipicial Express

### 1. Initialize Atipicial Express

```bash
# Start Atipicial Express (single node)
make atipicial-express

# Or manually with custom config
atipicialxp create -f
atipicialxp wallet create alice
atipicialxp transfer 1000 GAS genesis alice
```

### 2. Deploy Contracts

#### Deploy All Contracts
```bash
make deploy
```

#### Deploy Specific Contract
```bash
./scripts/deploy.sh deploy build/aep17_token.aef
```

#### Manual Deployment
```bash
# Deploy with Atipicial Express CLI
atipicialxp contract deploy build/contract.aef alice

# Get contract hash from deployment
atipicialxp contract list
```

### 3. Deployment Configuration

The deployment script (`scripts/deploy.sh`) provides:
- Automatic wallet creation and funding
- Sequential deployment of all contracts
- Deployment receipts saved to `build/*.deployment.json`
- Error handling and retry logic

## Testing Deployed Contracts

### Using Atipicial Express

#### Invoke Contract Methods

```bash
# Call without parameters
atipicialxp contract invoke <contract-hash> <method> alice

# Call with parameters
atipicialxp contract invoke <contract-hash> transfer alice -- \
  @address:alice @address:bob @integer:100

# View-only call (no transaction)
atipicialxp contract invoke <contract-hash> balanceOf alice \
  --witness-scope None -- @address:alice
```

#### Using the Test Script

```bash
# Test specific method
./scripts/deploy.sh test <contract-hash> <method> [params...]

# Example: Test AEP-17 transfer
./scripts/deploy.sh test 0x123...abc transfer \
  alice bob 100
```

### Contract-Specific Tests

#### Hello World
```bash
CONTRACT_HASH=<hash>
atipicialxp contract invoke $CONTRACT_HASH hello alice
atipicialxp contract invoke $CONTRACT_HASH greet alice -- @string:"Atipicial Developer"
```

#### AEP-17 Token
```bash
CONTRACT_HASH=<hash>
# Get balance
atipicialxp contract invoke $CONTRACT_HASH balanceOf alice -- @address:alice

# Transfer tokens
atipicialxp contract invoke $CONTRACT_HASH transfer alice -- \
  @address:alice @address:bob @integer:1000000 @null
```

#### Counter
```bash
CONTRACT_HASH=<hash>
# Increment counter
atipicialxp contract invoke $CONTRACT_HASH increment alice

# Get current value
atipicialxp contract invoke $CONTRACT_HASH get_value alice
```

## MainNet/TestNet Deployment

### 1. Prepare for Network Deployment

```bash
# Build optimized contracts
make BUILD_MODE=release build-all compile

# Verify all AEF files
make verify
```

### 2. TestNet Deployment

```bash
# Create TestNet wallet
atipicial-cli wallet create testnet-wallet.json

# Request TestNet GAS from faucet
# https://atipicialfaucet.io/

# Deploy to TestNet
atipicial-cli contract deploy build/contract.aef \
  --wallet testnet-wallet.json \
  --network testnet
```

### 3. MainNet Deployment

```bash
# IMPORTANT: Test thoroughly on TestNet first!

# Deploy to MainNet
atipicial-cli contract deploy build/contract.aef \
  --wallet mainnet-wallet.json \
  --network mainnet \
  --gas 10
```

### 4. Verify Deployment

```bash
# Check contract on explorer
# TestNet: https://testnet.atipicialtube.io/
# MainNet: https://atipicialtube.io/

# Verify with Atipicial CLI
atipicial-cli contract show <contract-hash> --network testnet
```

## Contract Management

### Update Contract

```bash
# Deploy new version (creates new contract)
atipicialxp contract deploy build/contract_v2.aef alice

# Migrate storage if needed
atipicialxp contract invoke <old-hash> migrate alice -- @hash160:<new-hash>
```

### Monitor Contract

```bash
# View contract storage
atipicialxp contract storage <contract-hash>

# Get contract info
atipicialxp contract get <contract-hash>

# View recent invocations
atipicialxp show transactions --contract <contract-hash>
```

## Solana-Style Contracts

For Solana-style contracts, the deployment process is the same:

```bash
# Build Solana-style example
cd examples/01-hello-world-solana-style-simple
cargo build --target wasm32-unknown-unknown --release

# Compile (auto-detects Solana style)
cargo run -p atipicial-compiler -- compile \
  target/wasm32-unknown-unknown/release/*.wasm

# Deploy
atipicialxp contract deploy *.aef alice
```

The compiler automatically:
- Detects `#[contract_impl]` implementations (primary pattern)  
- Detects modern `#[contract_impl]` patterns (recommended)
- Generates appropriate manifest
- Maps Solana-style patterns to Atipicial

## Troubleshooting

### Common Issues

#### 1. WASM Build Fails
```bash
# Ensure correct RUSTFLAGS
export RUSTFLAGS="-Ctarget-feature=+multivalue -Clink-arg=--initial-memory=2097152"

# Clean and rebuild
cargo clean
cargo build --target wasm32-unknown-unknown --release
```

#### 2. AEF Compilation Fails
```bash
# Check WASM file validity
wasm-objdump -x contract.wasm

# Compile with debug output
cargo run -p atipicial-compiler -- compile contract.wasm --debug
```

#### 3. Deployment Fails
```bash
# Check Atipicial Express is running
ps aux | grep atipicial-express

# Check wallet has GAS
atipicialxp wallet show alice

# Check contract size (max ~1MB)
ls -lh build/*.aef
```

#### 4. Invocation Fails
```bash
# Check method name and parameters
atipicialxp contract get <contract-hash> | jq '.manifest.abi.methods'

# Test with minimal parameters first
atipicialxp contract invoke <contract-hash> <method> alice

# Enable verbose output
ATC_EXPRESS_DEBUG=1 atipicialxp contract invoke ...
```

### Debug Tools

#### Disassemble AEF
```rust
use atipicial_compiler::debug::Debugger;

let aef = atipicial_compiler::aef::Aef3::from_file("contract.aef")?;
let debugger = Debugger::new(&aef);
println!("{}", debugger.disassemble());
```

#### Step Debugger
```rust
let mut debugger = Debugger::new(&aef);
debugger.add_breakpoint(0x10);

while let Ok(step) = debugger.step() {
    match step {
        StepResult::Normal { opcode, .. } => println!("Executing: {:?}", opcode),
        StepResult::Breakpoint(_) => println!("Hit breakpoint!"),
        StepResult::End => break,
    }
}
```

## Best Practices

1. **Always test on Atipicial Express first** before deploying to TestNet/MainNet
2. **Keep AEF files under 1MB** for optimal performance
3. **Use view methods** (marked as `safe` in manifest) for read operations
4. **Implement proper access control** in your contracts
5. **Test with various parameter combinations** to ensure robustness
6. **Monitor gas consumption** during testing
7. **Keep deployment receipts** for contract management
8. **Version your contracts** and maintain upgrade paths

## Resources

- [Atipicial Developer Portal](https://developers.atipicial.com/)
- [Atipicial Express Documentation](https://github.com/atipicial-project/atipicial-express)
- [Atipicial Smart Contract Examples](../examples/)
- [Solana-Style Development Guide](SOLANA_STYLE_GUIDE.md)

## Support

For deployment issues:
- GitHub Issues: [atipicial-contract-rs](https://github.com/atipicial/atipicial-contract-rs)
- Atipicial Discord: [discord.atipicial.com](https://discord.atipicial.com)
- Documentation: [docs.atipicial.com](https://docs.atipicial.com)

---

> **Atipicial Chain** — sovereign Layer-1 for smart contracts and digital assets.
> 👑 Founded & engineered by **xmoohad** — Blockchain Scientist · Computer Programmer.
> `ATC` Atipicial Coin · `ATD` AtipicialDollar · addresses begin with **A**
