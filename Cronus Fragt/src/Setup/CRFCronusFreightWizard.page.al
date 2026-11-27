page 50101 "CRF Cronus Freight Wizard"
{
    Caption = 'Set up Cronus Freight';
    PageType = NavigatePage;
    SourceTable = "CRF Freight Setup";
    SourceTableTemporary = true;


    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(StandardBanner)
            {
                ShowCaption = false;
                Editable = false;
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                ShowCaption = false;
                Editable = false;
                Visible = TopBannerVisible and FinishActionEnabled;
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(Step1)
            {
                ShowCaption = false;
                Visible = Step1Visible;
                group("Welcome to CRF Cronus Freight")
                {
                    Caption = 'Welcome';
                    Visible = Step1Visible;
                    group(Group18)
                    {
                        ShowCaption = false;
                        InstructionalText = 'This guide sets up the default carrier and the numbering of shipments.';
                    }
                }
                group(StepCarrier)
                {
                    Caption = 'Default carrier';
                    group(Group22)
                    {
                        ShowCaption = false;
                        InstructionalText = 'Select the carrier that you want to use on shipments, when there is no other carrier selected.';

                        field("Default Carrier"; Rec."Default Carrier")
                        {
                            ToolTip = 'Specifies the carrier that new shipments get by default.';
                        }
                    }
                }
            }

            group(Step2)
            {
                ShowCaption = false;
                Visible = Step2Visible;
                group(Group35)
                {
                    Caption = 'Shipment numbers';

                    field("Shipment Nos."; Rec."Shipment Nos.")
                    {
                        ToolTip = 'Specifies the number series that is used to number new shipments.';
                    }
                }
            }

            group(Step3)
            {
                ShowCaption = false;
                Visible = Step3Visible;
                group("That's it!")
                {
                    Caption = 'That''s it!';
                    group(Group25)
                    {
                        ShowCaption = false;
                        InstructionalText = 'To save this setup, choose Finish.';
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionBack)
            {
                Caption = '&Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                Caption = '&Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    NextStep(false);
                end;
            }
            action(ActionFinish)
            {
                Caption = '&Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction()
                begin
                    FinishAction();
                end;
            }
        }
    }



    trigger OnOpenPage()
    var
        FreightSetup: Record "CRF Freight Setup";
    begin
        Rec.Init();
        if FreightSetup.Get() then
            Rec.TransferFields(FreightSetup);
        Rec.Insert();

        Step := Step::Start;
        EnableControls();
    end;

    var
        MediaRepositoryDone: Record "Media Repository";
        MediaRepositoryStandard: Record "Media Repository";
        MediaResourcesDone: Record "Media Resources";
        MediaResourcesStandard: Record "Media Resources";
        Step: Option Start,Step2,Finish;
        BackActionEnabled: Boolean;
        FinishActionEnabled: Boolean;
        NextActionEnabled: Boolean;
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        TopBannerVisible: Boolean;

    local procedure EnableControls()
    begin
        ResetControls();

        case Step of
            Step::Start:
                ShowStep1();
            Step::Step2:
                ShowStep2();
            Step::Finish:
                ShowStep3();
        end;
    end;

    local procedure SaveSetup()
    var
        FreightSetup: Record "CRF Freight Setup";
    begin
        if not FreightSetup.Get() then begin
            FreightSetup.Init();
            FreightSetup.Insert();
        end;

        FreightSetup.TransferFields(Rec, false);
        FreightSetup.Modify(true);
    end;

    local procedure FinishAction()
    begin
        SaveSetup();
        CurrPage.Close();
    end;

    local procedure NextStep(Backwards: Boolean)
    begin
        if Backwards then
            Step := Step - 1
        else
            Step := Step + 1;

        EnableControls();
    end;

    local procedure ShowStep1()
    begin
        Step1Visible := true;

        FinishActionEnabled := false;
        BackActionEnabled := false;
    end;

    local procedure ShowStep2()
    begin
        Step2Visible := true;
    end;

    local procedure ShowStep3()
    begin
        Step3Visible := true;

        NextActionEnabled := false;
        FinishActionEnabled := true;
    end;

    local procedure ResetControls()
    begin
        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;

        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;
    end;


}