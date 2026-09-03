# Atipicial Rust Smart Contract Framework Makefile
# Root makefile for building and deploying all examples

# Configuration
CARGO := cargo
RUSTUP := rustup
ATC_COMPILER := ./target/release/atipicial-compiler
EXAMPLES := $(wildcard examples/*/Cargo.toml)
EXAMPLE_DIRS := $(dir $(EXAMPLES))

# Colors
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[1;33m
BLUE := \033[0;34m
NC := \033[0m

.PHONY: all help install build test clean deploy atipicial-express examples docs

# Default target
all: build

# Help
help:
	@echo "$(BLUE)Atipicial Rust Smart Contract Framework$(NC)"
	@echo "$(YELLOW)Available targets:$(NC)"
	@echo "  $(GREEN)all$(NC)           - Build everything (default)"
	@echo "  $(GREEN)install$(NC)       - Install dependencies and tools"
	@echo "  $(GREEN)build$(NC)         - Build framework and compiler"
	@echo "  $(GREEN)examples$(NC)      - Build all examples"
	@echo "  $(GREEN)test$(NC)          - Run all tests"
	@echo "  $(GREEN)deploy$(NC)        - Deploy all examples to Atipicial Express"
	@echo "  $(GREEN)atipicial-express$(NC)   - Setup and start Atipicial Express"
	@echo "  $(GREEN)clean$(NC)         - Clean all build artifacts"
	@echo "  $(GREEN)docs$(NC)          - Generate documentation"
	@echo "  $(GREEN)fmt$(NC)           - Format all code"
	@echo "  $(GREEN)clippy$(NC)        - Run clippy lints"
	@echo "  $(GREEN)audit$(NC)         - Run security audit"

# Install dependencies
install:
	@echo "$(YELLOW)Installing dependencies...$(NC)"
	@$(RUSTUP) target add wasm32-unknown-unknown
	@$(RUSTUP) component add rustfmt clippy
	@command -v atipicialxp >/dev/null 2>&1 || echo "$(YELLOW)Atipicial Express not installed. Install with: dotnet tool install Atipicial.Express -g$(NC)"
	@echo "$(GREEN)✅ Dependencies installed$(NC)"

# Build framework and compiler
build: install
	@echo "$(YELLOW)Building atipicial-contract framework...$(NC)"
	@$(CARGO) build --release --all-features
	@echo "$(GREEN)✅ Framework built$(NC)"
	@echo "$(YELLOW)Building atipicial-compiler...$(NC)"
	@$(CARGO) build -p atipicial-compiler --release
	@echo "$(GREEN)✅ Compiler built$(NC)"

# Build all examples
examples: build
	@echo "$(YELLOW)Building all examples...$(NC)"
	@for dir in $(EXAMPLE_DIRS); do \
		echo "$(BLUE)Building $$(basename $$dir)...$(NC)"; \
		(cd $$dir && $(CARGO) build --target wasm32-unknown-unknown --release) || exit 1; \
	done
	@echo "$(GREEN)✅ All examples built$(NC)"

# Compile examples to AEF
compile-aef: examples
	@echo "$(YELLOW)Compiling examples to AEF...$(NC)"
	@for dir in $(EXAMPLE_DIRS); do \
		echo "$(BLUE)Compiling $$(basename $$dir) to AEF...$(NC)"; \
		(cd $$dir && make compile) || true; \
	done
	@echo "$(GREEN)✅ AEF compilation complete$(NC)"

# Run all tests
test:
	@echo "$(YELLOW)Running tests...$(NC)"
	@$(CARGO) test --all-features --verbose
	@echo "$(GREEN)✅ Tests passed$(NC)"

# Deploy all examples
deploy: compile-aef
	@echo "$(YELLOW)Deploying all examples...$(NC)"
	@./scripts/deploy-examples.sh
	@echo "$(GREEN)✅ Deployment complete$(NC)"

# Setup and start Atipicial Express
atipicial-express:
	@echo "$(YELLOW)Setting up Atipicial Express...$(NC)"
	@command -v atipicialxp >/dev/null 2>&1 || (echo "$(RED)❌ Atipicial Express not installed$(NC)" && exit 1)
	@atipicialxp create -f || true
	@atipicialxp wallet create alice -f || true
	@atipicialxp wallet create bob -f || true
	@echo "$(YELLOW)Starting Atipicial Express...$(NC)"
	@atipicialxp run -s 1

# Generate documentation
docs:
	@echo "$(YELLOW)Generating documentation...$(NC)"
	@$(CARGO) doc --all-features --no-deps --open
	@echo "$(GREEN)✅ Documentation generated$(NC)"

# Format code
fmt:
	@echo "$(YELLOW)Formatting code...$(NC)"
	@$(CARGO) fmt --all
	@echo "$(GREEN)✅ Code formatted$(NC)"

# Run clippy
clippy:
	@echo "$(YELLOW)Running clippy...$(NC)"
	@$(CARGO) clippy --all-features -- -D warnings
	@echo "$(GREEN)✅ Clippy checks passed$(NC)"

# Security audit
audit:
	@echo "$(YELLOW)Running security audit...$(NC)"
	@$(CARGO) audit || true
	@echo "$(GREEN)✅ Audit complete$(NC)"

# Clean build artifacts
clean:
	@echo "$(YELLOW)Cleaning build artifacts...$(NC)"
	@$(CARGO) clean
	@for dir in $(EXAMPLE_DIRS); do \
		rm -rf $$dir/build; \
	done
	@rm -rf build/
	@echo "$(GREEN)✅ Clean complete$(NC)"

# Quick build and test
quick: fmt build test
	@echo "$(GREEN)✅ Quick build and test complete$(NC)"

# Full CI pipeline
ci: fmt clippy build test examples compile-aef
	@echo "$(GREEN)✅ CI pipeline complete$(NC)"

# Deploy single example
deploy-example:
	@if [ -z "$(EXAMPLE)" ]; then \
		echo "$(RED)❌ Please specify EXAMPLE=<example-name>$(NC)"; \
		exit 1; \
	fi
	@echo "$(YELLOW)Deploying $(EXAMPLE)...$(NC)"
	@cd examples/$(EXAMPLE) && make deploy
	@echo "$(GREEN)✅ $(EXAMPLE) deployed$(NC)"

# Test single example
test-example:
	@if [ -z "$(EXAMPLE)" ]; then \
		echo "$(RED)❌ Please specify EXAMPLE=<example-name>$(NC)"; \
		exit 1; \
	fi
	@echo "$(YELLOW)Testing $(EXAMPLE)...$(NC)"
	@cd examples/$(EXAMPLE) && cargo test
	@echo "$(GREEN)✅ $(EXAMPLE) tests passed$(NC)"

# Show project info
info:
	@echo "$(BLUE)Atipicial Rust Smart Contract Framework$(NC)"
	@echo "Version: $$(grep version atipicial-contract/Cargo.toml | head -1 | cut -d'"' -f2)"
	@echo "Examples: $$(ls -d examples/*/ | wc -l)"
	@echo "Rust version: $$(rustc --version)"
	@echo "Target: wasm32-unknown-unknown"
	@echo "Atipicial Express: $$(atipicialxp --version 2>/dev/null || echo 'not installed')"
