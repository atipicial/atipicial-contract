<!-- Atipicial Chain · sovereign Layer-1 for smart contracts and digital assets -->
<!-- 👑 Founded & engineered by xmoohad — Blockchain Scientist · Computer Programmer -->

# Atipicial Contract Framework Tests

Comprehensive test suite for the Atipicial Rust smart contract framework with Solana-style syntax.

## Test Structure

```
tests/
├── types_test.rs           # Unit tests for core types
├── native_contracts_test.rs # Integration tests for native contracts
├── aep_standards_test.rs   # Tests for AEP standards
├── storage_runtime_test.rs # Storage and runtime service tests
├── end_to_end_test.rs     # Complete workflow tests
├── test_utils.rs           # Test utilities and helpers
└── README.md               # This file
```

## Running Tests

```bash
# Run all tests
cargo test

# Run specific test file
cargo test --test types_test

# Run with verbose output
cargo test -- --nocapture

# Run specific test function
cargo test test_int256_arithmetic
```

## Test Categories

### 1. Unit Tests (`types_test.rs`)

Tests for fundamental types and operations:

- **H160/H256**: Address and hash types
- **Int256**: Big integer arithmetic
- **ByteString**: String operations
- **Array/Map**: Collection types
- **PublicKey**: Cryptographic keys
- **Any**: Type conversions

Example:
```rust
#[test]
fn test_int256_arithmetic() {
    let a = Int256::from(100);
    let b = Int256::from(50);
    
    let sum = a.checked_add(&b).unwrap();
    assert_eq!(sum, Int256::from(150));
}
```

### 2. Native Contract Tests (`native_contracts_test.rs`)

Integration tests for Atipicial native contracts:

- **ATC/GAS**: Token operations
- **Oracle**: External data requests
- **Policy**: Network policies
- **CryptoLib**: Cryptographic operations
- **StdLib Extended**: Utility functions
- **Contract Management**: Deployment/updates
- **Role Management**: Network roles
- **ATC Governance**: Voting and consensus

Example:
```rust
#[test]
fn test_atipicial_governance_operations() {
    let pubkey = PublicKey::from_bytes(&[0x02; 33]);
    let registered = AtipicialGovernance::register_candidate(pubkey);
    
    let candidates = AtipicialGovernance::get_candidates();
    assert_eq!(candidates.length(), 0); // Mock returns empty
}
```

### 3. AEP Standards Tests (`aep_standards_test.rs`)

Tests for Atipicial Enhancement Proposals:

- **AEP-17**: Fungible token standard
- **AEP-11**: Non-fungible token standard
- **AEP-24**: NFT royalty standard
- **AEP-26**: NFT transfer callbacks
- **AEP-27**: Token transfer callbacks

Example:
```rust
#[test]
fn test_aep24_royalty_standard() {
    let sale_price = Int256::from(1_000_000);
    let royalty_bps = 250u16; // 2.5%
    
    let royalty = AEP24Implementation::calculate_royalty(sale_price, royalty_bps);
    assert_eq!(royalty, Int256::from(25_000));
}
```

### 4. Storage & Runtime Tests (`storage_runtime_test.rs`)

Tests for blockchain services:

- **Storage**: Key-value persistence
- **StorageMap**: Prefixed storage
- **Iterator**: Storage enumeration
- **Runtime**: Execution context
- **Notifications**: Event system
- **Witness**: Authorization

Example:
```rust
#[test]
fn test_storage_find_operations() {
    let context = Storage::get_context();
    
    // Store items with prefix
    for i in 0..10 {
        let key = ByteString::from_literal("item:")
            .concat(&ByteString::from(i.to_string().as_bytes()));
        Storage::put(context.clone(), key, Int256::from(i).into_any());
    }
    
    // Find with prefix
    let iter = Storage::find(context, ByteString::from_literal("item:"), FindOptions::default());
}
```

### 5. End-to-End Tests (`end_to_end_test.rs`)

Complete workflow scenarios:

