(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

(* val test1_1 = is_older ((1,2,3),(2,3,4)) = true
val test1_2 = is_older ((1,2,3),(1,3,4)) = true
val test1_3 = is_older ((1,2,3),(1,2,3)) = false
val test1_4 = is_older ((2,2,3),(1,2,3)) = false
val test1_5 = is_older ((1,3,3),(1,2,3)) = false
val test1_6 = is_older ((1,2,4),(1,2,3)) = false
val test1_7 = is_older ((1,3,4),(2,2,3)) = true *)

(* val test2_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2_2 = number_in_month ([(2012,2,28),(2013,12,1)],12) = 1
val test2_3 = number_in_month ([(2012,2,28),(2013,12,1)],3) = 0
val test2_4 = number_in_month ([(2012,2,28),(2013,2,1)],2) = 2 *)

(* val test3_1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_2 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,12,3,4]) = 4
val test3_3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1]) = 0
val test3_4 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0 *)

(* val test4_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_2 = dates_in_month ([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)]
val test4_3 = dates_in_month ([(2012,2,28),(2013,12,1)],1) = [] *)


(* val test5_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5_2 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,4]) = [(2011,3,31),(2011,4,28)]
val test5_3 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1]) = [] *)

(* val test6_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test6_2 = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"
val test6_3 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"
val test6_4 = get_nth ([], 1) = "you" *)

(* val test7_1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val test7_2 = date_to_string (2013, 2, 12) = "February 12, 2013" *)

(* val test8_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8_2 = number_before_reaching_sum (11, [1,2,3,4,5]) = 4
val test8_3 = number_before_reaching_sum (16, [1,2,3,4,5]) = 5
val test8_4 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
val test8_5 = number_before_reaching_sum (2, [1,2,3,4,5]) = 1 *)

(* val test9_1 = what_month 70 = 3
val test9_2 = what_month 1 = 1
val test9_3 = what_month 365 = 12
val test9_4 = what_month 32 = 2 *)

(* val test10_1 = month_range (31, 34) = [1,2,2,2]
val test10_2 = month_range (31, 31) = [1] *)

(* val test11_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_2 = oldest([(2011,2,28),(2011,5,31),(2011,4,28)]) = SOME (2011,2,28)
val test11_3 = oldest([(2011,2,28),(2011,3,31),(2012,4,28)]) = SOME (2011,2,28)
val test11_4 = oldest([(1,2,3),(5,2,3),(7,2,3),(3,2,3)]) = SOME (1,2,3) *)

(* val test12_1 = occur([1,2,3], 3) = true
val test12_2 = occur([1,2,3], 1) = true
val test12_3 = occur([1,2,3], 4) = false *)

(* val test13_1 = remove_dup([1,2,3]) = [1,2,3]
val test13_2 = remove_dup([1,2,3,2]) = [1,3,2]
val test13_3 = remove_dup([1,2,3,3,3,3]) = [1,2,3] *)

(* val test14_1 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,2,3,4]) = 3
val test14_2 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,12,3,4]) = 4
val test14_3 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1]) = 0
val test14_4 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0 *)

val test15_1 = reasonable_date(2008,2,29) = true
val test15_2 = reasonable_date(2009,2,29) = false