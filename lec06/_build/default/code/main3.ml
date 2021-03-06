open Ir3

let varX1 = ref 1L
let varX2 = ref 2L
let varX3 = ref 3L
let varX4 = ref 4L
let varX5 = ref 5L
let varX6 = ref 6L
let varX7 = ref 7L
let varX8 = ref 8L


let _ = 
  let p  = SRC.example_branch in
  let ir = Compile.compile p in
  let s  = IR.pp_program ir in
  print_endline s;

  let q = SRC.factorial in
  let qir = Compile.compile q in
  let qs  = IR.pp_program qir in
  print_endline qs
