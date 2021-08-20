// zig build-lib hello.zig -target wasm32-freestanding -dynamic

const std = @import("std");

extern fn returnString(ptr: [*]const u8, len: usize) void;
extern fn returnObject(ptr: [*]const u8, len: usize) void;

extern fn print(i: usize) void;

fn sendString(s: [*]const u8) void {
    var i: usize = 0;
    while (s[i] != 0) : (i += 1) {}
    returnString(s, i);
}

fn sendObject(x: anytype) void {
    var buf: [1000]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    var string = std.ArrayList(u8).init(&fba.allocator);
    std.json.stringify(x, .{}, string.writer()) catch {
        sendString("error");
    };
    const len = string.items.len;
    returnObject(&buf, len);
}

export fn hello(n: usize) void {
    //returnString(s, s.len);
    //sendString("hi there");
    const w = .{ 1, 2, 3 };
    sendObject(.{ .x = n, .y = "foo", .t = 9399392308408234082308, .z = w });
}
