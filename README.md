# Zig WASM JSON Bridge

This is an example that illustrates how to use JSON to send data back
and forth between a Javascript runtime and a ZIG library that is compiled
using `-target wasm32-freestanding -dynamic`. This is of course potentially
slow, but is useful for using ZIG to provide functionality to Javascript
without having to worry about efficiently translating low level types back
and forth. You can do transfer anything via JSON now, then create something
more low level for speed later when necessary.

## TODO:

- [ ] Figure out how to send data via JSON to zig
- [ ] This is a total hacked mess right now.  Make it organized and reusable.

## References

- This demo explains how to move strings from WASM to Javascript using ZIG: https://github.com/shritesh/zig-wasm-dom

- Ziglearn has examples using Zig's JSON support: https://ziglearn.org/chapter-2/#json

- Zig standard library json docs: https://ziglang.org/documentation/master/std/#std;json
