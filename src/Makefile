
run: bridge.wasm
	node ./bridge.js

bridge.wasm:
	zig build-lib bridge.zig -target wasm32-freestanding -dynamic

clean:
	rm -rf bridge.wasm zig-cache