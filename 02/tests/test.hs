import Test.Tasty
import Test.Tasty.HUnit
import One

main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests = testGroup "Unit tests"
  [ testCase "Checksum a group of box ids" $
    One.checksum [ "abcdef"
    , "bababc"
    , "abbcde"
    , "abcccd"
    , "aabcdd"
    , "abcdee"
    , "ababab"] @?= 12
  ]
