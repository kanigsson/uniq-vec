with Ada.Text_IO;
with Uniq_Vec; use Uniq_Vec;

procedure Test_Uniq is
   use Uniq_Vec.Int_Vec;
   V : Vector (10);
   type A is array (1 .. 7) of Integer;
   Init_Data : A := (1,2,0,2,9,9,1);
begin
   for Elt of Init_Data loop
      Append(V, Elt);
   end loop;
   declare
      Res : Vector := Uniq (V);
   begin
      for I in First_Index (Res) .. Last_Index (Res) loop
         Ada.Text_IO.Put_Line (Element (Res, I)'Img);
      end loop;
   end;
end Test_Uniq;
