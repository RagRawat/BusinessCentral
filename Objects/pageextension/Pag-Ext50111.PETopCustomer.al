pageextension 50111 "PETopCustomer" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addfirst("&Customer")
        {
            action("Top Customer")
            {
                RunObject = page TopCustomers;
                Promoted = true;
                PromotedIsBig = true;
            }
            action("Add Data")
            {
                trigger OnAction();
                var

                begin
                    //IF tc.Findlast then
                    //    EntNo := tc.EntryNo + 1
                    //ELSE
                    //    EntNo := 1;
                    TCDel.reset;
                    TCDel.DeleteAll();
                    Cust.Reset;
                    IF Cust.Findset THEN begin
                        Repeat

                            CLE.RESET;
                            CLE.SETCURRENTKEY("Customer No.", "Posting Date");
                            CLE.SETRANGE("Customer No.", Cust."No.");
                            IF NOT CLE.ISEMPTY THEN BEGIN
                                IF CLE.FINDSET THEN BEGIN

                                    REPEAT
                                        CLE.CALCFIELDS("Amount (LCY)", "Remaining Amt. (LCY)");
                                        //CLE.CalcSums("Amount (LCY)","Remaining Amt. (LCY)");
                                        TC.RESET;
                                        //        IF TCust.ISEMPTY THEN
                                        IF TC.FINDLAST THEN
                                            EntNo := EntNo + 1
                                        ELSE
                                            EntNo := 1;
                                        TC.INIT;
                                        TC.EntryNo := EntNo;
                                        TC."Customer No." := CLE."Customer No.";
                                        tc."Customer Name" := Cust.Name;
                                        TC.Amount += CLE."Amount (LCY)";
                                        TC."Remaining Amount" += CLE."Remaining Amt. (LCY)";
                                        IF NOT TC.INSERT THEN
                                            TC.MODIFY;
                                    UNTIL CLE.NEXT = 0;
                                END;
                            END;
                        Until Cust.next = 0;
                        Message('Done');
                    END;
                end;
            }
            action("Calculate Data")
            {
                trigger OnAction();
                var

                begin
                    //IF tc.Findlast then
                    //    EntNo := tc.EntryNo + 1
                    //ELSE
                    //    EntNo := 1;  
                    TCDel.reset;
                    TCDel.DeleteAll();
                    Cust.Reset;
                    //Cust.SetRange("No.", '10000');
                    IF Cust.Findset THEN begin
                        Repeat
                            Flag1 := true;
                            CLE.RESET;
                            CLE.SETCURRENTKEY("Customer No.", "Posting Date");
                            CLE.SETRANGE("Customer No.", Cust."No.");
                            cle.SetFilter("Remaining Amt. (LCY)", '<>%1', 0);
                            //IF NOT CLE.ISEMPTY THEN BEGIN
                            IF CLE.FINDSET THEN BEGIN
                                REPEAT
                                    Customer := cle."Customer No.";
                                    CLE.CALCFIELDS("Amount (LCY)", "Remaining Amt. (LCY)");
                                    //CLE.CalcSums("Amount (LCY)","Remaining Amt. (LCY)");
                                    //c +=1;
                                    //Message(Customer+FORMAT(c));
                                    //    IF Customer <> cust."No." then BEGIN
                                    IF Flag1 then BEGIN
                                        TC.RESET;
                                        //        IF TCust.ISEMPTY THEN
                                        IF TC.FINDLAST THEN
                                            EntNo := EntNo + 1
                                        ELSE
                                            EntNo := 1;
                                        TC.EntryNo := EntNo;
                                        TC."Customer No." := CLE."Customer No.";
                                        tc."Customer Name" := Cust.Name;
                                        TC.Amount := 0;
                                        TC."Remaining Amount" := 0;
                                        TC.INSERT;
                                        flag1 := false;
                                    END;
                                    //    END;
                                    //TC.INIT;
                                    //TC.EntryNo := EntNo;
                                    //TC."Customer No." := CLE."Customer No.";
                                    //tc."Customer Name" := cust.Name;
                                    TC.Amount += CLE."Amount (LCY)";
                                    TC."Remaining Amount" += CLE."Remaining Amt. (LCY)";
                                    //IF NOT TC.INSERT THEN
                                    TC.MODIFY;
                                UNTIL CLE.NEXT = 0;
                            END;
                            //END;
                        Until Cust.next = 0;
                        Message('Calculation Completed.');
                    END;
                end;
            }
        }
    }
    var
        Cust: Record Customer;
        CLE: Record "Cust. Ledger Entry";
        TC: Record TopCustomer;
        TCDel: Record TopCustomer;
        EntNo: integer;
        Customer: text[50];
        c: Integer;
        Flag1: Boolean;
}