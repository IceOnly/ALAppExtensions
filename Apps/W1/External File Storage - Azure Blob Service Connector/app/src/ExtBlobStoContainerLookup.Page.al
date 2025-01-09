// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.ExternalFileStorage;

using System.Azure.Storage;

page 4562 "Ext. Blob Sto Container Lookup"
{
    Caption = 'Container Lookup';
    PageType = List;
    SourceTable = "ABS Container";
    Editable = false;
    Extensible = false;
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the Name of the container.';
                }
            }
        }
    }
}