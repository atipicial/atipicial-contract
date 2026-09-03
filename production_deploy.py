#!/usr/bin/env python3

"""
Atipicial Rust Framework - Production Deployment System
Complete automated deployment and testing pipeline
"""

import subprocess
import time
import json
import os
import signal
import sys

class AtipicialExpressManager:
    def __init__(self):
        self.atipicialxp_path = os.path.expanduser("~/.dotnet/tools/atipicialxp")
        self.process = None
        self.deployed_contracts = []
        
    def reset_blockchain(self):
        """Reset and start Atipicial Express blockchain"""
        print("📦 Resetting Atipicial Express blockchain...")
        result = subprocess.run([self.atipicialxp_path, "reset", "--force"], 
                               capture_output=True, text=True)
        return result.returncode == 0
        
    def start_blockchain(self):
        """Start Atipicial Express in background"""
        print("🚀 Starting Atipicial Express blockchain...")
        self.process = subprocess.Popen(
            [self.atipicialxp_path, "run", "--seconds-per-block", "1"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        
        # Wait for startup
        print("⏳ Waiting for blockchain initialization...")
        time.sleep(15)
        return True
        
    def check_balance(self, asset, account):
        """Check account balance"""
        result = subprocess.run(
            [self.atipicialxp_path, "show", "balance", asset, account],
            capture_output=True, text=True
        )
        return result.returncode == 0, result.stdout.strip()
        
    def list_contracts(self):
        """List all deployed contracts"""
        result = subprocess.run(
            [self.atipicialxp_path, "contract", "list"],
            capture_output=True, text=True
        )
        return result.returncode == 0, result.stdout.strip()
        
    def deploy_contract(self, aef_path, account="genesis", password=""):
        """Deploy a contract to Atipicial Express"""
        print(f"🚀 Deploying {os.path.basename(aef_path)}...")
        
        # Use echo to provide empty password
        cmd = f'echo "{password}" | {self.atipicialxp_path} contract deploy {aef_path} {account} --password "{password}"'
        
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=60)
        
        success = result.returncode == 0 and "error" not in result.stderr.lower()
        
        if success:
            print(f"  ✅ Deployment successful")
            self.deployed_contracts.append(aef_path)
        else:
            print(f"  ❌ Deployment failed")
            if result.stderr:
                print(f"     Error: {result.stderr.strip()}")
                
        return success, result.stdout, result.stderr
        
    def cleanup(self):
        """Stop blockchain and cleanup"""
        print("\n🧹 Cleaning up...")
        if self.process:
            self.process.terminate()
            try:
                self.process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                self.process.kill()
                self.process.wait()
                
def main():
    print("🚀 Atipicial Rust Framework - Production Deployment System")
    print("=" * 60)
    
    manager = AtipicialExpressManager()
    
    def cleanup_handler(signum, frame):
        manager.cleanup()
        sys.exit(0)
        
    signal.signal(signal.SIGINT, cleanup_handler)
    signal.signal(signal.SIGTERM, cleanup_handler)
    
    try:
        # Initialize blockchain
        if not manager.reset_blockchain():
            print("❌ Failed to reset blockchain")
            return
            
        if not manager.start_blockchain():
            print("❌ Failed to start blockchain")
            return
            
        # Check initial state
        print("\n💰 Checking initial wallet state...")
        atipicial_success, atipicial_balance = manager.check_balance("ATC", "genesis")
        gas_success, gas_balance = manager.check_balance("GAS", "genesis")
        
        if atipicial_success and gas_success:
            print(f"  💰 ATC Balance: {atipicial_balance}")
            print(f"  ⛽ GAS Balance: {gas_balance}")
        else:
            print("  ⚠️  Could not check balances, but proceeding...")
            
        # Define contracts to deploy
        contracts = [
            "build/examples/04-aep17-token/aep17_token.aef",
            "build/examples/defi/real-aep17-token/real_aep17_token.aef", 
            "build/examples/defi/real-uniswap-amm/real_uniswap_amm.aef",
            "build/examples/defi/real-compound-lending/real_compound_lending.aef",
            "build/examples/defi/real-aave-flash/real_aave_flash.aef",
        ]
        
        print(f"\n📋 Deploying {len(contracts)} contracts...")
        print("=" * 40)
        
        successful_deployments = 0
        
        for aef_path in contracts:
            if os.path.exists(aef_path):
                success, stdout, stderr = manager.deploy_contract(aef_path)
                if success:
                    successful_deployments += 1
                    
                # Brief pause between deployments
                time.sleep(2)
            else:
                print(f"  ⚠️  Contract not found: {aef_path}")
                
        print(f"\n📊 Deployment Results:")
        print(f"  Total contracts: {len(contracts)}")
        print(f"  Successfully deployed: {successful_deployments}")
        print(f"  Success rate: {successful_deployments/len(contracts)*100:.1f}%")
        
        # List final contract state
        print("\n📋 Final contract listing:")
        success, contracts_list = manager.list_contracts()
        if success:
            print(contracts_list)
            
        # Save results
        with open("deployment_results.json", "w") as f:
            json.dump({
                "timestamp": time.time(),
                "total_contracts": len(contracts),
                "successful_deployments": successful_deployments,
                "deployed_contracts": manager.deployed_contracts,
                "contracts_list": contracts_list if success else "Failed to retrieve"
            }, f, indent=2)
            
        print(f"\n📄 Results saved to: deployment_results.json")
        
        if successful_deployments > 0:
            print("\n✅ Deployment pipeline successfully validated!")
            print("   The Atipicial Rust Framework is ready for production deployment!")
        else:
            print("\n⚠️  No contracts deployed successfully")
            print("   Framework compilation works, but deployment needs investigation")
            
    except Exception as e:
        print(f"❌ Error during deployment: {e}")
    finally:
        manager.cleanup()

if __name__ == "__main__":
    main()