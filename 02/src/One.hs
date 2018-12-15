module One (
    checksum
) where

import Data.List

checksum :: [String] -> Int
checksum ids =
    let twosThrees = map twosAndThrees ids
        factor = contribs twosThrees
    in factor

twosAndThrees :: String -> (Int, Int)
twosAndThrees id =
    let groups = group . sort $ id
        counts = map (\g -> length g) groups
        twos = if any (==2) counts then 1 else 0
        threes = if any (==3) counts then 1 else 0
    in (twos, threes)

contribs :: [(Int, Int)] -> Int
contribs twosThrees =
    let (twos, threes) = unzip twosThrees
        a = sum twos
        b = sum threes
    in a * b
