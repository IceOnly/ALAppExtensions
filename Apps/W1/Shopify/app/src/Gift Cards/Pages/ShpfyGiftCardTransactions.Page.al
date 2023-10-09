namespace Microsoft.Integration.Shopify;

/// <summary>
/// Page Shpfy Gift Card Transactions (ID 30111).
/// </summary>
page 30111 "Shpfy Gift Card Transactions"
{
    Caption = 'Shopify Gift Card Transactions';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Shpfy Order Transaction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Shopify Transaction Id"; Rec."Shopify Transaction Id")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies a unique identifier for the transaction.';
                }
                field("Shopify Order Id"; Rec."Shopify Order Id")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies a unique identifier for the order.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the transaction type. Valid values are: authorization, capture, sale, void and refund.';
                }
                field(Gateway; Rec.Gateway)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the gateway the transaction was issued through.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the transaction. Valid values are: pending, failure, success and error.';
                }
                field("Message"; Rec.Message)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a string generated by the payment provider with additional information about why the transaction succeeded or failed.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount of money included in the transaction.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency of the transactions.';
                }
                field(Test; Rec.Test)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the transaction was created for a test mode Order or payment.';
                }
                field("Created At"; Rec."Created At")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time at which the transaction is processed.';
                }
                field(Authorization; Rec.Authorization)
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the authorization code associated with the transaction.';
                }
            }
        }
    }
}

