const std = @import("std");

pub fn readInput(allocator: std.mem.Allocator, day: u8) ![]const u8 {
    var path_buffer: [64]u8 = undefined;
    const path = try std.fmt.bufPrint(&path_buffer, "inputs/day{d:0>2}.txt", .{day});
    
    const file = std.fs.cwd().openFile(path, .{}) catch |err| {
        std.debug.print("Failed to open file {s}: {any}\n", .{ path, err });
        return err;
    };
    defer file.close();

    const file_size = try file.getEndPos();
    const buffer = try allocator.alloc(u8, file_size);
    errdefer allocator.free(buffer);
    
    const bytes_read = try file.readAll(buffer);
    if (bytes_read != file_size) {
        return error.IncompleteRead;
    }
    
    return buffer;
}

pub fn splitLines(input: []const u8) std.mem.SplitIterator(u8, .scalar) {
    return std.mem.splitScalar(u8, input, '\n');
}

pub fn parseInt(str: []const u8) !i64 {
    return std.fmt.parseInt(i64, str, 10) catch |err| {
        std.debug.print("Failed to parse integer from '{s}': {any}\n", .{ str, err });
        return err;
    };
}
