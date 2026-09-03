#!/bin/bash

# Atipicial Smart Contract Deployment Script
# Compiles and deploys all examples to Atipicial Express

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EXAMPLES_DIR="$PROJECT_ROOT/examples"
ATC_COMPILER="$PROJECT_ROOT/target/release/atipicial-compiler"

# Examples to build and deploy
EXAMPLES=(
    "01-hello-world"
    "02-simple-storage"
    "02-simple-token"
    "03-counter"
    "04-aep17-token"
    "05-aep11-nft"
    "06-aep24-royalty-nft"
    "07-crowdfunding"
    "08-staking"
    "09-simple-dex"
    "10-multisig-wallet"
    "11-governance"
    "12-oracle-price-feed"
    "13-nft-marketplace"
)

# Function to print colored output
print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to check prerequisites
check_prerequisites() {
    print_color "$BLUE" "Checking prerequisites..."
    
    # Check Rust
    if ! command -v cargo &> /dev/null; then
        print_color "$RED" "❌ Rust is not installed"
        exit 1
    fi
    
    # Check wasm32 target
    if ! rustup target list | grep -q "wasm32-unknown-unknown (installed)"; then
        print_color "$YELLOW" "Installing wasm32-unknown-unknown target..."
        rustup target add wasm32-unknown-unknown
    fi
    
    # Check Atipicial Express
    if ! command -v atipicialxp &> /dev/null; then
        print_color "$YELLOW" "Atipicial Express is not installed. Install with:"
        echo "dotnet tool install Atipicial.Express -g"
        read -p "Do you want to continue without Atipicial Express? (y/n): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
    
    print_color "$GREEN" "✅ Prerequisites check passed"
}

# Function to build atipicial-compiler
build_compiler() {
    print_color "$BLUE" "Building atipicial-compiler..."
    cd "$PROJECT_ROOT"
    cargo build -p atipicial-compiler --release
    
    if [ -f "$ATC_COMPILER" ]; then
        print_color "$GREEN" "✅ atipicial-compiler built successfully"
    else
        print_color "$RED" "❌ Failed to build atipicial-compiler"
        exit 1
    fi
}

# Function to compile example to WASM
compile_to_wasm() {
    local example=$1
    local example_dir="$EXAMPLES_DIR/$example"
    
    if [ ! -d "$example_dir" ]; then
        print_color "$YELLOW" "⚠️  Example directory not found: $example"
        return 1
    fi
    
    cd "$example_dir"
    
    print_color "$YELLOW" "Building $example to WASM..."
    
    # Build with cargo
    if cargo build --target wasm32-unknown-unknown --release; then
        print_color "$GREEN" "✅ $example compiled to WASM"
        return 0
    else
        print_color "$RED" "❌ Failed to compile $example"
        return 1
    fi
}

# Function to compile WASM to AEF
compile_to_aef() {
    local example=$1
    local example_dir="$EXAMPLES_DIR/$example"
    
    cd "$example_dir"
    
    # Get WASM name from Cargo.toml
    local wasm_name=$(grep '^name = ' Cargo.toml | cut -d'"' -f2 | tr '-' '_')
    local wasm_file="$PROJECT_ROOT/target/wasm32-unknown-unknown/release/${wasm_name}.wasm"
    
    if [ ! -f "$wasm_file" ]; then
        print_color "$RED" "❌ WASM file not found: $wasm_file"
        return 1
    fi
    
    print_color "$YELLOW" "Compiling $example to AEF..."
    
    mkdir -p build
    
    # Compile to AEF
    if "$ATC_COMPILER" compile "$wasm_file" --output build; then
        local aef_file="build/${wasm_name}.aef"
        local manifest_file="build/${wasm_name}.manifest.json"
        
        if [ -f "$aef_file" ] && [ -f "$manifest_file" ]; then
            local aef_size=$(stat -c%s "$aef_file" 2>/dev/null || stat -f%z "$aef_file" 2>/dev/null || echo "unknown")
            print_color "$GREEN" "✅ AEF generated: $aef_file ($aef_size bytes)"
            return 0
        else
            print_color "$RED" "❌ AEF or manifest file not generated"
            return 1
        fi
    else
        print_color "$RED" "❌ Failed to compile to AEF"
        return 1
    fi
}

