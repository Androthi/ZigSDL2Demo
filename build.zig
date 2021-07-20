const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    //const target = b.standardTargetOptions(.{ .default_target = .{ .abi = .gnu }});
    const target = b.standardTargetOptions(.{ .default_target = .{}});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();
    
    //NOTE(Sevag):set this path to where you have installed
    //            the SDL2 libraries.
    const sdl_path = "d:\\w\\sdk\\SDL2-2.0.14\\";

    const exe = b.addExecutable("SDLDemo", "src/main.zig");
    exe.setTarget(target);
    exe.subsystem = .Windows;
    exe.setBuildMode(mode);

    exe.addIncludeDir(sdl_path ++ "Include");
    exe.addLibPath(sdl_path ++ "lib\\x64");
    b.installBinFile(sdl_path ++ "lib\\x64\\SDL2.dll", "SDL2.dll");
    exe.linkSystemLibrary("sdl2");
    exe.linkLibC();

    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
