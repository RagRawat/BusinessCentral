pageextension 50110 CustAddPage extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Navigation)
        {
            RunObject
                //RunObject = Page booklist;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = True;
                Image = Agreement;
        }

    }
    
    var
        myInt: Integer;
}