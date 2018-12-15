module Main where

import Yawn

main :: IO ()
main = putStrLn . show $ Yawn.getTwo ()
