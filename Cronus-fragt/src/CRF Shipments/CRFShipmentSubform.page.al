page 50104 "CRF Shipment Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Packages';
    DelayedInsert = true;
    SourceTable = "CRF Shipment Line";

    layout
    {
        area(Content)
        {
            repeater(Packages)
            {

                field(Description; Rec.Description)
                {
                }
                field(Weight; Rec.Weight)
                {
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(Length; Rec.Length)
                {
                }
                field(Weidth; Rec.Weidth)
                {
                }
                field(Height; Rec.Height)
                {
                }
            }
        }
    }
}