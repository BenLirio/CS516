(* Translating ("transpiling") a simple imperative program into OCaml
   code by * representing the OCaml program as a string. *)

   open Simple

   module OrderedVars = struct
     type t = var
     let compare = String.compare
   end
   
   module VSet = Set.Make(OrderedVars)
   let (++) = VSet.union
   
   (* 
     Calculate the set of variables mentioned in either an expression or a command. 
   *)
   
   
   let rec vars_of_exp (e:exp) : VSet.t =
     begin match e with
       | Var x -> VSet.singleton x
       | Add(e1, e2)
       | Mul(e1, e2)
       | Lt (e1, e2) ->
         (vars_of_exp e1) ++ (vars_of_exp e2)
       | Lit _ -> VSet.empty
     end
   
   let rec vars_of_cmd (c:cmd) :VSet.t =
     begin match c with
       (* | Skip -> VSet.empty
       | Assn(x, e) -> (VSet.singleton x) ++ (vars_of_exp e)
       | IfNZ(e, c1, c2) ->
         (vars_of_exp e) ++
         (vars_of_cmd c1) ++
         (vars_of_cmd c2)
       | WhileNZ(e, c) ->
         (vars_of_exp e) ++
         (vars_of_cmd c)
       | Seq(c1, c2) ->
         (vars_of_cmd c1) ++
         (vars_of_cmd c2) *)
       | _ -> failwith "Implement me!" 
     end
   
   (* 
     The translation invariants are guided by the _types_ of the operations:
   
     - variables are global state, so they become mutable references
     - expressions denote integers
     - commands denote imperative actions of type unit
   
     [[ X ]] : int ref
   
     [[ exp ]] : int
   
     [[ cmd ]] : unit
   *)
   
   
   
   (* Giving names to variables *)
   let trans_var (x:var) : string =
     "v_" ^ x
   
   (* Translating operations *)
   (* Exercise *)
   let rec trans_exp (e:exp) : string =
     let trans_op (e1:exp) (e2:exp) (op:string) =
       Printf.sprintf "(%s %s %s)"
         (trans_exp e1) op (trans_exp e2)
     in
     
     begin match e with
       | Var x -> "!" ^ (trans_var x)
       | Add(e1, e2) -> trans_op e1 e2 "+"
       | _ -> failwith "implement me!" 
     end
   
   (* Exercise *)
   let rec trans_cmd (c:cmd) : string =
     begin match c with
       | _ -> failwith "implement me!" 
       (* | Skip -> "()"
       | IfNZ(e, c1, c2) ->
         Printf.sprintf "if %s <> 0 then (%s) else (%s)" (trans_exp e) (trans_cmd c1) (trans_cmd c2)  
         *)
     end
   
   let trans_prog (c:cmd) : string =
     let vars = vars_of_cmd c in
     let decls =
       VSet.fold (fun x s ->
           Printf.sprintf "let %s = ref 0\n%s\n"
             (trans_var x) s)
         vars
         ""
     in
     Printf.sprintf "module Program = struct\n %s let run () = \n%s\nend"
     decls (trans_cmd c)
   
   (* Let's try the factorial from utop! *)
   
   (* 
   
     trans_prog factorial |> print_string;;
     
     should output
   
   module Program = struct
    let v_X = ref 0
    let v_ANS = ref 0
   
   
    let run () = 
    v_X := 6;
    v_ANS := 1;
    while !v_X <> 0 do
     v_ANS := (!v_ANS * !v_X);
     v_X := (!v_X + -1) 
    done
     
   end
     
   *)