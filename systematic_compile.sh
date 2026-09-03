#!/bin/bash

# Atipicial Smart Contract Examples - Systematic Compilation Script
# Builds all 27 examples to WASM and AEF format with comprehensive error tracking

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Counters
TOTAL_EXAMPLES=0
WASM_SUCCESS=0
WASM_FAILED=0
AEF_SUCCESS=0
AEF_FAILED=0

# Result tracking
WASM_SUCCESSES=()
WASM_FAILURES=()
AEF_SUCCESSES=()
AEF_FAILURES=()

# Output directory
BUILD_DIR="/home/atipicial/git/atipicial-contract-rs/build/examples"
mkdir -p "$BUILD_DIR"

# Results log
RESULTS_FILE="$BUILD_DIR/compilation_results.txt"
echo "Atipicial Smart Contract Compilation Results - $(date)" > "$RESULTS_FILE"
echo "======================================================" >> "$RESULTS_FILE"

log_result() {
    echo "$1" | tee -a "$RESULTS_FILE"
}

# All examples with their package names (extracted from Cargo.toml files)
EXAMPLES=(
    "01-hello-world:hello-world-example"
    "01-hello-world-solana-style:hello-world-solana-style"
    "01-hello-world-solana-style-simple:hello-world-solana-simple"
    "02-simple-storage:simple-storage"
    "02-simple-token:simple-token"
    "03-counter:counter"
    "04-aep17-token:aep17-token"
    "04-aep17-token-solana-style:aep17-token-solana-style"
    "05-aep11-nft:aep11-nft"
    "06-aep24-royalty-nft:aep24-royalty-nft"
    "07-crowdfunding:crowdfunding"
    "08-staking:staking"
    "09-simple-dex:simple-dex"
    "10-multisig-wallet:multisig-wallet"
    "11-governance:governance"
    "12-oracle-price-feed:oracle-price-feed"
    "13-nft-marketplace:nft-marketplace"
    "14-atipicial-features-showcase:atipicial-features-showcase"
    "15-atipicial-complete-features:atipicial-complete-features"
    "defi/aave-flashloan:aave-flashloan"
    "defi/compound-lending:compound-lending"
    "defi/real-aave-flash:real-aave-flash"
    "defi/real-compound-lending:real-compound-lending"
    "defi/real-aep17-token:real-aep17-token"
    "defi/real-uniswap-amm:real-uniswap-amm"
    "defi/test-tokens:test-tokens"
    "defi/uniswap-v2-amm:uniswap-v2-amm"
)

