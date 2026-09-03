use atipicial_compiler::{AtipicialCompiler, WasmModule};
use std::fs;
use std::path::PathBuf;
use tempfile::TempDir;

#[test]
fn test_compile_simple_wasm() {
    // Create a simple WASM module
    let wasm = wat::parse_str(r#"
        (module
            (func $add (param i32 i32) (result i32)
                local.get 0
                local.get 1
                i32.add
            )
            (export "add" (func $add))
        )
    "#).unwrap();
    
    // Write WASM to temp file
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("test.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    // Compile to AEF
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    let result = compiler.compile(&wasm_path).unwrap();
    
    // Verify output files exist
    assert!(result.aef_path.exists());
    assert!(result.manifest_path.exists());
    
    // Verify AEF structure
    assert_eq!(result.aef.magic, 0x3346454E);
    assert!(!result.aef.script.is_empty());
    assert!(result.aef.verify_checksum());
}

#[test]
fn test_solana_style_detection() {
    // Create a WASM module with Solana-style naming
    let wasm = wat::parse_str(r#"
        (module
            (func $program::initialize (param i32) (result i32)
                local.get 0
            )
            (func $program::transfer (param i32 i32 i32) (result i32)
                i32.const 1
            )
            (export "program::initialize" (func $program::initialize))
            (export "program::transfer" (func $program::transfer))
        )
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("solana_style.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    let result = compiler.compile(&wasm_path).unwrap();
    
    // Should detect Solana style
    assert!(result.is_solana_style);
    
    // Should have generated manifest with methods
    assert!(!result.manifest.abi.methods.is_empty());
    
    // Check for expected methods
    let method_names: Vec<String> = result.manifest.abi.methods
        .iter()
        .map(|m| m.name.clone())
        .collect();
    
    assert!(method_names.contains(&"initialize".to_string()));
    assert!(method_names.contains(&"transfer".to_string()));
}

#[test]
fn test_aep17_standard_detection() {
    // Create a WASM module with AEP-17 methods
    let wasm = wat::parse_str(r#"
        (module
            (func $token::transfer (param i32 i32 i32) (result i32)
                i32.const 1
            )
            (func $token::balance_of (param i32) (result i32)
                i32.const 100
            )
            (func $token::total_supply (result i32)
                i32.const 1000000
            )
            (export "token::transfer" (func $token::transfer))
            (export "token::balance_of" (func $token::balance_of))
            (export "token::total_supply" (func $token::total_supply))
        )
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("aep17.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    let result = compiler.compile(&wasm_path).unwrap();
    
    // Should detect AEP-17 standard
    assert!(result.manifest.supported_standards.contains(&"AEP-17".to_string()));
}

#[test]
fn test_manifest_generation() {
    let wasm = wat::parse_str(r#"
        (module
            (func $contract::get_value (result i32)
                i32.const 42
            )
            (func $contract::set_value (param i32))
            (export "contract::get_value" (func $contract::get_value))
            (export "contract::set_value" (func $contract::set_value))
        )
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("contract.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    let result = compiler.compile(&wasm_path).unwrap();
    
    // Check manifest content
    assert_eq!(result.manifest.abi.methods.len(), 2);
    
    // get_value should be marked as safe (read-only)
    let get_value = result.manifest.abi.methods
        .iter()
        .find(|m| m.name == "get_value")
        .unwrap();
    assert!(get_value.safe);
    
    // set_value should not be safe
    let set_value = result.manifest.abi.methods
        .iter()
        .find(|m| m.name == "set_value")
        .unwrap();
    assert!(!set_value.safe);
}

#[test]
fn test_aef_serialization_deserialization() {
    let wasm = wat::parse_str(r#"
        (module
            (func $main)
            (export "main" (func $main))
        )
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("test.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    let result = compiler.compile(&wasm_path).unwrap();
    
    // Read AEF file back
    let aef_bytes = fs::read(&result.aef_path).unwrap();
    let loaded_aef = atipicial_compiler::aef::Aef3::from_bytes(&aef_bytes).unwrap();
    
    // Verify it matches
    assert_eq!(loaded_aef.magic, result.aef.magic);
    assert_eq!(loaded_aef.compiler, result.aef.compiler);
    assert_eq!(loaded_aef.source, result.aef.source);
    assert_eq!(loaded_aef.script, result.aef.script);
    assert!(loaded_aef.verify_checksum());
}

#[test]
fn test_compile_with_custom_manifest() {
    let wasm = wat::parse_str(r#"
        (module
            (func $test)
            (export "test" (func $test))
        )
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("test.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    // Create custom manifest
    let manifest = atipicial_compiler::manifest::Manifest {
        name: "CustomContract".to_string(),
        supported_standards: vec!["AEP-17".to_string()],
        ..Default::default()
    };
    
    let manifest_path = temp_dir.path().join("test.manifest.json");
    manifest.to_file(&manifest_path).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    let result = compiler.compile(&wasm_path).unwrap();
    
    // Should use the provided manifest
    assert_eq!(result.manifest.name, "CustomContract");
    assert!(result.manifest.supported_standards.contains(&"AEP-17".to_string()));
}

#[test]
fn test_compiler_debug_mode() {
    let wasm = wat::parse_str(r#"
        (module
            (func $test)
            (export "test" (func $test))
        )
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("test.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_debug(true)
        .with_output_dir(temp_dir.path().to_path_buf());
    
    // Should compile successfully with debug enabled
    let result = compiler.compile(&wasm_path);
    assert!(result.is_ok());
}

#[test]
fn test_empty_wasm_module() {
    let wasm = wat::parse_str(r#"
        (module)
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("empty.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    // Should handle empty module gracefully
    let result = compiler.compile(&wasm_path);
    assert!(result.is_ok());
}

#[test]
fn test_multiple_exports() {
    let wasm = wat::parse_str(r#"
        (module
            (func $func1 (result i32)
                i32.const 1
            )
            (func $func2 (result i32)
                i32.const 2
            )
            (func $func3 (result i32)
                i32.const 3
            )
            (export "func1" (func $func1))
            (export "func2" (func $func2))
            (export "func3" (func $func3))
        )
    "#).unwrap();
    
    let temp_dir = TempDir::new().unwrap();
    let wasm_path = temp_dir.path().join("multi.wasm");
    fs::write(&wasm_path, &wasm).unwrap();
    
    let compiler = AtipicialCompiler::new()
        .with_output_dir(temp_dir.path().to_path_buf());
    
    let result = compiler.compile(&wasm_path).unwrap();
    
    // Should have all three methods in manifest
    assert_eq!(result.manifest.abi.methods.len(), 3);
    
    let method_names: Vec<String> = result.manifest.abi.methods
        .iter()
        .map(|m| m.name.clone())
        .collect();
    
    assert!(method_names.contains(&"func1".to_string()));
    assert!(method_names.contains(&"func2".to_string()));
    assert!(method_names.contains(&"func3".to_string()));
}