
type id = string

type binop = Plus | Minus | Times | Div

type stm = 
| CompoundStm of stm * stm
| AssignStm of id * exp
| PrintStm of exp list
and
exp = 
| IdExp of id
| NumExp of int
| OpExp of exp * binop * exp
| EseqExp of stm * exp

type var = string
type state = var -> int
let lookup (state : state) (id : id) =
  state id

let rec set_var (state : state) (id : id) (exp : exp) =
  fun id' -> if id = id' then (interpret_expression state exp) else lookup state id'
and interpret_expression (s: state) (expression : exp) =
  match expression with
  | IdExp id -> s
  | NumExp digit -> s
  | OpExp (exp, binop, exp') -> s
  | EseqExp (stm, exp) -> s


let rec interpret (s: state) (statement : stm) =
  match statement with
  | CompoundStm(stm, stm') -> interpret (interpret s stm) stm'
  | AssignStm(id, exp) -> s
  | PrintStm(exp_list) -> s

let () = 
  let prog = CompoundStm(
    AssignStm(
      "x",
      NumExp(
        3
      )
      ),
      CompoundStm(
        AssignStm(
          "y",
          OpExp(
            IdExp(
              "x"
    ),
    Times,
    NumExp(
      3
            )
    )
          ),
          PrintStm(
            [
              NumExp(
                1
        );
        IdExp(
          "x"
              );
              IdExp(
                "y"
        )
            ]
              )
          )
      )
  in
  Printf.printf "%d\n" ((interpret (fun _ -> 0) prog) "x")
