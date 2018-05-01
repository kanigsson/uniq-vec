# Example of SPARK using Vectors

This small example shows the implementation and proof of Uniq in SPARK, to
answer this
[challenge](https://twitter.com/Hillelogram/status/987432183072731138). The
example defines a function that accepts a vector as argument, and returns a
vector that contains the same elements, with duplicates removed.

You can verify the proof using SPARK as follows:

$ gnatprove -P uniq --prover=cvc4,z3

and compile and run the simple test case as follows using [GNAT
Pro](https://www.adacore.com/gnatpro):

```bash

$ gprbuild -p -P uniq
$ ./obj/test_uniq

```
