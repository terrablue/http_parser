const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const http_parser = b.addStaticLibrary(.{
        .name = "http_parser",
        .target = target,
        .optimize = optimize,
    });

    http_parser.linkLibC();
    http_parser.addCSourceFiles(&.{
        "http_parser.c"
    }, &.{
        "-Wall",
        "-W",
        "-Wstrict-prototypes",
        "-Wwrite-strings",
        "-Wno-missing-field-initializers",
    });
    http_parser.install();
    http_parser.installHeader("http_parser.h", "http_parser.h");
}
