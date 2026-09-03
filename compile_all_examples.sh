#!/bin/bash

# Atipicial Smart Contract Examples Compilation Script
# Systematically builds all 27 examples to WASM and AEF format

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
TOTAL_EXAMPLES=0
WASM_SUCCESS=0
WASM_FAILED=0
AEF_SUCCESS=0
AEF_FAILED=0

# Arrays to track results
WASM_SUCCESSES=()
WASM_FAILURES=()
AEF_SUCCESSES=()
AEF_FAILURES=()
BUILD_ERRORS=()

# Create build output directory
BUILD_DIR="/home/atipicial/git/atipicial-contract-rs/build/examples"
mkdir -p "$BUILD_DIR"

# Results file
RESULTS_FILE="$BUILD_DIR/compilation_results.txt"
echo "Atipicial Smart Contract Compilation Results" > "$RESULTS_FILE"
echo "=========================================" >> "$RESULTS_FILE"
echo "Timestamp: $(date)" >> "$RESULTS_FILE"
echo "" >> "$RESULTS_FILE"

# Function to log results
log_result() {
    echo "$1" | tee -a "$RESULTS_FILE"
}

# Function to build WASM
build_wasm() {
    local example_dir="$1"
    local example_name=$(basename "$example_dir")
    
    echo -e "${BLUE}Building WASM for: $example_name${NC}"
    
    cd "$example_dir"
    
    # Attempt WASM build
    if cargo build --target wasm32-unknown-unknown --release 2>&1; then
        echo -e "${GREEN}✅ WASM build successful: $example_name${NC}"
        WASM_SUCCESSES+=("$example_name")
        ((WASM_SUCCESS++))
        
        # Get WASM file info
        local wasm_file="target/wasm32-unknown-unknown/release/${example_name//-/_}.wasm"
        if [[ -f "$wasm_file" ]]; then
            local wasm_size=$(stat -c%s "$wasm_file" 2>/dev/null || echo "unknown")
            log_result "✅ $example_name: WASM build successful (${wasm_size} bytes)"
            
            # Copy WASM to build directory
            cp "$wasm_file" "$BUILD_DIR/${example_name}.wasm" 2>/dev/null || true
            return 0
        else
            log_result "⚠️  $example_name: WASM build reported success but file not found"
            return 1
        fi
    else
        echo -e "${RED}❌ WASM build failed: $example_name${NC}"
        WASM_FAILURES+=("$example_name")
        ((WASM_FAILED++))
        
        # Capture error
        local error_output=$(cargo build --target wasm32-unknown-unknown --release 2>&1 || true)
        BUILD_ERRORS+=("$example_name: $error_output")
        log_result "❌ $example_name: WASM build failed"
        return 1
    fi
}

# Function to build AEF
build_aef() {
    local example_name="$1"
    local wasm_file="$BUILD_DIR/${example_name}.wasm"
    
    if [[ ! -f "$wasm_file" ]]; then
        echo -e "${YELLOW}⚠️  Skipping AEF build for $example_name (no WASM file)${NC}"
        return 1
    fi
    
    echo -e "${BLUE}Building AEF for: $example_name${NC}"
    
    cd "$BUILD_DIR"
    
    # Attempt AEF compilation
    if /home/atipicial/git/atipicial-contract-rs/target/release/atipicial-compiler compile "$wasm_file" 2>&1; then
        echo -e "${GREEN}✅ AEF build successful: $example_name${NC}"
        AEF_SUCCESSES+=("$example_name")
        ((AEF_SUCCESS++))
        
        # Get AEF file info
        local aef_file="${example_name}.aef"
        if [[ -f "$aef_file" ]]; then
            local aef_size=$(stat -c%s "$aef_file" 2>/dev/null || echo "unknown")
            log_result "✅ $example_name: AEF build successful (${aef_size} bytes)"
            
            # Verify AEF file
            if /home/atipicial/git/atipicial-contract-rs/target/release/atipicial-compiler verify "$aef_file" 2>&1; then
                log_result "✅ $example_name: AEF verification successful"
            else
                log_result "⚠️  $example_name: AEF verification failed"
            fi
            return 0
        else
            log_result "⚠️  $example_name: AEF build reported success but file not found"
            return 1
        fi
    else
        echo -e "${RED}❌ AEF build failed: $example_name${NC}"
        AEF_FAILURES+=("$example_name")
        ((AEF_FAILED++))
        
        # Capture error
        local error_output=$(/home/atipicial/git/atipicial-contract-rs/target/release/atipicial-compiler compile "$wasm_file" 2>&1 || true)
        log_result "❌ $example_name: AEF build failed - $error_output"
        return 1
    fi
}

# Main compilation loop
echo -e "${BLUE}Starting compilation of all Atipicial smart contract examples...${NC}"
echo ""

