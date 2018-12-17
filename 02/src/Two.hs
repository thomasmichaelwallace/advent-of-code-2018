module Two (
    proto
) where

import Data.List

proto :: [String] -> [Char]
proto ids = 
    let diffs = [(f, s) | f <- ids, s <- ids]
        result = head (dropWhile notSingleDiff diffs)
    in exceptSingleDiff result

notSingleDiff :: (String, String) -> Bool
notSingleDiff (f, s) =
    let cs = zip f s
        diffs = length . filter (\(a, b) -> a /= b) $ cs
        result = if diffs == 1 then False else True
    in result

exceptSingleDiff :: (String, String) -> String
exceptSingleDiff (f, s) =
    let cs = zip f s
        (as, d:bs) = span (\(a, b) -> a == b) cs
        result = (map fst as) ++ (map fst bs)
    in result