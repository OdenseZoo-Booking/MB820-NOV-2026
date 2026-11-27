page 50103 "CRF Shipment Card"
{
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "CRF Shipment Header";
    Caption = 'Shipment';

    AboutTitle = 'Shipment';
    AboutText = 'The shipment represents a *collection of packages* that i''m shipping to a customer or vendor.';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field(Carrier; Rec.Carrier)
                {
                    ToolTip = 'Specifies the value of the Carrier will be handling the packages';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Tracking No."; Rec."Tracking No.")
                {
                    ToolTip = 'Specifies the value of the Tracking No. field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Total Weight"; Rec."Total Weight")
                {
                    ToolTip = 'Specifies the value of the Total Weight (kg) field.', Comment = '%';
                }
            }
            part(Lines; "CRF Shipment Subform")
            {
                Caption = 'Packages';
                SubPageLink = "Shipment No." = field("No.");
                UpdatePropagation = Both;

                AboutTitle = 'Packages';
                AboutText = 'In this section you will find the packages that will be included in the shipment';
            }
            group(Shipping)
            {

                AboutTitle = 'Shipping Information';
                AboutText = 'In this section you will find control where the shipment is being shipped to';


                Caption = 'Ship-to';
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ToolTip = 'Specifies the value of the Ship-to Name field.', Comment = '%';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ToolTip = 'Specifies the value of the Ship-to Address field.', Comment = '%';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ToolTip = 'Specifies the value of the Ship-to Post Code field.', Comment = '%';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ToolTip = 'Specifies the value of the Ship-to City field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UpdateStatus)
            {
                Caption = 'Update Status';
                Image = Refresh;
                ToolTip = 'Gets the latest status of the shipment from the carrier.';

                trigger OnAction()
                var
                    FreightMgt: Codeunit "CRF Freight Mgt";
                begin
                    FreightMgt.UpdateStatus(Rec);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}