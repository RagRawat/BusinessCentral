pageextension 50110 CustAddPage extends "Customer Card"
{
  
    actions
    {
        // Add changes to page actions here
        addlast(Navigation)
        {
            action(Check)
            {
                RunObject = page Currencies;
                Promoted = true;
                PromotedCategory = Process;
                Image = Agreement;
            }           
        }
    }
}