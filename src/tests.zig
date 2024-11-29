const std = @import("std");
const template = @import("template.zig");

test {
    std.testing.refAllDecls(template);
}
