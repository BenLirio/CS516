open Code
open Simple

(* We can write a program that runs the SIMPLE factorial program like this: *)
let () =
  let s_ans = interpret_cmd init_state factorial in
  Printf.printf "ANS = %d\n" (lookup s_ans "ANS")

(*
Exercise: 
Modify `factorial` and `main` so they would take a command-line input
as a number to compute the factorial of.
Use `Sys.argv` for command-line arguments, and `int_of_string` to parse an integer.
*)
