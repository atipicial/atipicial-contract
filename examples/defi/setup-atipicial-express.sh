#!/bin/bash

# Setup Atipicial Express for DeFi Testing
echo "Setting up Atipicial Express for DeFi contract testing..."

# Check if atipicial-express is installed
if ! command -v atipicial-express &> /dev/null; then
    echo "Installing Atipicial Express..."
    dotnet tool install Atipicial.Express -g
fi

# Create Atipicial Express instance
echo "Creating Atipicial Express blockchain instance..."
atipicial-express create defi-testnet -f

# Start Atipicial Express
echo "Starting Atipicial Express..."
atipicial-express run -i defi-testnet.atipicial-express -s 1 &
ATC_EXPRESS_PID=$!

# Wait for Atipicial Express to start
sleep 5

# Create test wallets
echo "Creating test wallets..."
atipicial-express wallet create alice -i defi-testnet.atipicial-express
atipicial-express wallet create bob -i defi-testnet.atipicial-express
atipicial-express wallet create charlie -i defi-testnet.atipicial-express
atipicial-express wallet create defi-deployer -i defi-testnet.atipicial-express

# Transfer ATC and GAS to wallets
echo "Transferring ATC and GAS to test wallets..."
atipicial-express transfer 1000 ATC genesis alice -i defi-testnet.atipicial-express
atipicial-express transfer 1000 GAS genesis alice -i defi-testnet.atipicial-express
atipicial-express transfer 1000 ATC genesis bob -i defi-testnet.atipicial-express
atipicial-express transfer 1000 GAS genesis bob -i defi-testnet.atipicial-express
atipicial-express transfer 1000 ATC genesis charlie -i defi-testnet.atipicial-express
atipicial-express transfer 1000 GAS genesis charlie -i defi-testnet.atipicial-express
atipicial-express transfer 10000 ATC genesis defi-deployer -i defi-testnet.atipicial-express
atipicial-express transfer 10000 GAS genesis defi-deployer -i defi-testnet.atipicial-express

echo "Atipicial Express setup complete!"
echo "Atipicial Express PID: $ATC_EXPRESS_PID"
echo ""
echo "Wallets created:"
echo "  - alice"
echo "  - bob"
echo "  - charlie"
echo "  - defi-deployer"
echo ""
echo "To stop Atipicial Express: kill $ATC_EXPRESS_PID"