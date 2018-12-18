-- usage: /bin/cat input.txt | cabal run
module Main where

-- import One
import Two

main :: IO ()
-- main = interact $ show . One.overlaps . lines
main = interact $ show . Two.patch . lines
