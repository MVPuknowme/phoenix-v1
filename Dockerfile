# Get rust and solana toolchain
FROM ellipsislabs/solana:latest
# Download the canonical phoenix-v1 source code
RUN git clone https://github.com/Ellipsis-Labs/phoenix-v1.git /build
# Checkout the commit that was used to build the verified binary
RUN git checkout e879f1c2b455a98f3cb72f9757ea73c836b3978c
# Run the reproducible build
RUN cargo build-sbf -- --locked --frozen
