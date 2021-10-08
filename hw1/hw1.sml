fun is_older(date1: int*int*int, date2: int*int*int) = 
    let 
        val y1 = #1 date1
        val y2 = #1 date2
        val m1 = #2 date1
        val m2 = #2 date2
        val d1 = #3 date1
        val d2 = #3 date2
    in
        if y1 < y2      then true
        else if y1 > y2 then false
        else if m1 < m2 then true
        else if m1 > m2 then false
        else if d1 < d2 then true
        else if d1 > d2 then false
        else false
    end


fun number_in_month(date_list: (int*int*int) list, month: int) = 
    if null date_list
    then 0
    else
        let
            val remain = number_in_month(tl date_list, month)
        in
            if #2 (hd date_list) = month
            then 1 + remain
            else remain
        end


fun number_in_months(date_list: (int*int*int) list, months: int list) = 
    if null months
    then 0
    else number_in_month(date_list, hd months) + number_in_months(date_list, tl months)


fun dates_in_month(date_list: (int*int*int) list, month: int) = 
    if null date_list
    then []
    else
        let 
            val remain = dates_in_month(tl date_list, month)
            val first = hd date_list
        in
            if (#2 first) = month
            then first::remain
            else remain
        end


fun dates_in_months(date_list: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(date_list, hd months)@dates_in_months(date_list, tl months)


fun get_nth(strs: string list, n: int) = 
    if n = 1
    then hd strs
    else get_nth(tl strs, n-1)


fun date_to_string(year: int, month: int, day: int) = 
    let
        val months = [
            "January", 
            "February", 
            "March", 
            "April", 
            "May", 
            "June", 
            "July", 
            "August", 
            "September", 
            "October", 
            "November", 
            "December"
        ]
    in
        get_nth(months, month)
        ^ " "
        ^ Int.toString(day)
        ^ ", "
        ^ Int.toString(year)
    end


fun number_before_reaching_sum(sum: int, nums: int list) = 
    if null nums orelse hd nums >= sum
    then 0
    else 1 + number_before_reaching_sum(sum-(hd nums), tl nums)


fun what_month(day: int) = 
    let
        val day_of_month = [
            31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
        ]
    in
        number_before_reaching_sum(day, day_of_month) + 1
    end


fun month_range(day1: int, day2: int) = 
    if day1 > day2
    then []
    else what_month(day1)::month_range(day1+1, day2)


fun oldest(dates: (int * int * int) list) = 
    if null dates
    then NONE
    else
        let
            val first = hd dates
            val remain = oldest(tl dates)
        in
            if isSome remain
            then
                if is_older(first, valOf remain)
                then SOME first
                else remain
            else SOME first
        end

