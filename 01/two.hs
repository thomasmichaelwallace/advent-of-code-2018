import Debug.Trace

-- usage: cat input.txt | ./two
main = interact calibrate

calibrate :: String -> String
calibrate input =
    let allLines = lines input
        offsets = map interpret allLines
        manyOffsets = cycle offsets
        wanted = stable [0] manyOffsets
        result = show wanted
    in result

interpret :: String -> Int
interpret (x:xs)
    | x == '+' = offset
    | x == '-' = -offset
    where offset = read xs :: Int

stable :: [Int] -> [Int] -> Int
stable seen@(s:ss) (x:xs)
    | next `elem` seen = next
    | xs == [] = -999
    | otherwise = stable (next:seen) xs
    where next = s + x