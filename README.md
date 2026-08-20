# Phoenix Legacy maintenance fork

This repository is maintained by Michael Vincent Patrick (`MVPuknowme`) as a fork of [Ellipsis Labs' Phoenix Legacy](https://github.com/Ellipsis-Labs/phoenix-v1), an on-chain Solana order book that operates without a crank.

Original program authorship, audits, security policy, deployment, and the canonical on-chain program ID remain attributed to Ellipsis Labs. Aura/SKYGRID integrations should be implemented outside the audited program source unless they receive a new program ID, reproducible deployment process, and an independent security review.

## Canonical program

- Program ID: `PhoeNiXZ8ByJGLkxNfZRnkUfjvmuYqLR89jjFHGqdXY`
- Upstream source: [Ellipsis-Labs/phoenix-v1](https://github.com/Ellipsis-Labs/phoenix-v1)
- Documentation: [Phoenix documentation](https://ellipsis-labs.gitbook.io/phoenix-dex/tRIkEFlLUzWK9uKO3W2V/getting-started/phoenix-overview)
- Security policy: [upstream SECURITY.md](https://github.com/Ellipsis-Labs/phoenix-v1/blob/master/SECURITY.md)
- Audit reports: [`audits/`](audits/)

## Build verification

Use the Solana Verify CLI against the canonical upstream repository:

```text
solana-verify verify-from-repo -um --program-id PhoeNiXZ8ByJGLkxNfZRnkUfjvmuYqLR89jjFHGqdXY https://github.com/Ellipsis-Labs/phoenix-v1
```

The verification build runs in Docker and may take longer on ARM machines.

## Local build and test

The project requires the compatible Rust and Solana SBF toolchains.

```text
./build.sh
./test.sh
```

The CI workflow validates script syntax, a locked SBF build, and the upstream test suite. It intentionally does not rewrite canonical legacy source for modern formatting rules.

## Licensing

Phoenix Legacy is available under the MIT License. See [`LICENSE`](LICENSE). The Ellipsis Labs copyright and attribution are retained.

## Aura/SKYGRID integration

Integration boundaries and maintenance guidance are documented in [`docs/aura-integration.md`](docs/aura-integration.md). Do not add wallet secrets, seed phrases, RPC credentials, or private operational evidence to this public repository.
