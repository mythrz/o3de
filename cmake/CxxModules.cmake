#
# Copyright (c) Contributors to the Open 3D Engine Project.
# For complete copyright and license terms please see the LICENSE at the root of this distribution.
#
# SPDX-License-Identifier: Apache-2.0 OR MIT
#
#

# C++20 Modules and `import std` capability detection.
#
# O3DE keeps CMP0155 at OLD globally so existing non-module C++20 targets incur
# zero module-scanning overhead. Targets that opt in via `ly_add_target`
# (using `CXX_MODULE_FILES` in `*_files.cmake` or `SCAN_FOR_MODULES`) check
# `PAL_TRAIT_BUILD_CXX_MODULES_SUPPORTED` before enabling module compilation.

set(_o3de_cxx_modules_supported FALSE)
set(_o3de_cxx_import_std_supported FALSE)

if(NOT O3DE_SCRIPT_ONLY AND CMAKE_VERSION VERSION_GREATER_EQUAL "3.28")
    set(_o3de_generator_supports_modules FALSE)
    set(_o3de_generator_supports_import_std FALSE)

    if(CMAKE_GENERATOR STREQUAL "Ninja" OR CMAKE_GENERATOR STREQUAL "Ninja Multi-Config")
        set(_o3de_generator_supports_modules TRUE)
        set(_o3de_generator_supports_import_std TRUE)
    elseif(CMAKE_GENERATOR MATCHES "^Visual Studio 1[78]")
        set(_o3de_generator_supports_modules TRUE)
    endif()

    set(_o3de_compiler_supports_modules FALSE)
    set(_o3de_compiler_supports_import_std FALSE)

    if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "19.34")
            set(_o3de_compiler_supports_modules TRUE)
        endif()
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "19.36")
            set(_o3de_compiler_supports_import_std TRUE)
        endif()
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        # Exclude AppleClang (uses separate compiler ID "AppleClang")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "16.0")
            set(_o3de_compiler_supports_modules TRUE)
        endif()
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "18.1.2")
            set(_o3de_compiler_supports_import_std TRUE)
        endif()
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "14.0")
            set(_o3de_compiler_supports_modules TRUE)
        endif()
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "15.0")
            set(_o3de_compiler_supports_import_std TRUE)
        endif()
    endif()

    if(_o3de_generator_supports_modules AND _o3de_compiler_supports_modules)
        set(_o3de_cxx_modules_supported TRUE)
    endif()

    if(_o3de_cxx_modules_supported
       AND CMAKE_VERSION VERSION_GREATER_EQUAL "4.5"
       AND _o3de_generator_supports_import_std
       AND _o3de_compiler_supports_import_std)
        set(_o3de_cxx_import_std_supported TRUE)
    endif()
endif()

ly_set(PAL_TRAIT_BUILD_CXX_MODULES_SUPPORTED ${_o3de_cxx_modules_supported})
ly_set(PAL_TRAIT_BUILD_CXX_IMPORT_STD_SUPPORTED ${_o3de_cxx_import_std_supported})

# File extensions recognized as C++20 module interface units
ly_set(O3DE_CXX_MODULE_EXTENSIONS ".ixx" ".cppm" ".ccm" ".cxxm")

unset(_o3de_cxx_modules_supported)
unset(_o3de_cxx_import_std_supported)
unset(_o3de_generator_supports_modules)
unset(_o3de_generator_supports_import_std)
unset(_o3de_compiler_supports_modules)
unset(_o3de_compiler_supports_import_std)
