workspace "Solution_Name"
    architecture "x86_64"
    configurations { "Debug", "Development", "Distribution" }

project "Project_Name"
    kind "ConsoleApp"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}/%{prj.name}"
    objdir "bin-int/%{cfg.buildcfg}/%{prj.name}"

    files { "include/**.h", "src/**.cpp" }

    includedirs {
        "include"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        optimize "Off"
        symbols "On"

    filter "configurations:Development"
        defines { "DEV" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Distribution"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"
