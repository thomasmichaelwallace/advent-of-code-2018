module Two (
  patch
) where

import Claim
import Data.List
import qualified Data.Map as Map

patch :: [String] -> String
patch claimsStrings =
  let claims = map parseClaim claimsStrings
      cm = Map.fromList . claimMap $ claims
  in safePatchId cm claims

safePatchId :: Map.Map String Int -> [Claim] -> String
safePatchId cm claims =
  let isThisSafePatch = isSafePatch cm
      Just(claim) = find isThisSafePatch claims
  in id' claim

isSafePatch :: Map.Map String Int -> Claim -> Bool
isSafePatch cm claim =
  let hash = hashClaim claim
      Just spaces = mapM (\h -> Map.lookup h cm) hash
  in all (==1) spaces

