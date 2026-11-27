pageextension 50101 "CRF Business Man RC" extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Control16)
        {
            part(CRFFreightActivities; "CRF Freight Activities")
            {
                ApplicationArea = All;
            }
        }
    }
}