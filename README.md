#Zig SDL2 Demo

This demo is made possible by following an article written by Fabio Arnold

https://dev.to/fabioarnold/setup-zig-for-gamedev-2bmf


It is designed to be built on Windows OS, but a simple edit of the Build.zig file should make it possible to build on Linux.


#Building

Built using zig version 0.9.0-dev.463+3e8394776

https://ziglang.org/download/


If you don't already have SDL2, download and install it whereever you keep your SDK files.

https://libsdl.org/release/SDL2-devel-2.0.14-VC.zip


To get this working on your Windows system, edit the Build.zig file
and set the sdl_path to where you installed your sdl2 libraries.

