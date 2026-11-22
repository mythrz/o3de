// {BEGIN_LICENSE}
/*
 * Copyright (c) Contributors to the Open 3D Engine Project.
 * For complete copyright and license terms please see the LICENSE at the root of this distribution.
 *
 * SPDX-License-Identifier: Apache-2.0 OR MIT
 *
 */
// {END_LICENSE}

module;

#include <string>
#include <string_view>

export module ${NameLower}.core;

export namespace ${SanitizedCppName}::Core
{
    [[nodiscard]] inline std::string FormatGreeting(std::string_view name)
    {
        return "Hello from C++20 module, " + std::string(name);
    }
} // namespace ${SanitizedCppName}::Core
