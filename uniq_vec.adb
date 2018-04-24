package body Uniq_Vec with SPARK_Mode is

   function Uniq (S : Vector) return Vector is
   begin
      return Result : Vector (Length (S)) do
         for Index in First_Index (S) .. Last_Index (S) loop
            --  these two loop invariants are needed together to prove that
            --  the result vector has enough capacity to allow "Append".
            pragma Loop_Invariant (Index - First_Index (S) < Integer (Length (S)));
            pragma Loop_Invariant (Integer (Length (Result)) <= Index - First_Index (S));
            --  the following loop invariants are just copies of the
            --  postcondition...
            pragma Loop_Invariant
              ((for all I in First_Index (Result) .. Last_Index (Result) =>
                 (for all K in First_Index (Result) .. Last_Index (Result) =>
                      (if I /= K then Element (Result, I) /= Element (Result, K)))));
            pragma Loop_Invariant
              ((for all I in First_Index (Result) .. Last_Index (Result) =>
                 Contains (S, Element (Result, I))));
            --  though the last one is modified to express that the property
            --  holds only up to a certain point.
            pragma Loop_Invariant
              ((for all I in First_Index (S) .. Index - 1 => Contains (Result, Element (S, I))));
            if not Contains (Result, Element (S, Index)) then
               Append (Result, Element (S, Index));
            end if;
         end loop;
      end return;
   end Uniq;

end Uniq_Vec;
