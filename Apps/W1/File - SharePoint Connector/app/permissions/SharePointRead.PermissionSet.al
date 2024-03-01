// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.FileSystem;

permissionset 80301 "SharePoint - Read"
{
    Assignable = false;
    Access = Public;
    Caption = 'SharePoint - Read';

    IncludedPermissionSets = "SharePoint - Objects";

    Permissions =
        tabledata "SharePoint Account" = r;
}
