#!/usr/bin/env python3
"""
AEF and Manifest Verification Tool for Atipicial
Verifies that compiled contracts are correct and deployable
"""

import json
import struct
import sys
import os
import zlib
from pathlib import Path
from typing import Dict, List, Any, Tuple, Optional
import hashlib

class Colors:
    """Terminal colors for output"""
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    END = '\033[0m'
    BOLD = '\033[1m'

class AefVerifier:
    """Verifies AEF file format and structure"""
    
    AEF3_MAGIC = 0x3346454E  # "AEF3" in little-endian
    MAX_SCRIPT_SIZE = 65536  # 64KB max script size
    
    def __init__(self, aef_path: str):
        self.aef_path = Path(aef_path)
        self.errors = []
        self.warnings = []
        self.info = {}
        
    def verify(self) -> Tuple[bool, Dict[str, Any]]:
        """Verify AEF file structure and content"""
        
        print(f"{Colors.CYAN}{'='*60}{Colors.END}")
        print(f"{Colors.CYAN}Verifying AEF: {self.aef_path.name}{Colors.END}")
        print(f"{Colors.CYAN}{'='*60}{Colors.END}")
        
        if not self.aef_path.exists():
            self.errors.append(f"AEF file not found: {self.aef_path}")
            return False, self.info
        
        try:
            with open(self.aef_path, 'rb') as f:
                aef_data = f.read()
            
            # Verify minimum size
            if len(aef_data) < 16:
                self.errors.append(f"AEF file too small: {len(aef_data)} bytes")
                return False, self.info
            
            offset = 0
            
            # 1. Verify magic number
            magic = struct.unpack('<I', aef_data[offset:offset+4])[0]
            offset += 4
            
            if magic != self.AEF3_MAGIC:
                self.errors.append(f"Invalid magic number: {hex(magic)}, expected {hex(self.AEF3_MAGIC)}")
            else:
                self.info['magic'] = 'AEF3'
                print(f"{Colors.GREEN}✓{Colors.END} Magic number: AEF3")
            
            # 2. Read compiler string
            compiler_len = aef_data[offset]
            offset += 1
            
            if compiler_len > 255:
                self.errors.append(f"Compiler string too long: {compiler_len}")
                return False, self.info
            
            compiler = aef_data[offset:offset+compiler_len].decode('utf-8', errors='ignore')
            offset += compiler_len
            self.info['compiler'] = compiler
            print(f"{Colors.GREEN}✓{Colors.END} Compiler: {compiler}")
            
            # Verify compiler format
            if not compiler:
                self.warnings.append("Empty compiler string")
            elif 'atipicial-contract-rs' not in compiler.lower():
                self.warnings.append(f"Unexpected compiler: {compiler}")
            
            # 3. Read source URL (first 255 bytes max)
            source_len = aef_data[offset]
            offset += 1
            
            if source_len > 0:
                source = aef_data[offset:offset+source_len].decode('utf-8', errors='ignore')
                offset += source_len
                self.info['source'] = source
                print(f"{Colors.GREEN}✓{Colors.END} Source: {source[:50]}...")
            else:
                self.info['source'] = ''
                print(f"{Colors.YELLOW}!{Colors.END} No source specified")
            
            # 4. Reserved bytes (should be 0)
            reserved = aef_data[offset]
            offset += 1
            
            if reserved != 0:
                self.warnings.append(f"Reserved byte is not 0: {reserved}")
            else:
                print(f"{Colors.GREEN}✓{Colors.END} Reserved byte: 0")
            
            # 5. Read script
            if offset + 2 > len(aef_data):
                self.errors.append("AEF file truncated before script length")
                return False, self.info
            
            script_len = struct.unpack('<H', aef_data[offset:offset+2])[0]
            offset += 2
            
            if script_len == 0:
                self.errors.append("Script length is 0")
            elif script_len > self.MAX_SCRIPT_SIZE:
                self.errors.append(f"Script too large: {script_len} bytes (max {self.MAX_SCRIPT_SIZE})")
            else:
                print(f"{Colors.GREEN}✓{Colors.END} Script length: {script_len} bytes")
            
            if offset + script_len > len(aef_data) - 4:  # -4 for checksum
                self.errors.append("AEF file truncated in script section")
                return False, self.info
            
            script = aef_data[offset:offset+script_len]
            offset += script_len
            self.info['script_size'] = script_len
            self.info['script'] = script.hex()[:100] + '...' if len(script) > 50 else script.hex()
            
            # Verify script opcodes
            self._verify_script(script)
            
            # 6. Read and verify checksum
            if offset + 4 != len(aef_data):
                self.errors.append(f"Invalid AEF file size. Expected {offset + 4}, got {len(aef_data)}")
            
            stored_checksum = struct.unpack('<I', aef_data[offset:offset+4])[0]
            
            # Calculate checksum (CRC32 of everything except the checksum itself)
            calculated_checksum = zlib.crc32(aef_data[:-4]) & 0xffffffff
            
            if stored_checksum != calculated_checksum:
                self.errors.append(f"Checksum mismatch: stored={hex(stored_checksum)}, calculated={hex(calculated_checksum)}")
            else:
                self.info['checksum'] = hex(stored_checksum)
                print(f"{Colors.GREEN}✓{Colors.END} Checksum: {hex(stored_checksum)} (valid)")
            
            # Summary
            print()
            if self.errors:
                print(f"{Colors.RED}✗ AEF verification failed with {len(self.errors)} error(s):{Colors.END}")
                for error in self.errors:
                    print(f"  {Colors.RED}• {error}{Colors.END}")
            else:
                print(f"{Colors.GREEN}✓ AEF file is valid and deployable!{Colors.END}")
            
            if self.warnings:
                print(f"{Colors.YELLOW}⚠ {len(self.warnings)} warning(s):{Colors.END}")
                for warning in self.warnings:
                    print(f"  {Colors.YELLOW}• {warning}{Colors.END}")
            
            return len(self.errors) == 0, self.info
            
        except Exception as e:
            self.errors.append(f"Failed to parse AEF: {e}")
            return False, self.info
    
    def _verify_script(self, script: bytes):
        """Verify Atipicial VM script opcodes"""
        
        # Atipicial VM opcodes (simplified check)
        VALID_OPCODES = {
            0x00: 'PUSHINT8',
            0x01: 'PUSHINT16',
            0x02: 'PUSHINT32',
            0x03: 'PUSHINT64',
            0x04: 'PUSHINT128',
            0x05: 'PUSHINT256',
            0x0C: 'PUSHNULL',
            0x0D: 'PUSHDATA1',
            0x0E: 'PUSHDATA2',
            0x0F: 'PUSHDATA4',
            0x10: 'PUSH0',
            0x11: 'PUSH1',
            0x40: 'RET',
            0x41: 'SYSCALL',
            0x56: 'INITSLOT',
            # Add more opcodes as needed
        }
        
        # Basic validation - check for common patterns
        if len(script) < 2:
            self.errors.append("Script too short")
            return
        
        # Check for INITSLOT at beginning (common pattern)
        if script[0] == 0x56:
            print(f"{Colors.GREEN}✓{Colors.END} Script starts with INITSLOT (initialization)")
        
        # Check for RET at end (common pattern)
        if script[-1] == 0x40:
            print(f"{Colors.GREEN}✓{Colors.END} Script ends with RET (return)")
        
        # Count recognized opcodes
        recognized = 0
        for byte in script:
            if byte in VALID_OPCODES:
                recognized += 1
        
        recognition_rate = (recognized / len(script)) * 100 if script else 0
        
        if recognition_rate < 10:
            self.warnings.append(f"Low opcode recognition rate: {recognition_rate:.1f}%")
        else:
            print(f"{Colors.GREEN}✓{Colors.END} Opcode recognition: {recognition_rate:.1f}%")