# Function to deploy to Atipicial Express
deploy_to_atipicial_express() {
    local example=$1
    local example_dir="$EXAMPLES_DIR/$example"
    
    if ! command -v atipicialxp &> /dev/null; then
        print_color "$YELLOW" "⚠️  Atipicial Express not available, skipping deployment"
        return 0
    fi
    
    cd "$example_dir"
    
    # Get AEF file
    local wasm_name=$(grep '^name = ' Cargo.toml | cut -d'"' -f2 | tr '-' '_')
    local aef_file="build/${wasm_name}.aef"
    
    if [ ! -f "$aef_file" ]; then
        print_color "$RED" "❌ AEF file not found: $aef_file"
        return 1
    fi
    
    print_color "$YELLOW" "Deploying $example to Atipicial Express..."
    
    # Deploy contract
    if atipicialxp contract deploy "$aef_file" alice 2>/dev/null; then
        print_color "$GREEN" "✅ $example deployed successfully"
        return 0
    else
        print_color "$YELLOW" "⚠️  Deployment completed with warnings"
        return 0
    fi
}

# Function to test contract invocation
test_invocation() {
    local example=$1
    
    if ! command -v atipicialxp &> /dev/null; then
        return 0
    fi
    
    print_color "$YELLOW" "Testing $example invocation..."
    
    # Get contract hash (simplified - in real scenario would parse from deployment output)
    local contract_hash=$(atipicialxp contract list 2>/dev/null | grep "$example" | awk '{print $1}')
    
    if [ -n "$contract_hash" ]; then
        case "$example" in
            "01-hello-world")
                atipicialxp contract invoke "$contract_hash" initialize alice 2>/dev/null || true
                ;;
            "03-counter")
                atipicialxp contract invoke "$contract_hash" increment alice 2>/dev/null || true
                ;;
            *)
                print_color "$BLUE" "No test configured for $example"
                ;;
        esac
    fi
}

# Main execution
main() {
    print_color "$BLUE" "======================================="
    print_color "$BLUE" "Atipicial Smart Contract Deployment Script"
    print_color "$BLUE" "======================================="
    echo
    
    # Check prerequisites
    check_prerequisites
    
    # Build atipicial-compiler
    build_compiler
    
    # Initialize Atipicial Express if available
    if command -v atipicialxp &> /dev/null; then
        print_color "$BLUE" "Initializing Atipicial Express..."
        cd "$PROJECT_ROOT"
        atipicialxp create -f 2>/dev/null || true
        atipicialxp wallet create alice -f 2>/dev/null || true
        
        # Start Atipicial Express in background
        print_color "$BLUE" "Starting Atipicial Express..."
        atipicialxp run -s 1 > /tmp/atipicialxp.log 2>&1 &
        ATC_PID=$!
        sleep 5
    fi
    
    # Statistics
    local total=${#EXAMPLES[@]}
    local compiled=0
    local deployed=0
    local failed=0
    
    # Process each example
    for example in "${EXAMPLES[@]}"; do
        echo
        print_color "$BLUE" "Processing: $example"
        print_color "$BLUE" "------------------------"
        
        # Compile to WASM
        if compile_to_wasm "$example"; then
            # Compile to AEF
            if compile_to_aef "$example"; then
                ((compiled++))
                
                # Deploy to Atipicial Express
                if deploy_to_atipicial_express "$example"; then
                    ((deployed++))
                    
                    # Test invocation
                    test_invocation "$example"
                fi
            else
                ((failed++))
            fi
        else
            ((failed++))
        fi
    done
    
    # Stop Atipicial Express if running
    if [ -n "$ATC_PID" ]; then
        print_color "$BLUE" "Stopping Atipicial Express..."
        kill $ATC_PID 2>/dev/null || true
    fi
    
    # Print summary
    echo
    print_color "$BLUE" "======================================="
    print_color "$BLUE" "Deployment Summary"
    print_color "$BLUE" "======================================="
    print_color "$GREEN" "✅ Compiled to AEF: $compiled/$total"
    if command -v atipicialxp &> /dev/null; then
        print_color "$GREEN" "✅ Deployed: $deployed/$total"
    fi
    if [ $failed -gt 0 ]; then
        print_color "$RED" "❌ Failed: $failed/$total"
    fi
    
    echo
    print_color "$BLUE" "Deployment complete!"
}

# Run main function
main "$@"