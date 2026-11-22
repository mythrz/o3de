// {BEGIN_LICENSE}
/*
 * Copyright (c) Contributors to the Open 3D Engine Project.
 * For complete copyright and license terms please see the LICENSE at the root of this distribution.
 *
 * SPDX-License-Identifier: Apache-2.0 OR MIT
 *
 */
// {END_LICENSE}

#include <AzTest/AzTest.h>

#include <Clients/${Name}ModuleBridge.h>

TEST(${SanitizedCppName}ModuleTest, FormatGreetingReturnsExpectedText)
{
    const std::string greeting = ${SanitizedCppName}::GetModuleGreeting("O3DE");
    EXPECT_EQ(greeting, "Hello from C++20 module, O3DE");
}

AZ_UNIT_TEST_HOOK(DEFAULT_UNIT_TEST_ENV);
