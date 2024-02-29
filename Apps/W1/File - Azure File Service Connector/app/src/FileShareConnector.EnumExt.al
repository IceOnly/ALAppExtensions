// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.FileSystem;

/// <summary>
/// Enum extension to register the File Share connector.
/// </summary>
enumextension 80200 "File Share Connector" extends "File System Connector"
{
    /// <summary>
    /// The File Share connector.
    /// </summary>
    value(80200; "File Share")
    {
        Caption = 'File Share';
        Implementation = "File System Connector" = "File Share Connector Impl.";
    }
}