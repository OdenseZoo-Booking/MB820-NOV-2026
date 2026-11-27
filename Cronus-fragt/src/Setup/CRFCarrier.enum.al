enum 50100 "CRF Carrier" implements "CRF ICarrier"
{
    Extensible = true;
    DefaultImplementation = "CRF ICarrier" = "CRF No Carrier";
    UnknownValueImplementation = "CRF ICarrier" = "CRF No Carrier";

    value(0; " ")
    {
        Caption = ' ';
        Implementation = "CRF ICarrier" = "CRF No Carrier";
    }
    value(1; "Carrier A")
    {
        Caption = 'Carrier A';
        Implementation = "CRF ICarrier" = "CRF Carrier A";
    }
    value(2; "Carrier B")
    {
        Caption = 'Carrier B';
        Implementation = "CRF ICarrier" = "CRF Carrier B";
    }
}
