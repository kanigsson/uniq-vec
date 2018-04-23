with Ada.Containers.Formal_Vectors;

package Uniq_Vec with SPARK_Mode is

   package Int_Vec is new Ada.Containers.Formal_Vectors
     (Index_Type   => Natural,
      Element_Type => Integer,
      Bounded      => True);

   use Int_Vec;

   function Uniq (S : Vector) return Vector
     with Post =>
       ((for all I in First_Index (Uniq'Result) .. Last_Index (Uniq'Result) =>
          Contains (S, Element (Uniq'Result, I)))
        and then
          (for all I in First_Index (S) .. Last_Index (S) => Contains (Uniq'Result, Element (S, I)))
     and then
          (for all I in First_Index (Uniq'Result) .. Last_Index (Uniq'Result) =>
               (for all K in First_Index (Uniq'Result) .. Last_Index (Uniq'Result) =>
                      (if I /= K then Element (Uniq'Result, I) /= Element (Uniq'Result, K)))));
end Uniq_Vec;
