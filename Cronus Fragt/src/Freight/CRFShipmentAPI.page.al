page 50107 "CRF Shipment API"
{
    PageType = API;
    Caption = 'Shipment API';
    APIPublisher = 'cronus';
    APIGroup = 'freight';
    APIVersion = 'v1.0';
    EntityName = 'shipment';
    EntitySetName = 'shipments';
    EntityCaption = 'Shipment';
    EntitySetCaption = 'Shipments';
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTable = "CRF Shipment Header";
    Extensible = false;

    //{baseurl}/v2.0/{tenant id}/{environment}/api/cronus/freight/v1.0/{companies}/shipments

    layout
    {
        area(Content)
        {
            repeater(Records)
            {
                field(Id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }

                field(number; Rec."No.")
                {
                    Caption = 'No.';
                    Editable = false;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                }
                field(carrier; Rec.Carrier)
                {
                    Caption = 'Carrier';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(trackingNo; Rec."Tracking No.")
                {
                    Caption = 'Tracking No.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(totalWeight; Rec."Total Weight")
                {
                    Caption = 'Total Weight (kg)';
                }
                field(lastModifiedDateTieme; Rec.SystemModifiedAt)
                {
                    Caption = 'Last modified Date Time';
                    Editable = false;
                }
                part(shipmentLines; "CRF Shipment Line API")
                {
                    Caption = 'Shipment Lines';
                    EntityName = 'shipmentLine';
                    EntitySetName = 'shipmentLines';
                    SubPageLink = "Shipment No." = field("No.");
                }

            }
        }
    }
}