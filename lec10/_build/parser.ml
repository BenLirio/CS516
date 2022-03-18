
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR of (
# 11 "parser.mly"
       (Range.t * string)
# 15 "parser.ml"
  )
    | TRUE of (
# 18 "parser.mly"
       (Range.t)
# 20 "parser.ml"
  )
    | TILDE of (
# 17 "parser.mly"
       (Range.t)
# 25 "parser.ml"
  )
    | RPAREN of (
# 16 "parser.mly"
       (Range.t)
# 30 "parser.ml"
  )
    | LPAREN of (
# 15 "parser.mly"
       (Range.t)
# 35 "parser.ml"
  )
    | FALSE of (
# 19 "parser.mly"
       (Range.t)
# 40 "parser.ml"
  )
    | EOF
    | BAR of (
# 13 "parser.mly"
       (Range.t)
# 46 "parser.ml"
  )
    | ARR of (
# 12 "parser.mly"
       (Range.t)
# 51 "parser.ml"
  )
    | AMPER of (
# 14 "parser.mly"
       (Range.t)
# 56 "parser.ml"
  )
  
end

include MenhirBasics

# 1 "parser.mly"
  
open Ast;;

# 67 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState03 : (('s, _menhir_box_toplevel) _menhir_cell1_TILDE, _menhir_box_toplevel) _menhir_state
    (** State 03.
        Stack shape : TILDE.
        Start symbol: toplevel. *)

  | MenhirState04 : (('s, _menhir_box_toplevel) _menhir_cell1_LPAREN, _menhir_box_toplevel) _menhir_state
    (** State 04.
        Stack shape : LPAREN.
        Start symbol: toplevel. *)

  | MenhirState09 : (('s, _menhir_box_toplevel) _menhir_cell1_b3 _menhir_cell0_AMPER, _menhir_box_toplevel) _menhir_state
    (** State 09.
        Stack shape : b3 AMPER.
        Start symbol: toplevel. *)

  | MenhirState12 : (('s, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_BAR, _menhir_box_toplevel) _menhir_state
    (** State 12.
        Stack shape : b2 BAR.
        Start symbol: toplevel. *)

  | MenhirState14 : (('s, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_ARR, _menhir_box_toplevel) _menhir_state
    (** State 14.
        Stack shape : b2 ARR.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_b2 = 
  | MenhirCell1_b2 of 's * ('s, 'r) _menhir_state * (Ast.bexp)

and ('s, 'r) _menhir_cell1_b3 = 
  | MenhirCell1_b3 of 's * ('s, 'r) _menhir_state * (Ast.bexp)

and 's _menhir_cell0_AMPER = 
  | MenhirCell0_AMPER of 's * (
# 14 "parser.mly"
       (Range.t)
# 111 "parser.ml"
)

and 's _menhir_cell0_ARR = 
  | MenhirCell0_ARR of 's * (
# 12 "parser.mly"
       (Range.t)
# 118 "parser.ml"
)

and 's _menhir_cell0_BAR = 
  | MenhirCell0_BAR of 's * (
# 13 "parser.mly"
       (Range.t)
# 125 "parser.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state * (
# 15 "parser.mly"
       (Range.t)
# 132 "parser.ml"
)

and ('s, 'r) _menhir_cell1_TILDE = 
  | MenhirCell1_TILDE of 's * ('s, 'r) _menhir_state * (
# 17 "parser.mly"
       (Range.t)
# 139 "parser.ml"
)

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of (Ast.bexp) [@@unboxed]

let _menhir_action_01 =
  fun l r ->
    (
# 38 "parser.mly"
                  ( Imp(l, r) )
# 150 "parser.ml"
     : (Ast.bexp))

let _menhir_action_02 =
  fun b ->
    (
# 39 "parser.mly"
         ( b )
# 158 "parser.ml"
     : (Ast.bexp))

let _menhir_action_03 =
  fun l r ->
    (
# 42 "parser.mly"
                  ( Or(l, r) )
# 166 "parser.ml"
     : (Ast.bexp))

let _menhir_action_04 =
  fun b ->
    (
# 43 "parser.mly"
         ( b )
# 174 "parser.ml"
     : (Ast.bexp))

let _menhir_action_05 =
  fun l r ->
    (
# 46 "parser.mly"
                    ( And(l, r) )
# 182 "parser.ml"
     : (Ast.bexp))

let _menhir_action_06 =
  fun b ->
    (
# 47 "parser.mly"
         ( b )
# 190 "parser.ml"
     : (Ast.bexp))

let _menhir_action_07 =
  fun b ->
    (
# 50 "parser.mly"
               ( Not(b) )
# 198 "parser.ml"
     : (Ast.bexp))

let _menhir_action_08 =
  fun b ->
    (
# 51 "parser.mly"
         ( b )
# 206 "parser.ml"
     : (Ast.bexp))

let _menhir_action_09 =
  fun () ->
    (
# 54 "parser.mly"
          ( True )
# 214 "parser.ml"
     : (Ast.bexp))

let _menhir_action_10 =
  fun () ->
    (
# 55 "parser.mly"
          ( False )
# 222 "parser.ml"
     : (Ast.bexp))

let _menhir_action_11 =
  fun x ->
    (
# 56 "parser.mly"
            ( Var (snd x) )
# 230 "parser.ml"
     : (Ast.bexp))

let _menhir_action_12 =
  fun b ->
    (
# 57 "parser.mly"
                       ( b )
# 238 "parser.ml"
     : (Ast.bexp))

let _menhir_action_13 =
  fun b ->
    (
# 35 "parser.mly"
         ( b )
# 246 "parser.ml"
     : (Ast.bexp))

let _menhir_action_14 =
  fun b ->
    (
# 32 "parser.mly"
               ( b )
# 254 "parser.ml"
     : (Ast.bexp))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AMPER _ ->
        "AMPER"
    | ARR _ ->
        "ARR"
    | BAR _ ->
        "BAR"
    | EOF ->
        "EOF"
    | FALSE _ ->
        "FALSE"
    | LPAREN _ ->
        "LPAREN"
    | RPAREN _ ->
        "RPAREN"
    | TILDE _ ->
        "TILDE"
    | TRUE _ ->
        "TRUE"
    | VAR _ ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_22_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _v _tok ->
      let _v =
        let b = _v in
        _menhir_action_13 b
      in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let b = _v in
          let _v = _menhir_action_14 b in
          MenhirBox_toplevel _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_07_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_06 b in
      _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AMPER _v_0 ->
          let _menhir_stack = MenhirCell1_b3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | ARR _ | BAR _ | EOF | RPAREN _ ->
          let b = _v in
          let _v = _menhir_action_04 b in
          _menhir_goto_b2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b3 -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _menhir_stack = MenhirCell0_AMPER (_menhir_stack, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_0 in
          let _v = _menhir_action_11 x in
          _menhir_run_06_spec_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TRUE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_06_spec_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TILDE _v_4 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState09
      | LPAREN _v_5 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState09
      | FALSE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_06_spec_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06_spec_09 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b3 _menhir_cell0_AMPER -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_08 b in
      _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b3 _menhir_cell0_AMPER -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_AMPER (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_b3 (_menhir_stack, _menhir_s, l) = _menhir_stack in
      let r = _v in
      let _v = _menhir_action_05 l r in
      _menhir_goto_b3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_b3 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState12 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_13 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_BAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AMPER _v_0 ->
          let _menhir_stack = MenhirCell1_b3 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | ARR _ | BAR _ | EOF | RPAREN _ ->
          let MenhirCell0_BAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_b2 (_menhir_stack, _menhir_s, l) = _menhir_stack in
          let r = _v in
          let _v = _menhir_action_03 l r in
          _menhir_goto_b2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_b2 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | BAR _v_0 ->
          let _menhir_stack = MenhirCell1_b2 (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell0_BAR (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_1 in
              let _v = _menhir_action_11 x in
              _menhir_run_06_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | TRUE _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_09 () in
              _menhir_run_06_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | TILDE _v_5 ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState12
          | LPAREN _v_6 ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState12
          | FALSE _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_10 () in
              _menhir_run_06_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | ARR _v_9 ->
          let _menhir_stack = MenhirCell1_b2 (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell0_ARR (_menhir_stack, _v_9) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_10 in
              let _v = _menhir_action_11 x in
              _menhir_run_06_spec_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | TRUE _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_09 () in
              _menhir_run_06_spec_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | TILDE _v_14 ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_14 MenhirState14
          | LPAREN _v_15 ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_15 MenhirState14
          | FALSE _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_10 () in
              _menhir_run_06_spec_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | EOF | RPAREN _ ->
          let b = _v in
          let _v = _menhir_action_02 b in
          _menhir_goto_b1 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_06_spec_12 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_BAR -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_08 b in
      _menhir_run_07_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_07_spec_12 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_BAR -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_06 b in
      _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_TILDE (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_0 in
          let _v = _menhir_action_11 x in
          _menhir_run_06_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TRUE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_06_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TILDE _v_4 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState03
      | LPAREN _v_5 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState03
      | FALSE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_06_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06_spec_03 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_TILDE -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_08 b in
      _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_TILDE -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_TILDE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_07 b in
      _menhir_goto_b4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_b4 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_07_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_07_spec_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState12 ->
          _menhir_run_07_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_07_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_07_spec_14 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_ARR -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_06 b in
      _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
  
  and _menhir_run_07_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_06 b in
      _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_0 in
          let _v = _menhir_action_11 x in
          _menhir_run_06_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TRUE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_06_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TILDE _v_4 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState04
      | LPAREN _v_5 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState04
      | FALSE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_06_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_08 b in
      _menhir_run_07_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_06_spec_14 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_ARR -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_08 b in
      _menhir_run_07_spec_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_b1 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_22_spec_00 _menhir_stack _v _tok
      | MenhirState04 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_12 b in
          let b = _v in
          let _v = _menhir_action_08 b in
          _menhir_goto_b4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_b2 _menhir_cell0_ARR -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ARR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_b2 (_menhir_stack, _menhir_s, l) = _menhir_stack in
      let r = _v in
      let _v = _menhir_action_01 l r in
      _menhir_goto_b1 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_06_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let b = _v in
      let _v = _menhir_action_08 b in
      _menhir_run_07_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_11 x in
          _menhir_run_06_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TRUE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_06_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | TILDE _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | LPAREN _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | FALSE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_06_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
