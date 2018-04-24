with Ada.Containers.Formal_Vectors;

package Uniq_Vec with SPARK_Mode is

   --  This example is most natural using "growing" arrays aka vector
   package Int_Vec is new Ada.Containers.Formal_Vectors
     (Index_Type   => Natural,
      Element_Type => Integer,
      Bounded      => True);

   use Int_Vec;

   -- after this "use" declaration, we can use the following subpograms on
   -- vectors:
   --   -- First_Index and Last_Index to know the bounds of the vector;
   --   -- Contains to know if a vector contains an element;
   --   -- Element to access the vector at a certain index;
   --   -- Append to append an element to a vector.

   --  return a vector which has the same elements as the argument [S], but
   --  contains no duplicates.
   function Uniq (S : Vector) return Vector
     with Post =>
        --  all elements of the result come from the argument [S]
       ((for all I in First_Index (Uniq'Result) .. Last_Index (Uniq'Result) =>
          Contains (S, Element (Uniq'Result, I)))
        and then
        --  all elements of the argument [S] are indeed in the result
          (for all I in First_Index (S) .. Last_Index (S) => Contains (Uniq'Result, Element (S, I)))
     and then
        --  the result does not contain duplicates
          (for all I in First_Index (Uniq'Result) .. Last_Index (Uniq'Result) =>
               (for all K in First_Index (Uniq'Result) .. Last_Index (Uniq'Result) =>
                      (if I /= K then Element (Uniq'Result, I) /= Element (Uniq'Result, K)))));
end Uniq_Vec;
