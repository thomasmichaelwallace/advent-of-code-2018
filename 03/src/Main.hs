-- usage: /bin/cat input.txt | cabal run
module Main where

import One

main :: IO ()
main = interact $ show . One.overlaps . lines
