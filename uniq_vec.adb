package body Uniq_Vec with SPARK_Mode is

   function Uniq (S : Vector) return Vector is
   begin
      return Result : Vector (Length (S)) := Empty_Vector do
         for Index in First_Index (S) .. Last_Index (S) loop
            pragma Loop_Invariant (Index - First_Index (S) < Integer (Length (S)));
            pragma Loop_Invariant (Integer (Length (Result)) <= Index - First_Index (S));
            pragma Loop_Invariant
              ((for all I in First_Index (Result) .. Last_Index (Result) =>
                 (for all K in First_Index (Result) .. Last_Index (Result) =>
                      (if I /= K then Element (Result, I) /= Element (Result, K)))));
            pragma Loop_Invariant
              ((for all I in First_Index (S) .. Index - 1 => Contains (Result, Element (S, I))));
            pragma Loop_Invariant
              ((for all I in First_Index (Result) .. Last_Index (Result) =>
                 Contains (S, Element (Result, I))));
            if not Contains (Result, Element (S, Index)) then
               Append (Result, Element (S, Index));
            end if;
         end loop;
      end return;
   end Uniq;

end Uniq_Vec;
