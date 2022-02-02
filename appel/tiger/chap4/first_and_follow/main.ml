(*
 * Z -> d | XYZ
 * Y -> e | c
 * X -> Y | a
 *)

(*
 * first(X) = a | c
 * first(Y) = c
 * first(Z) = a | c | d
 * These are all within the context of that particular symbol
 *)

type sym = string

type y =
  | ()
  | Sym of sym
type x =
  | Y of y
  | Sym of sym
type z =
  | XYZ of x * y * z
  | Sym of sym


