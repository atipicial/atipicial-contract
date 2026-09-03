// Copyright @ 2024 - present, Atipicial Network
// All Rights Reserved.

#[allow(unused_imports)]
use crate::{
    env,
    types::{placeholder::*, *},
};

// This is for atipicial contract internal use.
// DO NOT use this function directly.
#[cfg(target_family = "wasm")]
pub fn internal_struct_get<const N: usize, T: FromPlaceholder>(structure: Placeholder) -> T {
    T::from_placeholder(unsafe { env::asm::array_get(structure, N) })
}

// This is for atipicial contract internal use.
// DO NOT use this function directly.
#[cfg(target_family = "wasm")]
pub fn internal_struct_set<const N: usize, T: IntoPlaceholder>(structure: Placeholder, value: T) {
    unsafe { env::asm::array_set(structure, N, value.into_placeholder()) };
}
