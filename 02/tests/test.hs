import Test.Tasty
import Test.Tasty.HUnit
import One
import Two

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
    , "ababab"] @?= 12,

    testCase "Finds box with differeing ids of one char" $
    Two.proto [ "abcde"
    , "fghij"
    , "klmno"
    , "pqrst"
    , "fguij"
    , "axcye"
    , "wvxyz"] @?= ['f', 'g', 'i', 'j']
  ]
