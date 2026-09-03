#!/bin/bash

# Compile all DeFi contracts and convert to AEF format

set -e

echo "🚀 Compiling all DeFi contracts..."
echo "================================="

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# List of contracts
CONTRACTS=(
    "test-tokens"
    "uniswap-v2-amm"
    "compound-lending"
    "aave-flashloan"
)

# Compile each contract
for CONTRACT in "${CONTRACTS[@]}"; do
    echo -e "\n${YELLOW}Compiling $CONTRACT...${NC}"
    
    # Build WASM
    cd examples/defi/$CONTRACT
    
    if cargo build --target wasm32-unknown-unknown --release; then
        echo -e "${GREEN}✓ $CONTRACT compiled successfully${NC}"
        
        # Get WASM file path
        cd ../../..
        WASM_FILE="target/wasm32-unknown-unknown/release/${CONTRACT//-/_}.wasm"
        
        # Convert to AEF
        if [ -f "$WASM_FILE" ]; then
            echo "Converting to AEF format..."
            python3 scripts/compile_to_aef.py "$WASM_FILE"
            
            # Verify AEF and manifest
            AEF_FILE="target/wasm32-unknown-unknown/release/${CONTRACT//-/_}.aef"
            MANIFEST_FILE="target/wasm32-unknown-unknown/release/${CONTRACT//-/_}.manifest.json"
            
            if [ -f "$AEF_FILE" ] && [ -f "$MANIFEST_FILE" ]; then
                echo -e "${GREEN}✓ AEF and manifest generated${NC}"
                python3 scripts/verify_aef_manifest.py "$AEF_FILE" "$MANIFEST_FILE" > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✓ AEF and manifest verified${NC}"
                else
                    echo -e "${RED}✗ Verification failed${NC}"
                fi
            else
                echo -e "${RED}✗ AEF generation failed${NC}"
            fi
        else
            echo -e "${RED}✗ WASM file not found${NC}"
        fi
    else
        echo -e "${RED}✗ $CONTRACT compilation failed${NC}"
    fi
done

echo -e "\n${GREEN}=================================${NC}"
echo -e "${GREEN}✅ DeFi contracts compilation complete!${NC}"
echo -e "${GREEN}=================================${NC}"

# List generated files
echo -e "\n${YELLOW}Generated AEF files:${NC}"
ls -la target/wasm32-unknown-unknown/release/*.aef 2>/dev/null || echo "No AEF files found"

echo -e "\n${YELLOW}Generated manifest files:${NC}"
ls -la target/wasm32-unknown-unknown/release/*.manifest.json 2>/dev/null || echo "No manifest files found"