(*                                    *)
(* A Very Short Introduction to OCaml *)
(*                                    *)


(*   Run `utop` and copy-paste the following into the terminal. *)
(* Values *)

5;;

(* Bindings *)

let x = 3 in x + x;;

(* functions *)

let f x = x * x;;

f 5;;

(* Booleans *)

let alltrue b1 b2 b3 = b1 && b2 && b3 in
  alltrue true false true;;

let alltrue b1 b2 b3 = b1 && b2 && b3 in
  alltrue true true true;;

(* Other numeric types *)

25L;;

25l;;

's';;

(* Nope: '5' == 5l;;*)

(* Nope: 5l == 5L;; *)

(* Int64 library to make things explicit *)

Int64.equal 5L (Int64.of_int 25);;
Int64.equal 5L (Int64.of_int32 5l);;

(* Strings *)

"abc" == "abc";;

String.equal "abc" "abc";;

(* Polymorphic lists *)

[1;5;9];;

["a";"b";"c"];;

(* ... but not [1;"a"] *)

(* Variants/GADTs *)

type rank = Officer | Detective;;

(* Records *)

type cop = { name:string; id:int; rk:rank; };;

{ name="Edmund Exley"; id=1324263; rk=Officer};;

let exley = { name="Edmund Exley"; id=1324263; rk=Officer };;
let white = { name="Bud White";    id=4414612; rk=Officer };;

exley.name;;

let exley' = { exley with rk=Detective; };;

(* Functions *)

let newer s1 s2 =
  s1.id < s2.id;;

(* Recursion *)

let rec fac x =
  if (x==0) then 1
  else x * (fac (x - 1));;

let test1 c =
  match c.rk with
  | Officer -> "officer"
  | Detective -> "detective";;

let rec getIDs2 sl = 
  match sl with
  | [] -> []
  | s :: rest -> s.id :: (getIDs2 rest);;

getIDs2 [white;exley];;

(* Higher order features *)

let foo f x = (f x) + (f x);;




(* Pattern Matching *)

(* Recursive functions over algebraic data types *)

type floor = int
type room = int 

type office =
  | CentralStation of floor * room
  | HollywoodHills of room;;

(CentralStation(9,446));;

type directory = (cop * office) list;;

let rec getIDs3 (s:directory) =
  match s with
  | [] -> []
  | (c,CentralStation(f,r)) :: rest -> 
      (c.name ^ " : CS Floor " ^ (string_of_int f) ^ ", Room " ^ (string_of_int r) ^ "\n")
        :: (getIDs3 rest)
  | (c,HollywoodHills(r)) :: rest -> 
      (c.name ^ " : HH Room " ^ (string_of_int r) ^ "\n")
        :: (getIDs3 rest)

let d = [
   (white,CentralStation(1,44));
   (exley',HollywoodHills(28))
];;

String.concat "" (getIDs3 d);;

(* Int64 *)

(* List *)

(* Printf *)

