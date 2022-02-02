type insn =
  | IPushC of int64
  | IPushV of string
  | IMul
  | IAdd
  | INeg

type ctxt = (string * int64) list
type program = insn list
exception No_answer
exception Stack_empty
exception Not_found

type stack = int64 list
let rec lookup (s : string) (c : ctxt) =
  match c with
  | (s', n) :: rest -> if s' = s then n else lookup s rest
  | [] -> raise Not_found

let p1 = [ IPushC 2L; IPushC 3L; IMul ]

let step (c : ctxt) (s : stack) (i : insn) : stack =
  match (i, s) with
  | IPushC n, _ -> n :: s
  | IPushV x, _ -> lookup x c :: s
  | IMul, v1 :: v2 :: s -> Int64.mul v1 v2 :: s
  | IAdd, v1 :: v2 :: s -> Int64.add v1 v2 :: s
  | INeg, v1 :: s -> Int64.neg v1 :: s
  | _ -> raise Stack_empty

let rec execute (c : ctxt) (s : stack) (p : program) : stack =
  match p with
  | [] -> s
  | i :: cont -> execute c (step c s i) cont

let run (c : ctxt) (p : program) =
  match execute c [] p with
  | [h] -> h
  | _ -> raise No_answer

let () =
  Printf.printf "%Ld" (run [] p1)
