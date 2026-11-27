using Microsoft.Sales.Customer;

pageextension 50102 "CRF Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CRF Default Carrier"; Rec."CRF Default Carrier")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the carrier that new shipments for this customer get by default.';
            }
        }
    }
}