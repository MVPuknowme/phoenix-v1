#!/bin/bash -e
ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SBF_OUT_DIR="$ROOT/target/deploy" RUST_LOG= cargo test --locked --frozen --features no-entrypoint -- --test