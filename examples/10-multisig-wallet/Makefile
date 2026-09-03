# Atipicial Rust Smart Contract Makefile
# Unified build system using integrated atipicial-compiler

# Project Configuration
PROJECT_NAME := $(shell basename $(CURDIR))
CARGO_TARGET := wasm32-unknown-unknown
BUILD_MODE := release

# Directories and Files
TARGET_DIR := ../../target/$(CARGO_TARGET)/$(BUILD_MODE)
BUILD_DIR := build
WASM_NAME := $(shell grep '^name = ' Cargo.toml | cut -d'"' -f2 | tr '-' '_')
WASM_FILE := $(TARGET_DIR)/$(WASM_NAME).wasm
AEF_FILE := $(BUILD_DIR)/$(PROJECT_NAME).aef
MANIFEST_FILE := $(BUILD_DIR)/$(PROJECT_NAME).manifest.json

# Tools
CARGO := cargo
ATC_COMPILER := cd ../.. && cargo run -p atipicial-compiler --
RUSTUP := rustup

# Build flags
RUSTFLAGS := -Ctarget-feature=+multivalue -Clink-arg=--initial-memory=2097152
CARGO_FLAGS := --target $(CARGO_TARGET) --$(BUILD_MODE)

# Colors
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[1;33m
BLUE := \033[0;34m
NC := \033[0m

.PHONY: all build compile deploy clean check test help install-deps info

# Default target
all: compile

# Help
help:
	@echo "$(BLUE)Atipicial Rust Smart Contract Build System$(NC)"
	@echo "$(YELLOW)Available targets:$(NC)"
	@echo "  $(GREEN)all$(NC)          - Build and compile to AEF (default)"
	@echo "  $(GREEN)build$(NC)        - Build WASM file"
	@echo "  $(GREEN)compile$(NC)      - Compile WASM to AEF and manifest"
	@echo "  $(GREEN)deploy$(NC)       - Deploy to Atipicial Express"
	@echo "  $(GREEN)clean$(NC)        - Clean build artifacts"
	@echo "  $(GREEN)check$(NC)        - Check code for errors"
	@echo "  $(GREEN)test$(NC)         - Run tests"
	@echo "  $(GREEN)install-deps$(NC) - Install dependencies"
	@echo "  $(GREEN)info$(NC)         - Show build information"

# Install dependencies
install-deps:
	@echo "$(YELLOW)Installing dependencies...$(NC)"
	@$(RUSTUP) target add $(CARGO_TARGET)
	@echo "$(GREEN)Dependencies installed!$(NC)"

# Check code
check:
	@echo "$(YELLOW)Checking $(PROJECT_NAME)...$(NC)"
	@RUSTFLAGS="$(RUSTFLAGS)" $(CARGO) check $(CARGO_FLAGS)
	@echo "$(GREEN)✅ Check completed!$(NC)"

# Run tests
test:
	@echo "$(YELLOW)Running tests for $(PROJECT_NAME)...$(NC)"
	@$(CARGO) test
	@echo "$(GREEN)✅ Tests completed!$(NC)"

# Build WASM
build:
	@echo "$(YELLOW)Building $(PROJECT_NAME) to WASM...$(NC)"
	@$(RUSTUP) target add $(CARGO_TARGET) 2>/dev/null || true
	@RUSTFLAGS="$(RUSTFLAGS)" $(CARGO) build $(CARGO_FLAGS)
	@echo "$(GREEN)✅ Build completed: $(WASM_FILE)$(NC)"

# Compile to AEF
compile: build
	@mkdir -p $(BUILD_DIR)
	@echo "$(YELLOW)Compiling to AEF format...$(NC)"
	@if [ ! -f "$(WASM_FILE)" ]; then \
		echo "$(RED)❌ WASM file not found: $(WASM_FILE)$(NC)"; \
		echo "$(YELLOW)Looking for WASM files...$(NC)"; \
		find $(TARGET_DIR) -name "*.wasm" -type f 2>/dev/null || true; \
		exit 1; \
	fi
	@$(ATC_COMPILER) compile examples/$(PROJECT_NAME)/$(WASM_FILE) --output examples/$(PROJECT_NAME)/$(BUILD_DIR)
	@echo "$(GREEN)✅ AEF generated: $(AEF_FILE)$(NC)"
	@echo "$(GREEN)✅ Manifest generated: $(MANIFEST_FILE)$(NC)"

# Deploy to Atipicial Express
deploy: compile
	@echo "$(YELLOW)Deploying $(PROJECT_NAME) to Atipicial Express...$(NC)"
	@if command -v atipicialxp > /dev/null 2>&1; then \
		if [ -f "$(AEF_FILE)" ] && [ -f "$(MANIFEST_FILE)" ]; then \
			echo "$(YELLOW)Starting Atipicial Express if not running...$(NC)"; \
			pgrep -f "atipicial-express" > /dev/null || (atipicialxp run -s 1 > /tmp/atipicialxp.log 2>&1 &); \
			sleep 3; \
			echo "$(YELLOW)Deploying contract...$(NC)"; \
			atipicialxp contract deploy $(AEF_FILE) alice || true; \
			echo "$(GREEN)✅ Deployment complete!$(NC)"; \
		else \
			echo "$(RED)❌ AEF or manifest file not found!$(NC)"; \
			exit 1; \
		fi \
	else \
		echo "$(RED)❌ Atipicial Express not installed!$(NC)"; \
		echo "Install with: dotnet tool install Atipicial.Express -g"; \
		exit 1; \
	fi

# Clean
clean:
	@echo "$(YELLOW)Cleaning $(PROJECT_NAME)...$(NC)"
	@$(CARGO) clean
	@rm -rf $(BUILD_DIR)
	@echo "$(GREEN)✅ Clean completed!$(NC)"

# Info
info:
	@echo "$(BLUE)Build Information$(NC)"
	@echo "  Project: $(PROJECT_NAME)"
	@echo "  Target: $(CARGO_TARGET)"
	@echo "  Mode: $(BUILD_MODE)"
	@echo "  WASM Name: $(WASM_NAME)"
	@echo "  WASM: $(WASM_FILE)"
	@echo "  AEF: $(AEF_FILE)"
	@echo "  Manifest: $(MANIFEST_FILE)"