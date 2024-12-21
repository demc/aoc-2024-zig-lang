const std = @import("std");
const utils = @import("utils.zig");

pub fn solvePart1(input: []const u8) !i64 {

  var lines = utils.splitLines(input);

  const allocator = std.heap.page_allocator;
  var list1 = std.ArrayList(i64).init(allocator);
  var list2 = std.ArrayList(i64).init(allocator);

  while (lines.next()) |line| {
    var first: ?i64 = null;
    var second: ?i64 = null;

    //std.debug.print("{s}\n", .{line});

    var buffer = std.ArrayList(u8).init(allocator);
    defer buffer.deinit();

    var i: usize = 0;
    while (i < line.len) {
      if (line[i] == ' ') {
        if (first == null) {
          first = utils.parseInt(buffer.items) catch null;
          buffer.deinit();
          buffer = std.ArrayList(u8).init(allocator);
        }
        i = i + 1;
        continue;
      }
      try buffer.append(line[i]);
      i = i + 1;
    }

    second = utils.parseInt(buffer.items) catch null;

    if (first) |value| {
      try list1.append(value);
    }
    if (second) |value| {
      try list2.append(value);
    }
  }

  std.mem.sort(i64, list1.items, {}, comptime std.sort.asc(i64));
  std.mem.sort(i64, list2.items, {}, comptime std.sort.asc(i64));

  if (false) {
    for (list1.items) |l1| {
      std.debug.print("{d} ", .{l1});
    }
    std.debug.print("\n---\n", .{});
    for (list2.items) |l2| {
      std.debug.print("{d} ", .{l2});
    }
  }

  var sum: u64 = 0;

  for (0..list1.items.len) |index| {
    const diff = @abs(list1.items[index] - list2.items[index]);
    sum += diff;
  }
  
  return @intCast(sum);
}


pub fn solvePart2(input: []const u8) !i64 {
  _ = input;
  return 0;
}

const equal = std.testing.expectEqual;

test "day 1 part 1" {
  const input = 
  \\3   4
  \\4   3
  \\2   5
  \\1   3
  \\3   9
  \\3   3
  ;

  const out: ?i64 = solvePart1(input) catch null;
  std. debug.print("\n\nSUM {?d}\n\n", .{out});

  try equal(11, out);
}
