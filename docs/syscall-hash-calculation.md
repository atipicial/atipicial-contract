<!-- Atipicial Chain · sovereign Layer-1 for smart contracts and digital assets -->
<!-- 👑 Founded & engineered by xmoohad — Blockchain Scientist · Computer Programmer -->

# Syscall Hash Calculation in Atipicial

This document explains how syscall hashes are calculated in Atipicial and how they are implemented in the atipicial-contract-rs framework.

## Overview

In Atipicial, syscalls are identified by a 4-byte hash derived from the syscall name. This hash is used as the operand for the SYSCALL opcode in the AEF bytecode and is also included in the method tokens in the contract manifest.

## Hash Calculation Process

The syscall hash is calculated as follows:

1. Take the full syscall name (e.g., "System.Runtime.Log")
2. Calculate the SHA-256 hash of the ASCII-encoded name
3. Take the first 4 bytes of the hash as the syscall identifier

## Examples

Here are some examples of syscall hash calculations:

| Syscall Name | SHA-256 Hash (first 4 bytes) | Hex Representation |
|--------------|------------------------------|-------------------|
| System.Runtime.Log | [0xcf, 0xe7, 0x47, 0x96] | cfe74796 |
| System.Runtime.GetTime | [0xb7, 0xc3, 0x88, 0x03] | b7c38803 |
| System.Storage.GetContext | [0x9b, 0xf6, 0x67, 0xce] | 9bf667ce |
| System.Contract.Call | [0x62, 0x7d, 0x5b, 0x52] | 627d5b52 |

## Implementation in atipicial-contract-rs

The syscall hash calculation is implemented in two main places:

### 1. Syscall Translation

In `atipicial-wasm/rosetta/translates/syscall.go`, the syscall hash is calculated and used as the operand for the SYSCALL opcode:

```go
// Calculate the syscall hash (first 4 bytes of SHA256 hash of the syscall name)
syscallNameBytes := []byte(syscall.Name)
syscallHash := sha256Hash(syscallNameBytes)[:4]

// Create a translation with SYSCALL operation
translation := &Translation{
    Sources: []WasmOp{},
    Targets: []atipicial.VmOp{
        {
            OpCode: atipicial.OpSyscall,
            First:  syscallHash, // Use the first 4 bytes of the SHA256 hash
        },
    },
}
```

### 2. Method Token Generation

In `atipicial-wasm/rosetta/rosetta.go`, the syscall hash is calculated and included in the method tokens:

```go
// Calculate the syscall hash (first 4 bytes of SHA256 hash of the syscall name)
syscallNameBytes := []byte(syscall.Name)
syscallHash := sha256.Sum256(syscallNameBytes)
syscallHashHex := fmt.Sprintf("%02x%02x%02x%02x", syscallHash[0], syscallHash[1], syscallHash[2], syscallHash[3])

// Add the syscall as a method token
tokens = append(tokens, atipicial.MethodToken{
    Hash:       syscallHashHex, // Use the first 4 bytes of SHA256 hash
    Method:     syscall.Name,
    ParamCount: paramCount,
    HasReturn:  syscall.Return != atipicial.ParamVoid,
    CallFlags:  atipicial.CallFlag(1), // Default to read flag
})
```

## Verifying Syscall Hashes

You can verify the syscall hash calculation using the following Go code:

```go
package main

import (
    "crypto/sha256"
    "encoding/hex"
    "fmt"
)

func main() {
    syscalls := []string{
        "System.Runtime.Log",
        "System.Runtime.GetTime",
        "System.Storage.GetContext",
        "System.Contract.Call",
    }

    for _, syscall := range syscalls {
        hash := sha256.Sum256([]byte(syscall))
        hashHex := hex.EncodeToString(hash[:4])
        fmt.Printf("Syscall: %s, Hash: %s\n", syscall, hashHex)
    }
}
```

## Debugging Syscall Hashes

When debugging syscall hash issues:

1. Enable verbose logging with `ATC_WASM_DEBUG=1 ATC_WASM_VERBOSE=1`
2. Look for "Syscall hash for..." messages in the logs
3. Verify the hash calculation using the code snippet above
4. Check the AEF assembly file for the correct SYSCALL opcode and operand

## References

- [Atipicial Documentation](https://docs.atipicial.com/docs/en-us/index.html)
- [Atipicial Syscall Reference](https://docs.atipicial.com/docs/en-us/reference/scapi/framework/native.html)
- [AEF File Format Specification](https://github.com/atipicial-project/proposals/blob/master/aep-11.mediawiki)

---

> **Atipicial Chain** — sovereign Layer-1 for smart contracts and digital assets.
> 👑 Founded & engineered by **xmoohad** — Blockchain Scientist · Computer Programmer.
> `ATC` Atipicial Coin · `ATD` AtipicialDollar · addresses begin with **A**
