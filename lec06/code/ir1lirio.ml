type var = string
module SRC = struct
  type exp =
    | Var of var
    | Const of int64
    | Add of exp * exp
    | Mul of exp * exp
    | Neg of exp

  let example =
    Add(Mul(Var "X1", Const 2L), Neg(Var "X2"))
end
(* simple let language intermediate representation -------------------------- *)
module IR = struct
  (* Unique identifiers for temporaries. *)
  type uid = int

  (* "gensym" -- generate a new unique identifier *)
  let mk_uid : unit -> uid =
    let ctr = ref 0 in
    fun () -> let uid = !ctr in
      ctr := !ctr + 1;
      uid

  (* syntactic values / operands *)
  type opn = 
    | Id of uid
    | Const of int64
    | Var of var

  (* binary operations *)
  type bop =
    | Add
    | Mul
             
  (* instructions *)
  (* note that there is no nesting of operations! *)
  type insn =
    | Let of uid * bop * opn * opn

  type program = {
    insns: insn list;
    ret: opn
  }


  (* Pretty printing *)
  let pp_uid u = Printf.sprintf "tmp%d" u
  let pp_var x = Printf.sprintf "var%s" x
      
  let pp_opn = function 
    | Id u   -> pp_uid u
    | Const c -> (Int64.to_string c)^"L"
    | Var x   -> pp_var x

  let pp_bop = function
    | Add -> "add"
    | Mul -> "mul"

  let pp_insn = function
    | Let (u, bop, op1, op2) ->
      Printf.sprintf "let %s = %s %s %s"
        (pp_uid u) (pp_bop bop) (pp_opn op1) (pp_opn op2)

  let pp_program {insns; ret} =
    (String.concat " in\n" (List.map pp_insn insns)) ^
    (Printf.sprintf " in\n  ret %s" (pp_opn ret))


  module MLMeaning = struct
    let add = Int64.add
    let mul = Int64.mul
    let ret x = x
  end
  
end

module Compile = struct

  let compile_exp (e:SRC.exp) : (IR.insn list) * IR.opn = [], Const 3L

  let compile (e:SRC.exp) : IR.program =
    let insns, ret = compile_exp e in
    IR.{insns; ret}

end