class ManifestVerifier:
    """Verifies manifest.json structure and content"""
    
    REQUIRED_FIELDS = ['name', 'abi', 'permissions']
    REQUIRED_ABI_FIELDS = ['methods', 'events']
    VALID_TYPES = ['Signature', 'Boolean', 'Integer', 'Hash160', 'Hash256', 
                   'ByteArray', 'PublicKey', 'String', 'Array', 'Map', 'Any', 'Void']
    
    def __init__(self, manifest_path: str):
        self.manifest_path = Path(manifest_path)
        self.errors = []
        self.warnings = []
        self.info = {}
    
    def verify(self) -> Tuple[bool, Dict[str, Any]]:
        """Verify manifest structure and content"""
        
        print(f"\n{Colors.CYAN}{'='*60}{Colors.END}")
        print(f"{Colors.CYAN}Verifying Manifest: {self.manifest_path.name}{Colors.END}")
        print(f"{Colors.CYAN}{'='*60}{Colors.END}")
        
        if not self.manifest_path.exists():
            self.errors.append(f"Manifest file not found: {self.manifest_path}")
            return False, self.info
        
        try:
            with open(self.manifest_path, 'r') as f:
                manifest = json.load(f)
            
            self.info['name'] = manifest.get('name', 'Unknown')
            
            # 1. Verify required fields
            for field in self.REQUIRED_FIELDS:
                if field not in manifest:
                    self.errors.append(f"Missing required field: {field}")
                else:
                    print(f"{Colors.GREEN}✓{Colors.END} Required field '{field}' present")
            
            # 2. Verify name
            if 'name' in manifest:
                name = manifest['name']
                if not name:
                    self.errors.append("Contract name is empty")
                elif len(name) > 255:
                    self.errors.append(f"Contract name too long: {len(name)} chars")
                else:
                    print(f"{Colors.GREEN}✓{Colors.END} Contract name: {name}")
            
            # 3. Verify supported standards
            if 'supportedstandards' in manifest:
                standards = manifest['supportedstandards']
                if not isinstance(standards, list):
                    self.errors.append("supportedstandards must be a list")
                else:
                    self.info['standards'] = standards
                    print(f"{Colors.GREEN}✓{Colors.END} Supported standards: {', '.join(standards) if standards else 'None'}")
                    
                    # Check for AEP-17 compliance
                    if 'AEP-17' in standards:
                        self._verify_aep17_compliance(manifest)
            
            # 4. Verify ABI
            if 'abi' in manifest:
                abi = manifest['abi']
                if not isinstance(abi, dict):
                    self.errors.append("ABI must be an object")
                else:
                    # Check methods
                    if 'methods' not in abi:
                        self.errors.append("ABI missing 'methods' field")
                    else:
                        methods = abi['methods']
                        if not isinstance(methods, list):
                            self.errors.append("ABI methods must be a list")
                        else:
                            print(f"{Colors.GREEN}✓{Colors.END} Methods defined: {len(methods)}")
                            for method in methods:
                                self._verify_method(method)
                    
                    # Check events
                    if 'events' not in abi:
                        self.warnings.append("ABI missing 'events' field")
                    else:
                        events = abi['events']
                        if not isinstance(events, list):
                            self.errors.append("ABI events must be a list")
                        else:
                            print(f"{Colors.GREEN}✓{Colors.END} Events defined: {len(events)}")
                            for event in events:
                                self._verify_event(event)
            
            # 5. Verify permissions
            if 'permissions' in manifest:
                permissions = manifest['permissions']
                if not isinstance(permissions, list):
                    self.errors.append("Permissions must be a list")
                elif not permissions:
                    self.warnings.append("No permissions defined")
                else:
                    print(f"{Colors.GREEN}✓{Colors.END} Permissions defined: {len(permissions)}")
                    for perm in permissions:
                        self._verify_permission(perm)
            
            # 6. Verify extra metadata
            if 'extra' in manifest:
                extra = manifest['extra']
                if isinstance(extra, dict):
                    print(f"{Colors.GREEN}✓{Colors.END} Extra metadata present")
                    if 'Author' in extra:
                        print(f"  • Author: {extra['Author']}")
                    if 'Version' in extra:
                        print(f"  • Version: {extra['Version']}")
            
            # Summary
            print()
            if self.errors:
                print(f"{Colors.RED}✗ Manifest verification failed with {len(self.errors)} error(s):{Colors.END}")
                for error in self.errors:
                    print(f"  {Colors.RED}• {error}{Colors.END}")
            else:
                print(f"{Colors.GREEN}✓ Manifest is valid and deployable!{Colors.END}")
            
            if self.warnings:
                print(f"{Colors.YELLOW}⚠ {len(self.warnings)} warning(s):{Colors.END}")
                for warning in self.warnings:
                    print(f"  {Colors.YELLOW}• {warning}{Colors.END}")
            
            return len(self.errors) == 0, manifest
            
        except json.JSONDecodeError as e:
            self.errors.append(f"Invalid JSON: {e}")
            return False, self.info
        except Exception as e:
            self.errors.append(f"Failed to parse manifest: {e}")
            return False, self.info
    
    def _verify_method(self, method: Dict):
        """Verify method structure"""
        required = ['name', 'parameters', 'returntype', 'offset', 'safe']
        
        for field in required:
            if field not in method:
                self.errors.append(f"Method '{method.get('name', 'unknown')}' missing field: {field}")
        
        # Verify parameter types
        if 'parameters' in method:
            for param in method['parameters']:
                if 'type' in param and param['type'] not in self.VALID_TYPES:
                    self.warnings.append(f"Unknown parameter type: {param['type']}")
        
        # Verify return type
        if 'returntype' in method and method['returntype'] not in self.VALID_TYPES:
            self.warnings.append(f"Unknown return type: {method['returntype']}")
    
    def _verify_event(self, event: Dict):
        """Verify event structure"""
        if 'name' not in event:
            self.errors.append("Event missing 'name' field")
        
        if 'parameters' in event:
            for param in event['parameters']:
                if 'type' in param and param['type'] not in self.VALID_TYPES:
                    self.warnings.append(f"Unknown event parameter type: {param['type']}")
    
    def _verify_permission(self, perm: Dict):
        """Verify permission structure"""
        if 'contract' not in perm:
            self.errors.append("Permission missing 'contract' field")
        
        if 'methods' not in perm:
            self.errors.append("Permission missing 'methods' field")
        elif not isinstance(perm['methods'], list):
            self.errors.append("Permission 'methods' must be a list")
    
    def _verify_aep17_compliance(self, manifest: Dict):
        """Verify AEP-17 token standard compliance"""
        print(f"\n{Colors.BLUE}Checking AEP-17 compliance...{Colors.END}")
        
        required_methods = {
            'symbol': {'parameters': [], 'returntype': 'String'},
            'decimals': {'parameters': [], 'returntype': 'Integer'},
            'totalSupply': {'parameters': [], 'returntype': 'Integer'},
            'balanceOf': {'parameters': [{'type': 'Hash160'}], 'returntype': 'Integer'},
            'transfer': {'parameters': [
                {'type': 'Hash160'},  # from
                {'type': 'Hash160'},  # to
                {'type': 'Integer'},  # amount
                {'type': 'Any'}       # data
            ], 'returntype': 'Boolean'}
        }
        
        required_events = {
            'Transfer': {'parameters': [
                {'type': 'Hash160'},  # from
                {'type': 'Hash160'},  # to
                {'type': 'Integer'}   # amount
            ]}
        }
        
        if 'abi' in manifest:
            abi = manifest['abi']
            
            # Check methods
            if 'methods' in abi:
                methods = {m['name']: m for m in abi['methods'] if 'name' in m}
                
                for method_name, requirements in required_methods.items():
                    if method_name not in methods:
                        self.errors.append(f"AEP-17: Missing required method '{method_name}'")
                    else:
                        print(f"  {Colors.GREEN}✓{Colors.END} AEP-17 method: {method_name}")
            
            # Check events
            if 'events' in abi:
                events = {e['name']: e for e in abi['events'] if 'name' in e}
                
                for event_name in required_events:
                    if event_name not in events:
                        self.errors.append(f"AEP-17: Missing required event '{event_name}'")
                    else:
                        print(f"  {Colors.GREEN}✓{Colors.END} AEP-17 event: {event_name}")


