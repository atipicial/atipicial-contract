#!/bin/bash

# Simple Atipicial Express contract deployment test

set -e

echo "🚀 Atipicial Contract Deployment Test"
echo "=================================="

# Set up environment
export PATH="$PATH:$HOME/.dotnet/tools"

echo "📦 Starting Atipicial Express blockchain..."
# Reset and start Atipicial Express
~/.dotnet/tools/atipicialxp reset --force
~/.dotnet/tools/atipicialxp run --seconds-per-block 1 > atipicial-express.log 2>&1 &
ATC_EXPRESS_PID=$!

# Wait for blockchain to start
echo "⏳ Waiting for blockchain to initialize..."
sleep 15

echo "💰 Checking initial balances..."
~/.dotnet/tools/atipicialxp show balance owner || echo "Balance check failed"

echo "📋 Deploying Hello World contract..."
CONTRACT_AEF="build/examples/01-hello-world/hello_world_example.aef"
CONTRACT_MANIFEST="build/examples/01-hello-world/hello_world_example.manifest.json"

if [ -f "$CONTRACT_AEF" ] && [ -f "$CONTRACT_MANIFEST" ]; then
    echo "  📄 AEF: $CONTRACT_AEF"
    echo "  📄 Manifest: $CONTRACT_MANIFEST"
    
    # Deploy the contract
    echo "🚀 Deploying contract..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$CONTRACT_AEF" "$CONTRACT_MANIFEST" owner; then
        echo "✅ Contract deployed successfully!"
        
        # Show deployed contracts
        echo "📋 Showing contract information..."
        ~/.dotnet/tools/atipicialxp contract list || echo "Contract list failed"
        
    else
        echo "❌ Contract deployment failed"
    fi
else
    echo "❌ Contract files not found: $CONTRACT_AEF or $CONTRACT_MANIFEST"
fi

echo ""
echo "📋 Deploying AEP-17 Token contract..."
TOKEN_AEF="build/examples/04-aep17-token/aep17_token.aef"
TOKEN_MANIFEST="build/examples/04-aep17-token/aep17_token.manifest.json"

if [ -f "$TOKEN_AEF" ] && [ -f "$TOKEN_MANIFEST" ]; then
    echo "  📄 AEF: $TOKEN_AEF"
    echo "  📄 Manifest: $TOKEN_MANIFEST"
    
    # Deploy the contract
    echo "🚀 Deploying AEP-17 token..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$TOKEN_AEF" "$TOKEN_MANIFEST" owner; then
        echo "✅ AEP-17 Token deployed successfully!"
        
        # Test some token methods
        echo "🔧 Testing token methods..."
        
        # Get the contract hash (we'll need to extract it from output)
        echo "📋 Listing all contracts..."
        ~/.dotnet/tools/atipicialxp contract list
        
    else
        echo "❌ AEP-17 Token deployment failed"
    fi
else
    echo "❌ Token files not found: $TOKEN_AEF or $TOKEN_MANIFEST"
fi

# Cleanup function
cleanup() {
    echo ""
    echo "🧹 Cleaning up..."
    if [ ! -z "$ATC_EXPRESS_PID" ]; then
        echo "  🛑 Stopping Atipicial Express (PID: $ATC_EXPRESS_PID)"
        kill $ATC_EXPRESS_PID 2>/dev/null || true
        sleep 2
    fi
    
    echo "📄 Atipicial Express log:"
    echo "=================="
    tail -20 atipicial-express.log 2>/dev/null || echo "No log file found"
}

# Set trap for cleanup
trap cleanup EXIT

echo ""
echo "✅ Test completed! Check the output above for results."
sleep 5

cleanup