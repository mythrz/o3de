// {BEGIN_LICENSE}
/*
 * Copyright (c) Contributors to the Open 3D Engine Project.
 * For complete copyright and license terms please see the LICENSE at the root of this distribution.
 *
 * SPDX-License-Identifier: Apache-2.0 OR MIT
 *
 */
// {END_LICENSE}

#include "Clients/${Name}ModuleBridge.h"

import ${NameLower}.core;

namespace ${SanitizedCppName}
{
    std::string GetModuleGreeting(std::string_view name)
    {
        return Core::FormatGreeting(name);
    }
} // namespace ${SanitizedCppName}
