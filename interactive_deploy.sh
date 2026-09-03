#!/bin/bash

# Interactive Atipicial Express deployment
echo "🚀 Atipicial Interactive Deployment Test"
echo "====================================="

export PATH="$PATH:$HOME/.dotnet/tools"

echo "📦 Resetting and starting Atipicial Express..."
~/.dotnet/tools/atipicialxp reset --force
~/.dotnet/tools/atipicialxp run --seconds-per-block 1 &
ATC_EXPRESS_PID=$!

sleep 15

echo "💰 Checking wallet info..."
~/.dotnet/tools/atipicialxp wallet list

echo ""
echo "💰 Trying balance with empty password..."
echo "" | ~/.dotnet/tools/atipicialxp show balance GAS owner || echo "Balance check failed"

echo ""
echo "📋 Deploying Hello World with empty password..."
echo "" | ~/.dotnet/tools/atipicialxp contract deploy build/examples/01-hello-world/hello_world_example.aef owner || echo "Deployment failed"

echo ""
echo "📋 Contract list after deployment attempt..."
~/.dotnet/tools/atipicialxp contract list

# Cleanup
kill $ATC_EXPRESS_PID 2>/dev/null || true