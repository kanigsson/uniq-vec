# Example of SPARK using Vectors

This small example shows the implementation and proof of Leftpad in SPARK, to
answer this [challenge](https://twitter.com/Hillelogram/status/987432183072731138).

You can verify the proof using SPARK as follows:

$ gnatprove -P test --report=all --prover=cvc4,z3

and compile and run the simple test case as follows using [GNAT
Pro](https://www.adacore.com/gnatpro):

```bash

$ gprbuild -p -P test
$ ./obj/test_padding

```
