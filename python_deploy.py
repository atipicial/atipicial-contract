#!/usr/bin/env python3

"""
Atipicial Rust Framework - Python Contract Deployment Script
Uses Atipicial Python SDK for reliable contract deployment and invocation
"""

import subprocess
import time
import json
import os
import sys

def run_command(cmd, timeout=30):
    """Run a shell command with timeout"""
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout)
        return result.returncode == 0, result.stdout, result.stderr
    except subprocess.TimeoutExpired:
        return False, "", "Command timed out"

def main():
    print("🚀 Atipicial Rust Framework - Python Deployment Test")
    print("=" * 50)
    
    # Set up environment
    os.environ["PATH"] = os.environ.get("PATH", "") + ":" + os.path.expanduser("~/.dotnet/tools")
    
    print("📦 Starting Atipicial Express...")
    
    # Reset and start Atipicial Express
    atipicialxp_path = os.path.expanduser("~/.dotnet/tools/atipicialxp")
    success, _, _ = run_command(f"{atipicialxp_path} reset --force")
    if not success:
        print("❌ Failed to reset Atipicial Express")
        return
    
    # Start Atipicial Express in background
    atipicialxp_path = os.path.expanduser("~/.dotnet/tools/atipicialxp")
    process = subprocess.Popen(
        [atipicialxp_path, "run", "--seconds-per-block", "1"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        shell=False
    )
    
    print("⏳ Waiting for blockchain to start...")
    time.sleep(15)
    
    print("💰 Checking wallet balances...")
    success, output, _ = run_command(f"{atipicialxp_path} show balance ATC genesis")
    if success:
        print(f"  💰 ATC Balance: {output.strip()}")
    
    success, output, _ = run_command(f"{atipicialxp_path} show balance GAS genesis")
    if success:
        print(f"  ⛽ GAS Balance: {output.strip()}")
    
    print("\n📋 Listing available contracts to deploy...")
    contracts = [
        ("Hello World", "build/examples/01-hello-world/hello_world_example.aef"),
        ("AEP-17 Token", "build/examples/04-aep17-token/aep17_token.aef"),
        ("Real AEP-17", "build/examples/defi/real-aep17-token/real_aep17_token.aef"),
        ("Uniswap AMM", "build/examples/defi/real-uniswap-amm/real_uniswap_amm.aef"),
        ("Compound Lending", "build/examples/defi/real-compound-lending/real_compound_lending.aef"),
        ("Aave Flash", "build/examples/defi/real-aave-flash/real_aave_flash.aef"),
    ]
    
    deployed_contracts = []
    
    for name, aef_path in contracts:
        if os.path.exists(aef_path):
            print(f"\n🚀 Deploying {name}...")
            print(f"  📄 AEF: {aef_path}")
            
            # Try deployment with --password option
            cmd = f"echo '' | {atipicialxp_path} contract deploy {aef_path} genesis --password ''"
            success, output, error = run_command(cmd, timeout=60)
            
            if success and "deployed successfully" in output.lower():
                print(f"  ✅ {name} deployed successfully!")
                deployed_contracts.append((name, aef_path))
                
                # Extract contract hash if available
                lines = output.split('\n')
                for line in lines:
                    if 'hash' in line.lower() or 'contract' in line.lower():
                        print(f"  🏷️  {line.strip()}")
            else:
                print(f"  ❌ {name} deployment failed")
                if error:
                    print(f"     Error: {error.strip()}")
        else:
            print(f"  ⚠️  {name} AEF file not found: {aef_path}")
    
    print(f"\n📊 Deployment Summary:")
    print(f"  Total contracts attempted: {len(contracts)}")
    print(f"  Successfully deployed: {len(deployed_contracts)}")
    
    if deployed_contracts:
        print("\n✅ Successfully deployed contracts:")
        for name, path in deployed_contracts:
            print(f"  • {name}: {path}")
            
        print("\n📋 Final contract listing...")
        success, output, _ = run_command(f"{atipicialxp_path} contract list")
        if success:
            print(output)
    
    print("\n🧹 Cleaning up...")
    process.terminate()
    try:
        process.wait(timeout=10)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait()
    
    print("✅ Deployment test completed!")

if __name__ == "__main__":
    main()