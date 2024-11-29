const std = @import("std");
const utils = @import("../utils.zig");

pub fn solvePart1(input: []const u8) !i64 {
    var sum: i64 = 0;
    var lines = utils.splitLines(input);
    while (lines.next()) |line| {
        if (line.len == 0) continue;
        const value = try utils.parseInt(line);
        sum += value;
    }
    return sum;
}

pub fn solvePart2(input: []const u8) !i64 {
    var sum: i64 = 0;
    var lines = utils.splitLines(input);
    while (lines.next()) |line| {
        if (line.len == 0) continue;
        const value = try utils.parseInt(line);
        sum += value * 2; // Example implementation
    }
    return sum;
}

test "day 1 part 1" {
    const input =
        \\1
        \\2
        \\3
    ;
    try std.testing.expectEqual(@as(i64, 6), try solvePart1(input));
}

test "day 1 part 2" {
    const input =
        \\1
        \\2
        \\3
    ;
    try std.testing.expectEqual(@as(i64, 12), try solvePart2(input));
}
