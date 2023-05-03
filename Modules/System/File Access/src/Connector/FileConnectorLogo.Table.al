// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

table 70002 "File Connector Logo"
{
    DataClassification = SystemMetadata;
    Access = Internal;
    InherentPermissions = X;
    InherentEntitlements = X;

    fields
    {
        field(1; Connector; Enum "File Connector")
        {
            DataClassification = SystemMetadata;
        }
        field(2; Logo; Media)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Connector)
        {
            Clustered = true;
        }
    }

}