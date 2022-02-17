
let varX1 = 1L
let varX2 = 2L
let varX3 = 3L
let varX4 = 4L
let varX5 = 5L
let varX6 = 6L
let varX7 = 7L
let varX8 = 8L

let _ = 
  (*
  let p  = Ir1.SRC.example in
  let ir = Ir1.Compile.compile p in
  let s  = Ir1.IR.pp_program ir in
  print_endline s;
  *)
  let p  = Ir1lirio.SRC.example in
  let ir = Ir1lirio.Compile.compile p in
  let s  = Ir1lirio.IR.pp_program ir in
  print_endline s
