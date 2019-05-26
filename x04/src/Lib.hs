module Lib
    ( slack
    ) where

import Data.List
import Data.Time

-- [1518-11-01 00:00] Guard #10 begins shift
-- [1518-11-01 00:05] falls asleep
-- [1518-11-01 00:25] wakes up

slack :: [String] -> String
slack _ = "240"

data Action = Change | Sleep | Wake deriving (Show)
data Record = Record { time :: String, action :: Action, id' :: Maybe Int } deriving (Show)

parseRecord :: String -> Record
parseRecord recordString =
    let (dateString:timeString:act) = words recordString
        (_:dateString') = dateString
        timeString' =  takeWhile (/=']') timeString
        timestamp = parseTimeM True defaultTimeLocale "%Y-%m-%d %H:%M" (dateString ++ " " ++ timeString) :: Maybe UTCTime
        

    in Record { time = "time", action = Change, id' = Just 12 }

-- parseRecord :: S