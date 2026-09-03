#!/bin/bash

echo "🔍 Analyzing remaining failed examples..."

failed_examples=(
    "05-aep11-nft"
    "06-aep24-royalty-nft" 
    "07-crowdfunding"
    "08-staking"
    "14-atipicial-features-showcase"
    "15-atipicial-complete-features"
)

for example in "${failed_examples[@]}"; do
    echo ""
    echo "📋 Analyzing $example:"
    cd "/home/atipicial/git/atipicial-contract-rs/examples/$example"
    
    error_count=$(timeout 30 cargo check --target wasm32-unknown-unknown 2>&1 | grep -c "error\[" || echo "0")
    echo "  Error count: $error_count"
    
    # Get first few error types
    echo "  Main errors:"
    timeout 30 cargo check --target wasm32-unknown-unknown 2>&1 | grep "error\[E" | head -3 | sed 's/^/    /'
    
    cd - > /dev/null
done

echo ""
echo "🎯 Priority Order (lowest errors first):"