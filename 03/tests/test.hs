import Test.Tasty
import Test.Tasty.HUnit
import One

main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests = testGroup "Unit tests"
  [ testCase "Finds box with differeing ids of one char" $
    One.overlaps [ "#1 @ 1,3: 4x4"
    , "#2 @ 3,1: 4x4"
    , "#3 @ 5,5: 2x2"] @?= 4
  ]
