# Fuzzing Strategy for Protocol Testing

This document describes the overall fuzzing approach used in this repository.

## Goals

- Find crashes, logic bugs, and DoS vectors in protocol parsers
- Maintain high coverage on critical decoding paths
- Support both Rust and Go implementations
- Enable both fast local testing and deep scheduled fuzzing

## Target Areas

- Frame header parsing
- Length field handling (DoS protection)
- Checksum validation
- Type-specific payload parsing
- Roundtrip consistency (encode → decode)

## Tools

| Language | Tool              | Strength                     |
|----------|-------------------|------------------------------|
| Rust     | cargo-fuzz        | High performance, deep       |
| Go       | go test -fuzz     | Easy, native                 |
| Go       | AFL++             | Advanced mutation strategies |

## Recommended Workflow

1. Use short local fuzzing during development (`go test -fuzz` / `./fuzz.sh`)
2. Rely on CI for continuous light fuzzing on PRs
3. Use scheduled long runs for deeper coverage
4. Analyze and minimize corpora regularly

See the individual `rust/` and `go/` directories for concrete targets.