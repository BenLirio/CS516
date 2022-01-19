type id = string

type binop = Plus | Minus | Times | Div

type stm = CompoundStm of stm * stm
| AssignStm of id * exp
| PrintStm of exp list
and
exp = 
| IdExp of id
| NumExp of int
| OpExp of exp * binop * exp
| EseqExp of stm * exp

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
