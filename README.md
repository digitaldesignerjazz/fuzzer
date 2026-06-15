# Fuzzer

**Multi-language fuzzing infrastructure for P2P protocols**, with a focus on the **Framed Message Protocol (FMP)**.

This repository contains reusable fuzzing harnesses, targets, corpora, and tooling for security testing of network protocols.

## Supported Languages

- **Rust** — `cargo-fuzz` (high-performance, coverage-guided)
- **Go** — Native `go test -fuzz` + AFL++ integration

## Repository Structure

```
fuzzer/
├── README.md
├── rust/
│   ├── fuzz/                 # cargo-fuzz targets
│   └── fuzz.sh               # Convenient runner script
├── go/
│   ├── fuzz_test.go          # Native Go fuzz targets
│   └── afl/                  # AFL++ integration & persistent mode
├── docs/
│   └── fuzzing-strategy.md   # Overall fuzzing approach
├── corpus/                 # Shared seed corpus
└── .github/workflows/      # CI + Scheduled Fuzzing
```

## Quick Start

### Rust

```bash
cd rust
./fuzz.sh decode_raw 30
```

### Go

```bash
cd go

go test -fuzz=FuzzDecodeRaw -fuzztime=30s
```

## CI / Automation

- Short fuzz sessions run on every PR
- Long fuzzing sessions run weekly (scheduled)
- Crashing inputs are automatically uploaded as artifacts

See `.github/workflows/` for details.

## Goals

- Provide high-quality, reusable fuzzing targets for P2P and mesh networking protocols
- Maintain parity between Rust and Go implementations
- Make deep security testing easy and reproducible

---

*Part of the Framed Message Protocol ecosystem.*