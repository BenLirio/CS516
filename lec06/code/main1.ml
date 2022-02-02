open Ir1

let varX1 = 1L
let varX2 = 2L
let varX3 = 3L
let varX4 = 4L
let varX5 = 5L
let varX6 = 6L
let varX7 = 7L
let varX8 = 8L
  
let _ = 
  let p  = SRC.example in
  let ir = Compile.compile p in
  let s  = IR.pp_program ir in
  print_endline s
