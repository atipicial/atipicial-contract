#!/bin/bash

echo "🧪 Testing all 27 compiled contracts..."
echo ""

verified_count=0
failed_count=0

for aef_file in build/*/*.aef; do
    if [ -f "$aef_file" ]; then
        contract=$(basename "$(dirname "$aef_file")")
        echo "  Testing $contract..."
        
        if cargo run -p atipicial-compiler -- verify "$aef_file" 2>/dev/null | grep -q "✅ Checksum valid"; then
            echo "    ✅ $contract AEF verified"
            verified_count=$((verified_count + 1))
        else
            echo "    ❌ $contract AEF failed verification"
            failed_count=$((failed_count + 1))
        fi
    fi
done

echo ""
echo "📊 Test Results:"
echo "  ✅ Verified: $verified_count"
echo "  ❌ Failed: $failed_count"
echo "  📈 Success Rate: $(echo "scale=1; $verified_count * 100 / ($verified_count + $failed_count)" | bc)%"

echo ""
echo "🔍 Testing manifest correctness..."
manifest_count=0
for manifest in build/*/*.manifest.json; do
    if [ -f "$manifest" ]; then
        if jq empty "$manifest" 2>/dev/null; then
            manifest_count=$((manifest_count + 1))
        fi
    fi
done

echo "  ✅ Valid manifests: $manifest_count"
echo ""
echo "🎯 Final Status: $([ $verified_count -eq 27 ] && echo "ALL CONTRACTS WORKING" || echo "SOME ISSUES FOUND")"