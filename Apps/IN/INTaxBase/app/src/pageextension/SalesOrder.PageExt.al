﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Sales.Document;

pageextension 18557 "Sales Order" extends "Sales Order"
{
    layout
    {
        addafter("Foreign Trade")
        {
            group("Tax Info")
            {
                Caption = 'Tax Information';
            }
        }
    }
}