TOTAL_EXAMPLES=${#EXAMPLES[@]}

echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        Atipicial Compilation Suite         ║${NC}"
echo -e "${BLUE}║    Building ${TOTAL_EXAMPLES} Smart Contract Examples    ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
echo ""

# Phase 1: Build all WASM files using workspace compilation
echo -e "${YELLOW}Phase 1: Building WASM files for all examples${NC}"
echo "────────────────────────────────────────────────────"

for example_info in "${EXAMPLES[@]}"; do
    IFS=':' read -r example_path package_name <<< "$example_info"
    
    echo -e "${BLUE}Building: $example_path (package: $package_name)${NC}"
    
    # Try to build the package using workspace compilation
    if cargo build -p "$package_name" --target wasm32-unknown-unknown --release --quiet 2>/dev/null; then
        # Check if WASM file exists
        wasm_file="/home/atipicial/git/atipicial-contract-rs/target/wasm32-unknown-unknown/release/${package_name//-/_}.wasm"
        
        if [[ -f "$wasm_file" ]]; then
            wasm_size=$(stat -c%s "$wasm_file")
            echo -e "  ${GREEN}✅ WASM build successful (${wasm_size} bytes)${NC}"
            WASM_SUCCESSES+=("$example_path:$package_name")
            ((WASM_SUCCESS++))
            log_result "✅ $example_path: WASM build successful (${wasm_size} bytes)"
            
            # Copy to build directory with standardized name
            cp "$wasm_file" "$BUILD_DIR/${example_path//\//_}.wasm"
        else
            echo -e "  ${RED}❌ WASM file not found after build${NC}"
            WASM_FAILURES+=("$example_path")
            ((WASM_FAILED++))
            log_result "❌ $example_path: WASM file not found after build"
        fi
    else
        echo -e "  ${RED}❌ WASM build failed${NC}"
        WASM_FAILURES+=("$example_path")
        ((WASM_FAILED++))
        log_result "❌ $example_path: WASM build failed"
    fi
    echo ""
done

# Phase 2: Build AEF files from successful WASM builds
echo -e "${YELLOW}Phase 2: Building AEF files from successful WASM builds${NC}"
echo "──────────────────────────────────────────────────────────"

for success_info in "${WASM_SUCCESSES[@]}"; do
    IFS=':' read -r example_path package_name <<< "$success_info"
    wasm_file="$BUILD_DIR/${example_path//\//_}.wasm"
    
    echo -e "${BLUE}Building AEF: $example_path${NC}"
    
    if [[ -f "$wasm_file" ]]; then
        cd "$BUILD_DIR"
        
        # Compile to AEF
        if /home/atipicial/git/atipicial-contract-rs/target/release/atipicial-compiler compile "$wasm_file" --output "${example_path//\//_}" 2>/dev/null; then
            aef_file="${example_path//\//_}.aef"
            
            if [[ -f "$aef_file" ]]; then
                aef_size=$(stat -c%s "$aef_file")
                echo -e "  ${GREEN}✅ AEF build successful (${aef_size} bytes)${NC}"
                AEF_SUCCESSES+=("$example_path")
                ((AEF_SUCCESS++))
                log_result "✅ $example_path: AEF build successful (${aef_size} bytes)"
                
                # Verify AEF file
                if /home/atipicial/git/atipicial-contract-rs/target/release/atipicial-compiler verify "$aef_file" 2>/dev/null; then
                    echo -e "  ${GREEN}✅ AEF verification passed${NC}"
                    log_result "✅ $example_path: AEF verification passed"
                else
                    echo -e "  ${YELLOW}⚠️  AEF verification failed${NC}"
                    log_result "⚠️ $example_path: AEF verification failed"
                fi
            else
                echo -e "  ${RED}❌ AEF file not created${NC}"
                AEF_FAILURES+=("$example_path")
                ((AEF_FAILED++))
                log_result "❌ $example_path: AEF file not created"
            fi
        else
            echo -e "  ${RED}❌ AEF compilation failed${NC}"
            AEF_FAILURES+=("$example_path")
            ((AEF_FAILED++))
            log_result "❌ $example_path: AEF compilation failed"
        fi
        
        cd - > /dev/null
    fi
    echo ""
done

# Generate final report
echo "" >> "$RESULTS_FILE"
log_result "════════════════════════════════════════════════════"
log_result "FINAL COMPILATION SUMMARY"
log_result "════════════════════════════════════════════════════"
log_result "Total Examples: $TOTAL_EXAMPLES"
log_result ""
log_result "WASM Compilation Results:"
log_result "  ✅ Successful: $WASM_SUCCESS"
log_result "  ❌ Failed: $WASM_FAILED"
log_result "  📊 Success Rate: $(echo "scale=1; $WASM_SUCCESS * 100 / $TOTAL_EXAMPLES" | bc -l)%"
log_result ""
log_result "AEF Compilation Results:"
log_result "  ✅ Successful: $AEF_SUCCESS"
log_result "  ❌ Failed: $AEF_FAILED"
if [[ $WASM_SUCCESS -gt 0 ]]; then
    log_result "  📊 Success Rate: $(echo "scale=1; $AEF_SUCCESS * 100 / $WASM_SUCCESS" | bc -l)% (of successful WASM builds)"
else
    log_result "  📊 Success Rate: 0% (no successful WASM builds)"
fi
log_result ""

# List successful builds
if [[ ${#WASM_SUCCESSES[@]} -gt 0 ]]; then
    log_result "WASM Build Successes:"
    for success in "${WASM_SUCCESSES[@]}"; do
        IFS=':' read -r example_path package_name <<< "$success"
        log_result "  ✅ $example_path"
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

# List failures
if [[ ${#WASM_FAILURES[@]} -gt 0 ]]; then
    log_result "WASM Build Failures:"
    for failure in "${WASM_FAILURES[@]}"; do
        log_result "  ❌ $failure"
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

# Console summary
echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                    FINAL SUMMARY                        ║${NC}"
echo -e "${BLUE}╠══════════════════════════════════════════════════════════╣${NC}"
echo -e "${BLUE}║${NC} Total Examples: ${YELLOW}$TOTAL_EXAMPLES${NC}${BLUE}                                      ║${NC}"
echo -e "${BLUE}║${NC} WASM Success: ${GREEN}$WASM_SUCCESS${NC} ${BLUE}|${NC} Failed: ${RED}$WASM_FAILED${NC}${BLUE}                           ║${NC}"
echo -e "${BLUE}║${NC} AEF Success: ${GREEN}$AEF_SUCCESS${NC} ${BLUE}|${NC} Failed: ${RED}$AEF_FAILED${NC}${BLUE}                            ║${NC}"
echo -e "${BLUE}║${NC} Overall Success Rate: ${YELLOW}$(echo "scale=1; $AEF_SUCCESS * 100 / $TOTAL_EXAMPLES" | bc -l)%${NC}${BLUE}                        ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "📊 Detailed results: ${BLUE}$RESULTS_FILE${NC}"
echo -e "📁 Built files: ${BLUE}$BUILD_DIR${NC}"

# List output files
echo -e "\n${YELLOW}Generated Files:${NC}"
echo "──────────────────"
if ls "$BUILD_DIR"/*.wasm >/dev/null 2>&1; then
    echo -e "${GREEN}WASM files:${NC}"
    ls -1 "$BUILD_DIR"/*.wasm | sed 's|.*/||' | while read file; do echo "  📄 $file"; done
fi

if ls "$BUILD_DIR"/*.aef >/dev/null 2>&1; then
    echo -e "${GREEN}AEF files:${NC}"
    ls -1 "$BUILD_DIR"/*.aef | sed 's|.*/||' | while read file; do echo "  📄 $file"; done
fi

if ls "$BUILD_DIR"/*.manifest.json >/dev/null 2>&1; then
    echo -e "${GREEN}Manifest files:${NC}"
    ls -1 "$BUILD_DIR"/*.manifest.json | sed 's|.*/||' | while read file; do echo "  📄 $file"; done
fi