- **Token Launch**: Full AEP-17 deployment
- **NFT Collection**: Complete AEP-11 lifecycle
- **Oracle Integration**: Data request/response
- **Governance**: Voting workflow
- **Multi-sig**: Shared account control
- **DeFi Protocol**: Complex interactions

Example:
```rust
#[test]
fn test_complete_aep17_workflow() {
    let helper = AEP17TestHelper::new();
    
    // Initialize token
    helper.set_total_supply(Int256::from(1_000_000_000));
    
    // Distribute tokens
    helper.set_balance(treasury, Int256::from(500_000_000));
    
    // Test transfers
    assert!(helper.transfer(treasury, user1, Int256::from(1_000_000)));
}
```

## Test Utilities (`test_utils.rs`)

### Data Generators
```rust
// Generate test addresses
let addr = TestDataGenerator::address(1);

// Generate test public keys
let pubkey = TestDataGenerator::public_key(2);

// Generate test collections
let array = TestDataGenerator::int_array(10);
```

### Storage Helpers
```rust
let helper = StorageTestHelper::new();
helper.store_with_prefix("user:", 100);
helper.clear_with_prefix("temp:");
```

### Token Helpers
```rust
// AEP-17 Helper
let token = AEP17TestHelper::new();
token.set_balance(account, Int256::from(1000));
token.transfer(from, to, amount);

// AEP-11 Helper
let nft = AEP11TestHelper::new();
nft.mint(token_id, owner);
nft.transfer(from, to, token_id);
```

### Test Scenarios
```rust
let mut scenario = TestScenario::new("DeFi Protocol");
scenario.add_step(|| { /* deploy */ true });
scenario.add_step(|| { /* add liquidity */ true });
scenario.add_step(|| { /* perform swap */ true });
scenario.run();
```

## Mocking Behavior

Tests run in a mocked environment where:

- Storage operations use in-memory storage
- Native contract calls return default values
- Iterator operations are simulated
- External calls (oracle, etc.) are mocked

## Best Practices

1. **Test Isolation**: Each test should be independent
2. **Clear Assertions**: Use descriptive assert messages
3. **Edge Cases**: Test boundary conditions
4. **Error Paths**: Test failure scenarios
5. **Documentation**: Comment complex test logic

## Common Patterns

### Testing Events
```rust
emit!(TransferEvent {
    from: sender,
    to: receiver,
    amount: value,
});

assert_event_emitted!("Transfer");
```

### Testing Storage
```rust
let context = Storage::get_context();
Storage::put(context, key, value);
assert_storage_equals!(key, expected_value);
```

### Testing Transfers
```rust
let success = atipicial::transfer(from, to, amount);
assert!(success);
assert_balance!(to, expected_balance);
```

## Continuous Integration

Tests are automatically run on:
- Every push to main branch
- All pull requests
- Nightly builds

GitHub Actions workflow ensures all tests pass before merging.

## Contributing

When adding new features:
1. Write unit tests for new types
2. Add integration tests for new functionality
3. Create end-to-end tests for workflows
4. Update this documentation

## Test Coverage

Current coverage areas:
- ✅ Core types and operations
- ✅ All native contracts
- ✅ AEP-17/11/24/26/27 standards
- ✅ Storage and runtime services
- ✅ Oracle integration
- ✅ Governance operations
- ✅ Multi-signature accounts
- ✅ BLS12-381 cryptography
- ✅ Contract lifecycle

## Known Limitations

- Iterator mocking doesn't support actual iteration
- Some native contract responses are mocked
- Transaction signatures cannot be verified in tests
- Block time advancement is simulated

## Future Improvements

- [ ] Integration with Atipicial Express for real testing
- [ ] Property-based testing with quickcheck
- [ ] Fuzzing for security testing
- [ ] Performance benchmarks
- [ ] Code coverage reporting

---

> **Atipicial Chain** — sovereign Layer-1 for smart contracts and digital assets.
> 👑 Founded & engineered by **xmoohad** — Blockchain Scientist · Computer Programmer.
> `ATC` Atipicial Coin · `ATD` AtipicialDollar · addresses begin with **A**
