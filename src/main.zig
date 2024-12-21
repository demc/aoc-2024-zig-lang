const std = @import("std");
const day01 = @import("solutions/day01.zig");
const utils = @import("solutions/utils.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    // Read day number from args, default to day 1 if not provided
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    const day: u8 = if (args.len > 1)
        try std.fmt.parseInt(u8, args[1], 10)
    else
        1;

    // Read input file
    const input = try utils.readInput(allocator, day);
    defer allocator.free(input);

    //std.debug.print("HELLO DAY {d} \n\n", .{day});


    // Solve the day's puzzles
    switch (day) {
        1 => {
            const part1 = try day01.solvePart1(input);
            const part2 = try day01.solvePart2(input);
            std.debug.print("Day {d} Part 1: {d}\n", .{ day, part1 });
            std.debug.print("Day {d} Part 2: {d}\n", .{ day, part2 });
        },
        else => {
            std.debug.print("Day {d} not implemented yet\n", .{day});
        },
    }
}