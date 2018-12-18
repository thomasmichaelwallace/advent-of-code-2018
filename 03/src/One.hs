module One (
    overlaps
) where

import Claim
import Data.List

overlaps :: [String] -> Int
overlaps claimsStrings =
    let claims = map parseClaim claimsStrings
        cm = claimMap claims
    in doubleParked cm

doubleParked :: [(String, Int)] -> Int
doubleParked = length . filter (>1) . map snd
