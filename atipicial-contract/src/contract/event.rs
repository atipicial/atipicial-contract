// Copyright @ 2024 - present, Atipicial Network
// All Rights Reserved.

use crate::types::*;

pub trait OnAep11Transfer {
    fn on_aep11_transfer(from: H160, to: H160, amount: Int256, token_id: ByteString);
}

pub trait OnAep17Transfer {
    fn on_aep17_transfer(from: H160, to: H160, amount: Int256);
}

pub trait PostAep11Transfer {
    fn post_aep11_transfer(from: H160, to: H160, amount: Int256, token_id: ByteString);
}

pub trait PostAep17Transfer {
    fn post_aep17_transfer(from: H160, to: H160, amount: Int256);
}
