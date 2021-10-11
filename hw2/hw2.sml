(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* val all_except_option = fn : string * string list -> string list option *)
fun all_except_option(str:string, lst:string list) = 
   case lst of
     [] => NONE
   | x::xs' => if same_string(str, x)
               then SOME xs'
               else case all_except_option(str, xs') of
                      NONE => NONE
                    | SOME some => SOME (x::some)

(* val get_substitutions1 = fn : string list list * string -> string list *)
fun get_substitutions1(substitutions:string list list, s:string) = 
   case substitutions of
     [] => []
   | x::xs' => case all_except_option(s, x) of
                 NONE => get_substitutions1(xs', s)
               | SOME some => some @ get_substitutions1(xs', s)

(* val get_substitutions2 = fn : string list list * string -> string list *)
fun get_substitutions2(substitutions:string list list, s:string) = 
   let
   fun helper(substitutions, s, result) = 
      case substitutions of
        [] => result
      | x::xs' => case all_except_option(s, x) of
                    NONE => helper(xs', s, result)
                  | SOME some => helper(xs', s, result @ some)

   in
      helper(substitutions, s, [])
   end

(* val similar_names = fn : string list list * {first:string, last:string, middle:string}
    -> {first:string, last:string, middle:string} list *)
fun similar_names(substitutions:string list list, full_name:{first:string,middle:string,last:string}) = 
   let
      val {first=f, middle=m, last=l} = full_name
      fun helper(available_first_name, full_name, result) = 
         case available_first_name of
           [] => full_name::result
         | x::xs' => helper(xs', full_name, result@[{first=x, middle=m, last=l}])
   in
      helper(get_substitutions1(substitutions, f), full_name, [])
   end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* val card_color = fn : card -> color *)
fun card_color(card) = 
   case card of
     (Spades, _)   => Black
   | (Clubs, _)    => Black
   | (Diamonds, _) => Red
   | (Hearts, _)   => Red

(* val card_value = fn : card -> int *)
fun card_value(card) = 
   case card of
     (_, Num num) => num
   | (_, Ace)        => 11
   | (_, Jack)       => 10
   | (_, Queen)      => 10
   | (_, King)       => 10

(* val remove_card = fn : card list * card * exn -> card list *)
fun remove_card(cs, c, e) =
   case cs of
     [] => raise e
   | x::xs' => if x = c then xs' else x::remove_card(xs', c, e)

(* val all_same_color = fn : card list -> bool *)
fun all_same_color(cs) = 
   case cs of
     [] => true
   | x::[] => true
   | head::neck::tails => card_color(head) = card_color(neck) andalso all_same_color(neck::tails)

(* val sum_cards = fn : card list -> int *)
fun sum_cards(cs) = 
   let
      fun helper(cs, acc) = 
         case cs of
           [] => acc
         | c::cs' => helper(cs', acc+card_value(c))
   in
      helper(cs, 0)
   end

(* val score = fn : card list * int -> int *)
fun score(cs, goal) = 
   let
      val sum = sum_cards(cs)
      val same_color = all_same_color(cs)
      val score = if sum > goal then 3 * (sum - goal) else (goal - sum)
   in
      if same_color then score div 2 else score
   end

(* val officiate = fn : card list * move list * int -> int *)
fun officiate (cards,plays,goal) =
    let 
        fun loop (current_cards,cards_left,plays_left) =
            case plays_left of
                [] => score(current_cards,goal)
              | (Discard c)::tail => 
                loop (remove_card(current_cards,c,IllegalMove),cards_left,tail)
              | Draw::tail =>
                (* note: must score immediately if go over goal! *)
                case cards_left of
                    [] => score(current_cards,goal)
                  | c::rest => if sum_cards (c::current_cards) > goal
                               then score(c::current_cards,goal)
                               else loop (c::current_cards,rest,tail)
    in 
        loop ([],cards,plays)
    end

(* val score = fn : card list * int -> int *)
fun score_challenge(cs, goal) = 
   let
      (* take every Ace as 11 score at first
         then, if sum > goal, we can subtract the score *)
      fun count_ace(cs) = 
         case cs of 
            [] => 0
         |  c::cs' => (let val (s, r) = c in if r = Ace then 1 else 0 end) + count_ace(cs')
      val sum = sum_cards(cs)
      val same_color = all_same_color(cs)
      val aces = count_ace(cs)
      val score = if sum > goal then if sum - goal <= aces * 10 then 0 else 3 * (sum - 10 * aces - goal)
                  else (goal - sum)
   in
      if same_color then score div 2 else score
   end

(* val officiate = fn : card list * move list * int -> int *)
fun officiate_challenge (cards,plays,goal) =
    let 
        fun loop (current_cards,cards_left,plays_left) =
            case plays_left of
                [] => score_challenge(current_cards,goal)
              | (Discard c)::tail => 
                loop (remove_card(current_cards,c,IllegalMove),cards_left,tail)
              | Draw::tail =>
                (* note: must score immediately if go over goal! *)
                case cards_left of
                    [] => score_challenge(current_cards,goal)
                  | c::rest => if sum_cards (c::current_cards) > goal
                               then score_challenge(c::current_cards,goal)
                               else loop (c::current_cards,rest,tail)
    in 
        loop ([],cards,plays)
    end