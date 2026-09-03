#!/bin/bash

# Working Atipicial Express deployment using existing wallets

echo "🚀 Atipicial Working Deployment Test"
echo "================================="

export PATH="$PATH:$HOME/.dotnet/tools"

echo "📦 Resetting and starting Atipicial Express..."
~/.dotnet/tools/atipicialxp reset --force
~/.dotnet/tools/atipicialxp run --seconds-per-block 1 &
ATC_EXPRESS_PID=$!

sleep 15

echo "💰 Checking wallet info..."
~/.dotnet/tools/atipicialxp wallet list

echo ""
echo "💰 Checking genesis wallet balance..."
~/.dotnet/tools/atipicialxp show balance ATC genesis || echo "ATC balance check failed"
~/.dotnet/tools/atipicialxp show balance GAS genesis || echo "GAS balance check failed"

echo ""
echo "📋 Attempting deployment with genesis account..."

# Try to deploy with password=""
echo "" | timeout 30 ~/.dotnet/tools/atipicialxp contract deploy build/examples/01-hello-world/hello_world_example.aef genesis --password "" 2>&1 || echo "Deploy with empty password failed"

echo ""
echo "📋 Attempting deployment without password flag..."
timeout 30 ~/.dotnet/tools/atipicialxp contract deploy build/examples/01-hello-world/hello_world_example.aef genesis --force 2>&1 || echo "Deploy without password failed"

echo ""
echo "📋 Final contract list..."
~/.dotnet/tools/atipicialxp contract list

# Cleanup
kill $ATC_EXPRESS_PID 2>/dev/null || true