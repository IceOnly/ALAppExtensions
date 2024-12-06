// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.DataMigration.SL;

using System.Security.AccessControl;

permissionsetextension 47002 "SLD365 BASIC ISV - MSL" extends "D365 BASIC ISV"
{
    Permissions = tabledata "SL AccountTransactions" = RIMD,
                  tabledata "SL Account" = RIMD,
                  tabledata "SL Account Staging" = RIMD,
                  tabledata "SL Account Staging Setup" = RIMD,
                  tabledata "SL AcctHist" = RIMD,
                  tabledata "SL APAdjust" = RIMD,
                  tabledata "SL APDoc" = RIMD,
                  tabledata "SL APSetup" = RIMD,
                  tabledata "SL APTran" = RIMD,
                  tabledata "SL AP_Balances" = RIMD,
                  tabledata "SL ARAdjust" = RIMD,
                  tabledata "SL ARDoc" = RIMD,
                  tabledata "SL ARSetup" = RIMD,
                  tabledata "SL ARTran" = RIMD,
                  tabledata "SL AR_Balances" = RIMD,
                  tabledata "SL Batch" = RIMD,
                  tabledata "SL Codes" = RIMD,
                  tabledata "SL Company Additional Settings" = RIMD,
                  tabledata "SL Company Migration Settings" = RIMD,
                  tabledata "SL Customer" = RIMD,
                  tabledata "SL Fiscal Periods" = RIMD,
                  tabledata "SL FlexDef" = RIMD,
                  tabledata "SL GLSetup" = RIMD,
                  tabledata "SL GLTran" = RIMD,
                  tabledata "SL Hist. Source Error" = RIMD,
                  tabledata "SL Hist. Source Progress" = RIMD,
                  tabledata "SL INSetup" = RIMD,
                  tabledata "SL INTran" = RIMD,
                  tabledata "SL Inventory" = RIMD,
                  tabledata "SL InventoryADG" = RIMD,
                  tabledata "SL ItemCost" = RIMD,
                  tabledata "SL ItemSite" = RIMD,
                  tabledata "SL LotSerMst" = RIMD,
                  tabledata "SL LotSerT" = RIMD,
                  tabledata "SL Migration Config" = RIMD,
                  tabledata "SL Migration Error Overview" = RIMD,
                  tabledata "SL Migration Errors" = RIMD,
                  tabledata "SL Migration Warnings" = RIMD,
                  tabledata "SL Payment Terms" = RIMD,
                  tabledata "SL POAddress" = RIMD,
                  tabledata "SL POReceipt" = RIMD,
                  tabledata "SL POSetup" = RIMD,
                  tabledata "SL POTran" = RIMD,
                  tabledata "SL PurchOrd" = RIMD,
                  tabledata "SL PurOrdDet" = RIMD,
                  tabledata "SL SalesTax" = RIMD,
                  tabledata "SL SegDef" = RIMD,
                  tabledata "SL Segments" = RIMD,
                  tabledata "SL Segment Name" = RIMD,
                  tabledata "SL Site" = RIMD,
                  tabledata "SL SOAddress" = RIMD,
                  tabledata "SL SOHeader" = RIMD,
                  tabledata "SL SOLine" = RIMD,
                  tabledata "SL SOSetup" = RIMD,
                  tabledata "SL SOShipHeader" = RIMD,
                  tabledata "SL SOShipLine" = RIMD,
                  tabledata "SL SOShipLot" = RIMD,
                  tabledata "SL SOType" = RIMD,
                  tabledata "SL Terms" = RIMD,
                  tabledata "SL Upgrade Settings" = RIMD,
                  tabledata "SL Vendor" = RIMD,
                  tabledata SLGLAcctBalByPeriod = RIMD,
                  tabledata "SL Period List Work Table" = RIMD;
}