# List of all example directories
EXAMPLES=(
    "/home/atipicial/git/atipicial-contract-rs/examples/01-hello-world"
    "/home/atipicial/git/atipicial-contract-rs/examples/01-hello-world-solana-style"
    "/home/atipicial/git/atipicial-contract-rs/examples/01-hello-world-solana-style-simple"
    "/home/atipicial/git/atipicial-contract-rs/examples/02-simple-storage"
    "/home/atipicial/git/atipicial-contract-rs/examples/02-simple-token"
    "/home/atipicial/git/atipicial-contract-rs/examples/03-counter"
    "/home/atipicial/git/atipicial-contract-rs/examples/04-aep17-token"
    "/home/atipicial/git/atipicial-contract-rs/examples/04-aep17-token-solana-style"
    "/home/atipicial/git/atipicial-contract-rs/examples/05-aep11-nft"
    "/home/atipicial/git/atipicial-contract-rs/examples/06-aep24-royalty-nft"
    "/home/atipicial/git/atipicial-contract-rs/examples/07-crowdfunding"
    "/home/atipicial/git/atipicial-contract-rs/examples/08-staking"
    "/home/atipicial/git/atipicial-contract-rs/examples/09-simple-dex"
    "/home/atipicial/git/atipicial-contract-rs/examples/10-multisig-wallet"
    "/home/atipicial/git/atipicial-contract-rs/examples/11-governance"
    "/home/atipicial/git/atipicial-contract-rs/examples/12-oracle-price-feed"
    "/home/atipicial/git/atipicial-contract-rs/examples/13-nft-marketplace"
    "/home/atipicial/git/atipicial-contract-rs/examples/14-atipicial-features-showcase"
    "/home/atipicial/git/atipicial-contract-rs/examples/15-atipicial-complete-features"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/aave-flashloan"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/compound-lending"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/real-aave-flash"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/real-compound-lending"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/real-aep17-token"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/real-uniswap-amm"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/test-tokens"
    "/home/atipicial/git/atipicial-contract-rs/examples/defi/uniswap-v2-amm"
)

TOTAL_EXAMPLES=${#EXAMPLES[@]}

# Phase 1: Build all WASM files
echo -e "${YELLOW}Phase 1: Building WASM files for all examples${NC}"
echo ""

for example_dir in "${EXAMPLES[@]}"; do
    if [[ -d "$example_dir" ]]; then
        build_wasm "$example_dir"
    else
        echo -e "${RED}⚠️  Example directory not found: $example_dir${NC}"
    fi
    echo ""
done

# Phase 2: Build AEF files for successful WASM builds
echo -e "${YELLOW}Phase 2: Building AEF files for successful WASM builds${NC}"
echo ""

for example_name in "${WASM_SUCCESSES[@]}"; do
    build_aef "$example_name"
    echo ""
done

# Generate final report
echo "" >> "$RESULTS_FILE"
log_result "==============================================="
log_result "COMPILATION SUMMARY"
log_result "==============================================="
log_result "Total Examples: $TOTAL_EXAMPLES"
log_result ""
log_result "WASM Compilation:"
log_result "  Successful: $WASM_SUCCESS"
log_result "  Failed: $WASM_FAILED"
log_result "  Success Rate: $(echo "scale=1; $WASM_SUCCESS * 100 / $TOTAL_EXAMPLES" | bc -l)%"
log_result ""
log_result "AEF Compilation:"
log_result "  Successful: $AEF_SUCCESS"
log_result "  Failed: $AEF_FAILED"
log_result "  Success Rate: $(echo "scale=1; $AEF_SUCCESS * 100 / $WASM_SUCCESS" | bc -l)% (of successful WASM builds)"
log_result ""

if [[ ${#WASM_SUCCESSES[@]} -gt 0 ]]; then
    log_result "WASM Build Successes:"
    for success in "${WASM_SUCCESSES[@]}"; do
        log_result "  ✅ $success"
    done
    log_result ""
fi

if [[ ${#WASM_FAILURES[@]} -gt 0 ]]; then
    log_result "WASM Build Failures:"
    for failure in "${WASM_FAILURES[@]}"; do
        log_result "  ❌ $failure"
    done
    log_result ""
fi

if [[ ${#AEF_SUCCESSES[@]} -gt 0 ]]; then
    log_result "AEF Build Successes:"
    for success in "${AEF_SUCCESSES[@]}"; do
        log_result "  ✅ $success"
    done
    log_result ""
fi

if [[ ${#AEF_FAILURES[@]} -gt 0 ]]; then
    log_result "AEF Build Failures:"
    for failure in "${AEF_FAILURES[@]}"; do
        log_result "  ❌ $failure"
    done
    log_result ""
fi

# Final summary
echo -e "${BLUE}===============================================${NC}"
echo -e "${BLUE}FINAL COMPILATION SUMMARY${NC}"
echo -e "${BLUE}===============================================${NC}"
echo -e "Total Examples: ${YELLOW}$TOTAL_EXAMPLES${NC}"
echo -e "WASM Success: ${GREEN}$WASM_SUCCESS${NC} | Failed: ${RED}$WASM_FAILED${NC}"
echo -e "AEF Success: ${GREEN}$AEF_SUCCESS${NC} | Failed: ${RED}$AEF_FAILED${NC}"
echo -e "Overall Success Rate: ${YELLOW}$(echo "scale=1; $AEF_SUCCESS * 100 / $TOTAL_EXAMPLES" | bc -l)%${NC}"
echo ""
echo -e "Detailed results saved to: ${BLUE}$RESULTS_FILE${NC}"
echo -e "Built files available in: ${BLUE}$BUILD_DIR${NC}"