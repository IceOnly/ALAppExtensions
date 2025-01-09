// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.ExternalFileStorage;

/// <summary>
/// Holds the information for all file accounts that are registered via the File Share connector
/// </summary>
table 4570 "Ext. File Share Account"
{
    Access = Internal;
    DataClassification = CustomerContent;
    Caption = 'Azure File Share Account';

    fields
    {
        field(1; "Id"; Guid)
        {
            DataClassification = SystemMetadata;
            Caption = 'Primary Key';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name of account';
            ToolTip = 'Specifies the name of the storage account connection.';
        }
        field(3; "Storage Account Name"; Text[2048])
        {
            Caption = 'Storage Account Name';
            ToolTip = 'Specifies the Azure Storage name.';
        }
        field(4; "File Share Name"; Text[2048])
        {
            Caption = 'File Share Name';
            ToolTip = 'Specifies the Azure File Share name.';
        }
        field(7; "Authorization Type"; Enum "Ext. File Share Auth. Type")
        {
            Caption = 'Authorization Type';
            ToolTip = 'The way of authorizing used to access the Blob Storage.';
        }
        field(8; "Secret Key"; Guid)
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }

    var
        UnableToGetSecretMsg: Label 'Unable to get File Share Account secret.';
        UnableToSetSecretMsg: Label 'Unable to set File Share Account secret.';

    trigger OnDelete()
    begin
        if not IsNullGuid(Rec."Secret Key") then
            if IsolatedStorage.Delete(Rec."Secret Key") then;
    end;

    procedure SetSecret(Secret: SecretText)
    begin
        if IsNullGuid(Rec."Secret Key") then
            Rec."Secret Key" := CreateGuid();

        if not IsolatedStorage.Set(Format(Rec."Secret Key"), Secret, DataScope::Company) then
            Error(UnableToSetSecretMsg);
    end;

    procedure GetSecret(SecretKey: Guid) Secret: SecretText
    begin
        if not IsolatedStorage.Get(Format(SecretKey), DataScope::Company, Secret) then
            Error(UnableToGetSecretMsg);
    end;
}