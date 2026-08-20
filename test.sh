#!/bin/bash -e
ROOT=$(git rev-parse --show-toplevel)
SBF_OUT_DIR="$ROOT/target/deploy" RUST_LOG= cargo test --locked --frozen --features no-entrypoint -- --test