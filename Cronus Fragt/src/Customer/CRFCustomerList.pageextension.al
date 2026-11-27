// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace CronusFragt.Sales;

using Microsoft.Sales.Customer;


pageextension 50100 "CRF Customer List" extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(CRFHello)
            {
                ApplicationArea = All;
                Caption = 'Hello From Cronus Fragt';
                ToolTip = 'Shows a greeting from the Cronus Fragt extension.';

                trigger OnAction()
                var
                    GreetingTxt: Label 'Hello %1, Cronus Fragt is Running.', Comment = '%1 = the user ID';
                    Greeting: Text;
                begin
                    Greeting := StrSubstNo(GreetingTxt, UserId());
                    Message(Greeting);
                end;
            }
        }
    }
}