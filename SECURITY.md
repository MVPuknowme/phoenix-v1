# Security policy

## Canonical Phoenix Legacy program

This repository is a maintenance fork of [Ellipsis-Labs/phoenix-v1](https://github.com/Ellipsis-Labs/phoenix-v1). It does not administer, replace, or expand the upstream Phoenix Legacy bug bounty.

Report vulnerabilities affecting the canonical Phoenix Legacy program according to the [upstream security policy](https://github.com/Ellipsis-Labs/phoenix-v1/blob/master/SECURITY.md). Do not publish exploit details in a public issue.

## Fork-specific changes

Keep Aura/SKYGRID adapters outside the audited program source. If a future change modifies on-chain behavior, treat it as a new program: assign a new program ID and PDA set, document upgrade authority and deployment controls, produce a reproducible build, and obtain an independent security review before handling funds.

For a vulnerability unique to this fork, use GitHub private vulnerability reporting when available. If it is unavailable, contact the repository owner without including exploit details in a public message.
