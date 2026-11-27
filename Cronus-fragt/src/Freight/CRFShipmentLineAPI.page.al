page 50108 "CRF Shipment Line API"
{
    PageType = API;
    Caption = 'Shipment Line API';
    APIPublisher = 'cronus';
    APIGroup = 'freight';
    APIVersion = 'v1.0';
    EntityName = 'shipmentLine';
    EntitySetName = 'shipmentLines';
    EntityCaption = 'Shipment Line';
    EntitySetCaption = 'Shipment Lines';
    SourceTable = "CRF Shipment Line";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field(id; Rec.SystemId)
                {
                    Caption = 'id';
                    Editable = false;
                }
                field(shipmentNo; Rec."Shipment No.")
                {
                    Caption = 'Shipment No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(weight; Rec.Weight)
                {
                    Caption = 'Weight (kg)';
                }
                field(length; Rec.Length)
                {
                    Caption = 'Length (cm)';
                }
                field(weidth; Rec.Weidth)
                {
                    Caption = 'Weidth (cm)';
                }
                field(height; Rec.Height)
                {
                    Caption = 'Height (cm)';
                }
                field(LastModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'LastModifiedAtDateTime';
                    Editable = false;
                }
            }
        }
    }
}