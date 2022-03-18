{

exception Error of string

type tok =
   | PLUS
   | EOF

}

let white = [' ' '\t' '\n']+

rule read =
  parse
  | white    { read lexbuf }
  | "+"      { PLUS }
  | eof      { EOF }
  | _        { raise (Error (Printf.sprintf "At offset %d: unexpected character." (Lexing.lexeme_start lexbuf))) }


