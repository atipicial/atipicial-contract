<!-- Atipicial Chain · sovereign Layer-1 for smart contracts and digital assets -->
<!-- 👑 Founded & engineered by xmoohad — Blockchain Scientist · Computer Programmer -->

# Atipicial Smart Contracts with Solana-Style Syntax

## 🚀 Overview

This Atipicial Rust framework now supports **Solana-style syntax** alongside the traditional Atipicial syntax, providing developers with a choice of programming paradigms. The Solana-style syntax brings the ergonomic patterns from Solana's Anchor framework to Atipicial, making it easier for Solana developers to build on Atipicial.

## 🎯 Why Solana-Style Syntax?

- **Familiar to Solana Developers**: Use the same mental model and patterns
- **Type-Safe Account Validation**: Compile-time checking of account constraints
- **Explicit Security**: Clear declaration of account requirements and permissions
- **Better Error Handling**: Structured error types with automatic code generation
- **Modern Patterns**: Context-based programming model with clear separation of concerns

## 📚 Quick Comparison

### Traditional Atipicial Style (C-style exports)
```rust
#[no_mangle]
pub extern "C" fn get_greeting() -> ByteString {
    // Manual storage access and validation
    storage::get("greeting").unwrap_or_default()
}

#[no_mangle]
pub extern "C" fn set_greeting(value: ByteString) -> bool {
    // Manual validation and error handling
    if value.is_empty() {
        return false;
    }
    storage::put("greeting", &value);
    true
}
```

### Solana-Style Syntax with Contract Implementation (Primary Pattern)
```rust
#[contract_author("Hello World")]
#[contract_version("1.0.0")]
pub struct HelloWorld {
    greeting: ByteString,
}

#[contract_impl]
impl HelloWorld {
    pub fn init() -> Self {
        Self {
            greeting: ByteString::from_literal("Hello, World!"),
        }
    }
    
    #[method]
    pub fn set_greeting(&mut self, value: ByteString) -> Result<()> {
        require!(!value.is_empty(), ContractError::InvalidArgument);
        self.greeting = value;
        notify!("GreetingChanged", self.greeting.clone());
        Ok(())
    }
    
    #[method]
    #[safe]
    pub fn get_greeting(&self) -> ByteString {
        self.greeting.clone()
    }
}
```

## 🛠️ Key Features

### 1. Contract Implementation Pattern (Primary)
- Use `#[contract_impl]` to define your contract methods
- Structured contract state with type-safe storage
- Automatic method export generation
- Clear separation between public and private methods

### 2. Parameter Validation
- Direct parameter access with Atipicial native types
- Built-in validation macros: `require!`, `require_eq!`, `require_gt!`
- Type-safe method signatures with compile-time checking
- Automatic witness validation integration

### 3. Error Handling
- Result-based error handling with `Result<T>`
- Custom error types that integrate with Atipicial error system
- Rich error messages and automatic error propagation
- Built-in contract error types for common scenarios

### 4. Events and Notifications
- `notify!` macro for Atipicial event emission
- Built-in integration with Atipicial notification system
- Structured event data with automatic serialization

## 📦 Available Examples

### Solana-Style Examples
1. **Hello World** (`examples/01-hello-world-solana-style/`)
   - Basic contract with state management
   - Account validation patterns
   - Event emission

2. **AEP-17 Token** (`examples/04-aep17-token-solana-style/`)
   - Full token implementation
   - Transfer, mint, burn operations
   - Allowance system
   - Freeze/thaw functionality

### Traditional Style Examples
All existing examples in `examples/` directory continue to work with traditional syntax.

## 🚀 Getting Started

### 1. Choose Your Style

Both syntaxes compile to the same Atipicial bytecode and are fully compatible with the Atipicial blockchain.

### 2. Use the Appropriate Macros

**Solana-Style Contract Implementation Macros:**
- `#[contract_impl]` - Define contract implementation methods
- `#[contract_author("...")]` - Contract metadata
- `#[contract_version("...")]` - Contract version
- `#[method]` - Mark public contract methods
- `#[safe]` - Mark read-only methods
- `require!` - Parameter validation macro
- `notify!` - Event emission macro

**Traditional Macros:**
- `#[contract_impl]` - Contract implementation
- `#[method]` - Method exposure
- `#[safe]` - Read-only methods
- Contract metadata attributes

### 3. Build Your Contract

```bash
# For any example
cd examples/01-hello-world-solana-style
make build

# Or use cargo directly
cargo build --target wasm32-unknown-unknown --release
```

## 📖 Documentation

- [Solana-Style Syntax Guide](docs/solana-style-syntax-guide.md) - Comprehensive guide for Solana-style syntax
- [Traditional Syntax Guide](docs/getting-started.md) - Original Atipicial syntax documentation
- [Migration Guide](docs/solana-style-syntax-guide.md#migration-guide) - How to migrate between styles

## 🔄 Interoperability

Both syntax styles:
- Compile to identical Atipicial bytecode
- Are fully compatible with Atipicial tools and infrastructure
- Can interact with each other on-chain
- Support the same Atipicial features (storage, native contracts, etc.)

## 🎯 When to Use Which Style?

### Use Solana-Style When:
- You're coming from Solana development
- You prefer explicit account validation
- You want compile-time security checks
- You like the Context pattern
- You need complex account relationships

### Use Traditional Style When:
- You're familiar with Atipicial patterns
- You prefer simpler, more direct syntax
- You're migrating existing Atipicial contracts
- You want minimal abstraction

## 🤝 Contributing

We welcome contributions for both syntax styles! Please ensure:
- Examples are provided for new features
- Documentation is updated
- Tests pass for both styles
- Code follows the existing patterns

## 📄 License

This framework maintains the same license as the original atipicial-contract-rs project.

## 🙏 Acknowledgments

- Solana's Anchor framework for inspiration
- Atipicial community for feedback and support
- Contributors to both syntax styles

---

**Note**: This is a Atipicial framework with Solana-style syntax support. It compiles to Atipicial bytecode and runs on the Atipicial blockchain. It is not affiliated with Solana Labs or the Solana blockchain.

---

> **Atipicial Chain** — sovereign Layer-1 for smart contracts and digital assets.
> 👑 Founded & engineered by **xmoohad** — Blockchain Scientist · Computer Programmer.
> `ATC` Atipicial Coin · `ATD` AtipicialDollar · addresses begin with **A**
