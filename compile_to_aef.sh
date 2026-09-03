#!/bin/bash

echo "🔄 Compiling all WASM files to AEF format..."

for wasm in /home/atipicial/git/atipicial-contract-rs/target/wasm32-unknown-unknown/release/deps/*.wasm; do
    if [ -f "$wasm" ]; then
        name=$(basename "$wasm" .wasm)
        echo "✓ Compiling $name to AEF..."
        cargo run -p atipicial-compiler -- compile "$wasm" -o "build/$name" > /dev/null 2>&1
        if [ -f "build/$name/$name.aef" ]; then
            echo "  ✅ Success: build/$name/"
        else
            echo "  ❌ Failed: $name"
        fi
    fi
done

echo ""
echo "📊 Summary:"
aef_count=$(find build -name "*.aef" -type f | wc -l)
echo "  Total AEF files: $aef_count"
echo "  Total WASM files: $(ls /home/atipicial/git/atipicial-contract-rs/target/wasm32-unknown-unknown/release/deps/*.wasm | wc -l)"