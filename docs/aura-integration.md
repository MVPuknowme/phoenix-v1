# Aura/SKYGRID integration boundary

Maintainer: Michael Vincent Patrick (`MVPuknowme`)

Phoenix Legacy is retained here as canonical, attributed smart-contract source. Aura/SKYGRID functionality should consume Phoenix through clients, SDKs, indexed events, or narrowly scoped adapters rather than editing the audited order-book program.

## Safe integration rules

1. Keep the canonical Phoenix program ID and log-authority PDA unchanged.
2. Keep integration services, wallet UX, monitoring, routing, and partner APIs outside `src/`.
3. Never commit private keys, seed phrases, wallet-export files, RPC credentials, access tokens, or private evidence.
4. Require explicit network selection and default development work to localnet or devnet.
5. Record transaction signatures, cluster, program ID, configuration hash, and application version for every integration test.
6. Require a separate program ID, deployment authority policy, reproducible build, and independent audit before deploying any modified on-chain program.

Aura-Core operational documents and ledger artifacts belong in the Aura-Core repository or its controlled document store, not in this public smart-contract source tree.
