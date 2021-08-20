const fs = require("fs");
const source = fs.readFileSync("./bridge.wasm");
const typedArray = new Uint8Array(source);

let wasmModule;
const out = {};

function getString(ptr, len) {
  const slice = wasmModule.instance.exports.memory.buffer.slice(ptr, ptr + len);
  const textDecoder = new TextDecoder();
  return textDecoder.decode(slice);
}

function returnString(ptr, len) {
  out.s = getString(ptr, len);
}

function returnObject(ptr, len) {
  out.s = JSON.parse(getString(ptr, len));
}

WebAssembly.instantiate(typedArray, {
  env: { returnString, returnObject, print: (s) => console.log(s) },
}).then((result) => {
  wasmModule = result;
  global.sage = {
    hello: (name) => {
      wasmModule.instance.exports.hello(name);
      return out.s;
    },
  };
  console.log("got ", global.sage.hello(389));
});
