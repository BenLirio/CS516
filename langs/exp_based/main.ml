type exp =
  | Var of string
  | Const of int64
  | Add of exp * exp
  | Mult of exp * exp
  | Neg of exp

let e1 : exp = Mult (Const 2L, Const 3L)

type ctxt = (string * int64) list

let ctxt0 : ctxt = [("v", 1L)]

let rec lookup (s : string) (c : ctxt) : int64 =
  match c with
  | [] -> raise Not_found
  | (s', v) :: rest -> if s' = s then v else lookup s rest

let rec interpret (c : ctxt) (e : exp) : int64 =
  match e with
  | Var(s) -> lookup s c
  | Const(v) -> v
  | Add(e', e'') -> Int64.add (interpret c e') (interpret c e'')
  | Mult(e', e'') -> Int64.mul (interpret c e') (interpret c e'')
  | Neg(e') -> Int64.mul (-1L) (interpret c e')

let () =
  Printf.printf "%Ld\n" (interpret ctxt0 e1)
