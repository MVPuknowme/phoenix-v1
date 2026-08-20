#!/bin/bash -e
RUST_LOG= cargo test-sbf --features no-entrypoint -- --test
