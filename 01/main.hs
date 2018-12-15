-- usage: cat input.txt | ./main
main = interact calibrate

calibrate :: String -> String
calibrate input =
    let allLines = lines input
        offsets = map interpret allLines
        count = sum offsets
        result = show count
    in result

interpret :: String -> Int
interpret (x:xs)
    | x == '+' = offset
    | x == '-' = -offset
    where offset = read xs :: Int
