pageextension 50122 RoleCenterCheck extends "Order Processor Role Center"
{
    actions
    {
        addbefore(Items)
        {
            action(topCustomer)
            {
                RunObject = page TopCustomers;
                Promoted = true;
                PromotedIsBig = true;
            }
        }
    }   
}