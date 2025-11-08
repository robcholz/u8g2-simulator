set_project("U8G2Simulator")
set_languages("c99", "cxx23")
add_rules("mode.debug", "mode.release")

add_requires("libsdl >=2.0", { configs = { shared = true } })

target("u8g2")
set_kind("static")
add_files("components/u8g2/csrc/*.c")
add_includedirs("components/u8g2/csrc", "components/u8g2/cppsrc", { public = true })

target("U8G2Simulator")
set_kind("binary")
add_files(
        "main.cpp",
        "components/u8g2/sys/sdl/common/u8x8_d_sdl_128x64.c",
        "components/u8g2/sys/sdl/common/u8x8_sdl_key.c"
)
add_includedirs("components/u8g2/csrc", "components/u8g2/sys/sdl/common")
add_deps("u8g2")

add_packages("libsdl")