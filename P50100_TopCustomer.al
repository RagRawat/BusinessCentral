page 50120 TopCustomers
{
    PageType = List;
    SourceTable = TopCustomer;
    UsageCategory = Lists;
    

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo;EntryNo)
                {
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Name";"Customer Name")
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                { ApplicationArea = All; }
                field("Remaining Amount"; "Remaining Amount")
                { ApplicationArea = All; }
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
            
        }
    }
}