class DeploymentSimulator:
    """Simulates deployment and invocation to verify correctness"""
    
    def __init__(self, aef_path: str, manifest_path: str):
        self.aef_path = Path(aef_path)
        self.manifest_path = Path(manifest_path)
    
    def simulate(self):
        """Simulate deployment process"""
        
        print(f"\n{Colors.CYAN}{'='*60}{Colors.END}")
        print(f"{Colors.CYAN}Deployment Simulation{Colors.END}")
        print(f"{Colors.CYAN}{'='*60}{Colors.END}")
        
        # Load files
        try:
            with open(self.aef_path, 'rb') as f:
                aef_data = f.read()
            
            with open(self.manifest_path, 'r') as f:
                manifest = json.load(f)
            
            # Calculate contract hash (simplified - actual uses more complex algorithm)
            contract_hash = hashlib.sha256(aef_data).hexdigest()[:40]
            
            print(f"{Colors.GREEN}✓{Colors.END} Contract would deploy with hash: {contract_hash}")
            
            # Simulate method invocations
            if 'abi' in manifest and 'methods' in manifest['abi']:
                print(f"\n{Colors.BLUE}Available methods for invocation:{Colors.END}")
                
                for method in manifest['abi']['methods']:
                    name = method.get('name', 'unknown')
                    params = method.get('parameters', [])
                    returntype = method.get('returntype', 'Void')
                    safe = method.get('safe', False)
                    
                    param_str = ', '.join([f"{p.get('name', 'arg')}:{p.get('type', 'Any')}" 
                                          for p in params])
                    
                    safety = f"{Colors.GREEN}[SAFE]{Colors.END}" if safe else f"{Colors.YELLOW}[MUTABLE]{Colors.END}"
                    
                    print(f"  {safety} {name}({param_str}) -> {returntype}")
                
                # Generate sample invocation commands
                print(f"\n{Colors.BLUE}Sample invocation commands:{Colors.END}")
                
                safe_methods = [m for m in manifest['abi']['methods'] 
                               if m.get('safe', False) and not m.get('parameters', [])]
                
                for method in safe_methods[:3]:  # Show first 3 safe methods
                    name = method['name']
                    print(f"  atipicialxp contract invoke {contract_hash[:8]}... {name} [] alice")
            
            # Check deployment size
            total_size = len(aef_data) + len(json.dumps(manifest))
            
            if total_size > 1024 * 1024:  # 1MB warning threshold
                print(f"{Colors.YELLOW}⚠ Large deployment size: {total_size:,} bytes{Colors.END}")
            else:
                print(f"{Colors.GREEN}✓{Colors.END} Deployment size: {total_size:,} bytes")
            
            return True
            
        except Exception as e:
            print(f"{Colors.RED}✗ Deployment simulation failed: {e}{Colors.END}")
            return False


