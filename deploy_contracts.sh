#!/bin/bash

# Atipicial Rust Framework - Contract Deployment Script
# Deploys all compiled contracts to Atipicial Express local blockchain

set -e

echo "🚀 Atipicial Rust Framework - Contract Deployment"
echo "=============================================="

# Set up environment
export PATH="$PATH:$HOME/.dotnet/tools"
ATC_EXPRESS="~/.dotnet/tools/atipicialxp"

echo "📦 Starting Atipicial Express blockchain..."
# Start Atipicial Express in background
$ATC_EXPRESS run --seconds-per-block 1 > atipicial-express.log 2>&1 &
ATC_EXPRESS_PID=$!

# Wait for blockchain to start
echo "⏳ Waiting for blockchain to initialize..."
sleep 10

# Function to deploy a contract
deploy_contract() {
    local contract_path=$1
    local contract_name=$2
    
    echo "📋 Deploying $contract_name..."
    
    # Extract directory and find AEF and manifest files
    local aef_file="$contract_path.aef"
    local manifest_file="$contract_path.manifest.json"
    
    if [ ! -f "$aef_file" ] || [ ! -f "$manifest_file" ]; then
        echo "  ❌ Files not found: $aef_file or $manifest_file"
        return 1
    fi
    
    echo "  📄 AEF: $aef_file"
    echo "  📄 Manifest: $manifest_file"
    
    # Deploy the contract
    if $ATC_EXPRESS contract deploy "$aef_file" "$manifest_file" owen; then
        echo "  ✅ Deployment successful"
        
        # Get the contract hash
        CONTRACT_HASH=$($ATC_EXPRESS contract get "$contract_name" 2>/dev/null | grep "Contract Hash" | awk '{print $3}' || echo "unknown")
        echo "  🏷️  Contract Hash: $CONTRACT_HASH"
        
        # Store deployment info
        echo "$contract_name,$CONTRACT_HASH,$aef_file,$manifest_file" >> deployed_contracts.csv
        
        return 0
    else
        echo "  ❌ Deployment failed"
        return 1
    fi
}

# Function to invoke a contract method
invoke_contract() {
    local contract_hash=$1
    local method_name=$2
    local params=$3
    
    echo "🔧 Invoking $contract_hash.$method_name($params)"
    
    if [ -z "$params" ]; then
        $ATC_EXPRESS contract invoke "$contract_hash" "$method_name" owen
    else
        $ATC_EXPRESS contract invoke "$contract_hash" "$method_name" $params owen
    fi
}

# Initialize deployment log
echo "contract_name,contract_hash,aef_file,manifest_file" > deployed_contracts.csv

# Counter for statistics
total_deployments=0
successful_deployments=0

echo ""
echo "🚀 Deploying Contracts..."
echo "========================="

# Deploy contracts
contracts=(
    "build/examples/01-hello-world/hello_world_example:HelloWorld"
    "build/examples/04-aep17-token/aep17_token:AEP17Token"
    "build/examples/defi/real-aep17-token/real_aep17_token:RealAEP17"
    "build/examples/defi/real-uniswap-amm/real_uniswap_amm:UniswapAMM"
    "build/examples/defi/real-compound-lending/real_compound_lending:CompoundLending"
    "build/examples/defi/real-aave-flash/real_aave_flash:AaveFlash"
)

for contract_info in "${contracts[@]}"; do
    IFS=':' read -r contract_path contract_name <<< "$contract_info"
    total_deployments=$((total_deployments + 1))
    
    if deploy_contract "$contract_path" "$contract_name"; then
        successful_deployments=$((successful_deployments + 1))
    fi
    echo ""
done

echo "📊 Deployment Results:"
echo "======================"
echo "Total contracts: $total_deployments"
echo "Successful: $successful_deployments"
echo "Failed: $((total_deployments - successful_deployments))"

if [ $successful_deployments -gt 0 ]; then
    echo ""
    echo "🧪 Testing Contract Invocations..."
    echo "=================================="
    
    # Test some basic contract calls
    echo "📋 Deployed contracts:"
    cat deployed_contracts.csv
    
    echo ""
    echo "🔧 Sample contract invocations:"
    
    # Example invocations (will be customized based on deployed contracts)
    # invoke_contract "0x..." "symbol" ""
    # invoke_contract "0x..." "decimals" ""
    # invoke_contract "0x..." "totalSupply" ""
fi

# Cleanup function
cleanup() {
    echo ""
    echo "🧹 Cleaning up..."
    if [ ! -z "$ATC_EXPRESS_PID" ]; then
        echo "  🛑 Stopping Atipicial Express (PID: $ATC_EXPRESS_PID)"
        kill $ATC_EXPRESS_PID 2>/dev/null || true
    fi
    
    echo "📄 Atipicial Express log saved to: atipicial-express.log"
    echo "📄 Deployment results saved to: deployed_contracts.csv"
}

# Set trap for cleanup
trap cleanup EXIT

echo ""
echo "💡 Atipicial Express is running. Press Ctrl+C to stop and cleanup."
echo "   Check atipicial-express.log for blockchain logs"
echo "   Check deployed_contracts.csv for deployment results"

# Keep script running to maintain blockchain
wait $ATC_EXPRESS_PID