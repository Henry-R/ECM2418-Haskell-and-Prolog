import Data.List

distinct :: (Eq a) => [a] -> Bool
distinct a = nub a == a

generator2 :: [(String, String, String, String, String)]
generator2 =
    [ (n1, n2, n3, n4, n5)
    | n1 <- map show [111..999]           , distinct n1
    , n2 <- map (take 2) (permutations n1), head n1 /= head n2
    , n3 <-               permutations n1
    , n4 <- map (take 2) (permutations n1)
    , n5 <-               permutations n1
    ]

tester2 :: (String, String, String, String, String) -> Bool
tester2 (s1, s2, s3, s4, s5) = 
       n1 - n2 == n3
    && n3 - n4 == n5
    && n1 + n3 + n5 < 2000
    where
        n1 = read s1
        n2 = read s2
        n3 = read s3
        n4 = read s4
        n5 = read s5

main :: IO ()
main = do
    print (filter tester2 generator2)