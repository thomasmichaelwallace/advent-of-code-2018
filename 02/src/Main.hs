-- usage: /bin/cat input.txt | cabal run
module Main where

import One
import Two

main :: IO ()
main = interact $ show . Two.proto . lines
