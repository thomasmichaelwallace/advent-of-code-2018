import Test.Tasty
import Test.Tasty.HUnit
import One
import Two

main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests = testGroup "Unit tests"
  [ testCase "Finds overlapping patch" $
    One.overlaps [ "#1 @ 1,3: 4x4"
    , "#2 @ 3,1: 4x4"
    , "#3 @ 5,5: 2x2"] @?= 4
  , testCase "Finds unqiue patch" $
    Two.patch [ "#1 @ 1,3: 4x4"
    , "#2 @ 3,1: 4x4"
    , "#3 @ 5,5: 2x2"] @?= "#3 "
  ]
