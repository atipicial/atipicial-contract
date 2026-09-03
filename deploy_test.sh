#!/bin/bash

# Atipicial Express contract deployment and testing

set -e

echo "🚀 Atipicial Rust Framework - Full Deployment & Testing"
echo "===================================================="

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
~/.dotnet/tools/atipicialxp show balance owner GAS || echo "Balance check failed"
~/.dotnet/tools/atipicialxp show balance owner ATC || echo "ATC balance check failed"

echo ""
echo "📋 Deploying Hello World contract..."
CONTRACT_AEF="build/examples/01-hello-world/hello_world_example.aef"

if [ -f "$CONTRACT_AEF" ]; then
    echo "  📄 AEF: $CONTRACT_AEF"
    
    # Deploy the contract
    echo "🚀 Deploying contract..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$CONTRACT_AEF" owner; then
        echo "✅ Hello World contract deployed successfully!"
        
        # Show deployed contracts
        echo "📋 Listing deployed contracts..."
        ~/.dotnet/tools/atipicialxp contract list
        
    else
        echo "❌ Contract deployment failed"
    fi
else
    echo "❌ Contract files not found: $CONTRACT_AEF"
fi

echo ""
echo "📋 Deploying AEP-17 Token contract..."
TOKEN_AEF="build/examples/04-aep17-token/aep17_token.aef"

if [ -f "$TOKEN_AEF" ]; then
    echo "  📄 AEF: $TOKEN_AEF"
    
    # Deploy the contract
    echo "🚀 Deploying AEP-17 token..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$TOKEN_AEF" owner; then
        echo "✅ AEP-17 Token deployed successfully!"
        
        # List all contracts
        echo "📋 Listing all deployed contracts..."
        ~/.dotnet/tools/atipicialxp contract list
        
        echo ""
        echo "🔧 Testing contract invocations..."
        
        # Get contract hash for invocations
        echo "📋 Getting contract information..."
        ~/.dotnet/tools/atipicialxp contract list --json > contracts.json || echo "Failed to get contract list"
        
        if [ -f "contracts.json" ]; then
            echo "📄 Contract information saved to contracts.json"
            cat contracts.json
        fi
        
    else
        echo "❌ AEP-17 Token deployment failed"
    fi
else
    echo "❌ Token files not found: $TOKEN_AEF"
fi

echo ""
echo "📋 Deploying Real DeFi contracts..."

# Deploy Real AEP-17 Token
REAL_TOKEN_AEF="build/examples/defi/real-aep17-token/real_aep17_token.aef"
if [ -f "$REAL_TOKEN_AEF" ]; then
    echo "🚀 Deploying Real AEP-17 Token..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$REAL_TOKEN_AEF" owner; then
        echo "✅ Real AEP-17 Token deployed successfully!"
    else
        echo "❌ Real AEP-17 Token deployment failed"
    fi
fi

# Deploy Uniswap AMM
UNISWAP_AEF="build/examples/defi/real-uniswap-amm/real_uniswap_amm.aef"
if [ -f "$UNISWAP_AEF" ]; then
    echo "🚀 Deploying Uniswap AMM..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$UNISWAP_AEF" owner; then
        echo "✅ Uniswap AMM deployed successfully!"
    else
        echo "❌ Uniswap AMM deployment failed"
    fi
fi

# Deploy Compound Lending
COMPOUND_AEF="build/examples/defi/real-compound-lending/real_compound_lending.aef"
if [ -f "$COMPOUND_AEF" ]; then
    echo "🚀 Deploying Compound Lending..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$COMPOUND_AEF" owner; then
        echo "✅ Compound Lending deployed successfully!"
    else
        echo "❌ Compound Lending deployment failed"
    fi
fi

# Deploy Aave Flash Loans
AAVE_AEF="build/examples/defi/real-aave-flash/real_aave_flash.aef"
if [ -f "$AAVE_AEF" ]; then
    echo "🚀 Deploying Aave Flash Loans..."
    if ~/.dotnet/tools/atipicialxp contract deploy "$AAVE_AEF" owner; then
        echo "✅ Aave Flash Loans deployed successfully!"
    else
        echo "❌ Aave Flash Loans deployment failed"
    fi
fi

echo ""
echo "📊 Final contract listing..."
~/.dotnet/tools/atipicialxp contract list

echo ""
echo "💰 Final balance check..."
~/.dotnet/tools/atipicialxp show balance owner GAS || echo "Balance check failed"

# Cleanup function
cleanup() {
    echo ""
    echo "🧹 Cleaning up..."
    if [ ! -z "$ATC_EXPRESS_PID" ]; then
        echo "  🛑 Stopping Atipicial Express (PID: $ATC_EXPRESS_PID)"
        kill $ATC_EXPRESS_PID 2>/dev/null || true
        sleep 2
    fi
    
    echo "📄 Atipicial Express log (last 30 lines):"
    echo "===================================="
    tail -30 atipicial-express.log 2>/dev/null || echo "No log file found"
    
    echo ""
    echo "📄 Files generated:"
    echo "==================="
    ls -la *.json *.log 2>/dev/null || echo "No additional files generated"
}

# Set trap for cleanup
trap cleanup EXIT

echo ""
echo "✅ Deployment test completed! Check the output above for results."
echo "   📄 Atipicial Express blockchain log: atipicial-express.log"
echo "   📄 Contract information: contracts.json (if generated)"

sleep 10

cleanup