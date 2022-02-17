open Ir2


let varX1 = ref 1L
let varX2 = ref 2L
let varX3 = ref 3L
let varX4 = ref 4L
let varX5 = ref 5L
let varX6 = ref 6L
let varX7 = ref 7L
let varX8 = ref 8L

let _ = 
  let print_ith_cmd i cmd =
    Printf.printf "Basic: %d\n" i;
    cmd |> Compile.compile |> IR.pp_program |> print_endline
  in
  List.iteri print_ith_cmd SRC.basic_cmds