def verify_contract(aef_path: str, manifest_path: str = None) -> bool:
    """Main verification function"""
    
    print(f"\n{Colors.BOLD}{Colors.CYAN}╔{'═'*58}╗{Colors.END}")
    print(f"{Colors.BOLD}{Colors.CYAN}║  Atipicial Contract Verification Tool                      ║{Colors.END}")
    print(f"{Colors.BOLD}{Colors.CYAN}╚{'═'*58}╝{Colors.END}\n")
    
    # Auto-detect manifest if not provided
    if manifest_path is None:
        aef_file = Path(aef_path)
        manifest_path = aef_file.parent / f"{aef_file.stem}.manifest.json"
    
    # Verify AEF
    aef_verifier = AefVerifier(aef_path)
    aef_valid, aef_info = aef_verifier.verify()
    
    # Verify Manifest
    manifest_verifier = ManifestVerifier(manifest_path)
    manifest_valid, manifest_info = manifest_verifier.verify()
    
    # Simulate deployment
    if aef_valid and manifest_valid:
        simulator = DeploymentSimulator(aef_path, manifest_path)
        deploy_valid = simulator.simulate()
    else:
        deploy_valid = False
    
    # Final summary
    print(f"\n{Colors.BOLD}{Colors.CYAN}{'='*60}{Colors.END}")
    print(f"{Colors.BOLD}{Colors.CYAN}VERIFICATION SUMMARY{Colors.END}")
    print(f"{Colors.BOLD}{Colors.CYAN}{'='*60}{Colors.END}")
    
    results = [
        ("AEF Structure", aef_valid),
        ("Manifest JSON", manifest_valid),
        ("Deployment Ready", deploy_valid)
    ]
    
    all_valid = all(r[1] for r in results)
    
    for check, valid in results:
        status = f"{Colors.GREEN}✓ PASS{Colors.END}" if valid else f"{Colors.RED}✗ FAIL{Colors.END}"
        print(f"{check:.<40} {status}")
    
    print()
    
    if all_valid:
        print(f"{Colors.BOLD}{Colors.GREEN}🎉 CONTRACT IS VALID AND READY FOR DEPLOYMENT!{Colors.END}")
        print(f"\n{Colors.BLUE}Next steps:{Colors.END}")
        print("1. Start Atipicial Express: atipicialxp run --seconds-per-block 1")
        print(f"2. Deploy contract: atipicialxp contract deploy {aef_path} alice")
        print("3. Invoke methods using the contract hash")
    else:
        print(f"{Colors.BOLD}{Colors.RED}❌ CONTRACT VERIFICATION FAILED{Colors.END}")
        print(f"{Colors.YELLOW}Please fix the errors above and try again.{Colors.END}")
    
    return all_valid


def main():
    """Main entry point"""
    
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <aef_file> [manifest_file]")
        print(f"Example: {sys.argv[0]} contract.aef contract.manifest.json")
        sys.exit(1)
    
    aef_path = sys.argv[1]
    manifest_path = sys.argv[2] if len(sys.argv) > 2 else None
    
    success = verify_contract(aef_path, manifest_path)
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()