const std = @import("std");

pub fn solvePart1(input: []const u8) !i64 {
    _ = input;
    return 42; // Simple return value for testing
}

pub fn solvePart2(input: []const u8) !i64 {
    _ = input;
    return 42; // Simple return value for testing
}

test "part 1 example" {
    const input = "test";
    try std.testing.expectEqual(@as(i64, 42), try solvePart1(input));
}

test "part 2 example" {
    const input = "test";
    try std.testing.expectEqual(@as(i64, 42), try solvePart2(input));
}
