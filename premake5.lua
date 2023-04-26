project "glm"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "glm/**.hpp",
        "glm/**.inl"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "on"
        
    filter "configurations:Debug"
        defines "NIT_DEBUG"
        runtime "Debug"
        symbols "on"
        
    filter "configurations:Release"
        defines "NIT_RELEASE"
        runtime "Release"
        optimize "on"
