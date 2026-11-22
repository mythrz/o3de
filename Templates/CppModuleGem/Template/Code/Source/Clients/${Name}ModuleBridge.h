// {BEGIN_LICENSE}
/*
 * Copyright (c) Contributors to the Open 3D Engine Project.
 * For complete copyright and license terms please see the LICENSE at the root of this distribution.
 *
 * SPDX-License-Identifier: Apache-2.0 OR MIT
 *
 */
// {END_LICENSE}

#pragma once

#include <string>
#include <string_view>

namespace ${SanitizedCppName}
{
    [[nodiscard]] std::string GetModuleGreeting(std::string_view name);
} // namespace ${SanitizedCppName}
