module Claim (
  parseClaim,
  hashClaim,
  claimMap,
  Claim,
  id'
) where

import Data.List
import Data.Char

data Claim = Claim  { id' :: String
  , left :: Int
  , top :: Int
  , width :: Int
  , height :: Int
  } deriving (Show)  

-- #1275 @ 3,691: 24x15
parseClaim :: String -> Claim
parseClaim claim =
    let (i, _:_:ls) = break (=='@') claim -- @ [...ls]
        (l, _:ts) = span isDigit ls -- [l],[...ts]
        (t, _:_:ws) = span isDigit ts -- [r]: [...hs]
        (w, _:h) = span isDigit ws -- [w]x[h]
    in Claim { id' = i, left = read l, top = read t, width = read w, height = read h }

hashClaim :: Claim -> [String]
hashClaim claim =
    let Claim { left = l, top = t, width = w, height = h } = claim
        xs = [l + x | x <- [0..w-1]]
        ys = [t + y | y <- [0..h-1]]
        hashes = [show (x, y) | x <- xs, y <- ys]
    in hashes

claimMap :: [Claim] -> [(String, Int)]
claimMap claims =
    let hashes = concatMap hashClaim claims
        map' = map (\g@(h:_) -> (h, length g)) . group . sort $ hashes
    in map'