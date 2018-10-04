page 50102 ModifiedCustomer
{
    PageType = List;
    SourceTable = customer;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = all  ;
                }
            }
        }
        area(factboxes)
        {
            
        }
    }
    
    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                    
                end;
            }
        }
    }
}