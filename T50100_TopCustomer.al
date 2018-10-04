table 50120 TopCustomer
{
    Caption = 'Top Customer';

    fields
    {
        field(1;EntryNo;Integer){}
        field(2;"Customer No.";Code[50]){}
        field(3;Amount;Decimal){}
        field(4;"Remaining Amount";Decimal){}
        field(5;"Customer Name";Text[50]){}
    }

    keys
    {
        key(PK;EntryNo)
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    var
    tc: Record TopCustomer;
    begin
        IF tc.FindLast() then
            EntryNo := tc.EntryNo + 1
            ELSE
            EntryNo := 1;
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}