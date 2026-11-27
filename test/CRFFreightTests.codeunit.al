codeunit 90000 "CRF Freight Tests"
{
    // [FEATURE] [Cronus Fragt] [Shipment]
    Subtype = Test;
    TestPermissions = Disabled;

    // var
    //     Assert: Codeunit "Library Assert";

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure CarrierStatusBookedMapsToBooked()
    var
        CarrierA: Codeunit "CRF Carrier A";
        NewStatus: Enum "CRF Shipment Status";
    begin
        // [SCENARIO] The status text booked from Carrier A becomes Booked
        // [GIVEN] The status text that the carrier service sends for a booked parcel
        // [WHEN] Cronus Fragt maps the text
        NewStatus := CarrierA.StatusFromText('booked');
        // [THEN] The shipment status is Booked
        if "CRF Shipment Status"::Booked <> NewStatus then
            Error('booked must map to Booked');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure CarrierStatusInTransitMapsToInTransit()
    var
        CarrierA: Codeunit "CRF Carrier A";
        NewStatus: Enum "CRF Shipment Status";
    begin
        // [SCENARIO] The status text in_transit from Carrier A becomes In Transit
        // [GIVEN] The status text that the carrier service sends for a parcel on its way
        // [WHEN] Cronus Fragt maps the text
        NewStatus := CarrierA.StatusFromText('in_transit');
        // [THEN] The shipment status is In Transit
        if "CRF Shipment Status"::"In Transit" <> NewStatus then
            Error('in_transit must map to In Transit');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure CarrierStatusDeliveredMapsToDelivered()
    var
        CarrierA: Codeunit "CRF Carrier A";
        NewStatus: Enum "CRF Shipment Status";
    begin
        // [SCENARIO] The status text delivered from Carrier A becomes Delivered
        // [GIVEN] The status text that the carrier service sends for a delivered parcel
        // [WHEN] Cronus Fragt maps the text
        NewStatus := CarrierA.StatusFromText('delivered');
        // [THEN] The shipment status is Delivered
        if "CRF Shipment Status"::Delivered <> NewStatus then
            Error('delivered must map to Delivered');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure CarrierStatusIsCaseInsensitive()
    var
        CarrierA: Codeunit "CRF Carrier A";
        NewStatus: Enum "CRF Shipment Status";
    begin
        // [SCENARIO] The carrier may send the status in upper case
        // [GIVEN] The status text DELIVERED in upper case
        // [WHEN] Cronus Fragt maps the text
        NewStatus := CarrierA.StatusFromText('DELIVERED');
        // [THEN] The shipment status is still Delivered
        if "CRF Shipment Status"::Delivered <> NewStatus then
            Error('DELIVERED must map to Delivered');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure UnknownCarrierStatusRaisesError()
    var
        CarrierA: Codeunit "CRF Carrier A";
    begin
        // [SCENARIO] A status text Cronus Fragt doesn't know stops with a clear error
        // [GIVEN] The status text lost, which is not a known status
        // [WHEN] Cronus Fragt maps the text
        asserterror CarrierA.StatusFromText('lost');
        // [THEN] The unknown status error is raised
        if 'The carrier service reported the unknown status lost.' <> GetLastErrorText() then
            Error('Unexpected error message: %1', GetLastErrorText());
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure PackageWeightMustBePositive()
    var
        ShipmentLine: Record "CRF Shipment Line";
    begin
        // [SCENARIO] A package can't weigh zero
        // [GIVEN] A new shipment line
        ShipmentLine.Init();
        // [WHEN] The weight is set to 0
        asserterror ShipmentLine.Validate(Weight, 0);
        // [THEN] The error from module 3b is raised
        if 'The weight of a package must be greater than zero.' <> GetLastErrorText() then
            Error('Unexpected error message');
    end;
}