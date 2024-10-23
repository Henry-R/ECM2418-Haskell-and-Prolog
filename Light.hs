import Data.List
import Data.Char

segValues :: String -> Int
segValues = 
    sum . map segValue
    where
        segValue :: Char -> Int
        segValue d
            | d == '0' = 6
            | d == '1' = 2
            | d == '2' = 5
            | d == '3' = 5
            | d == '4' = 4
            | d == '5' = 5
            | d == '6' = 6
            | d == '7' = 3
            | d == '8' = 7
            | d == '9' = 6
            | otherwise = 0

validMonthDay :: Int -> Int -> Bool
validMonthDay mt dy
    | index >= 0 && index < length maxDayMonth = 
        dy <= maxDayMonth !! index
    | otherwise = False
    where
        index = mt - 1
        maxDayMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

readLeadZero :: Int -> String
readLeadZero n
    | length s == 1 = '0' : s
    | otherwise     =       s
    where
        s = show n

distinct :: (Eq a) => [a] -> Bool
distinct s = nub s == s

prime :: Int -> Bool
prime
    = not . factorisable 2

factorisable :: Int -> Int -> Bool
factorisable f n
    | f * f <= n = n `mod` f == 0 || factorisable (f+1) n
    | otherwise = False

nextDay :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
nextDay (hr, mn, dy, mt) = 
    (hr, mn, dy + 1, mt)

nextMin :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
nextMin (hr, mn, dy, mt) = 
    (hr1, mn1, dy, mt)
    where
        (quot, mn1) = quotRem (mn + 1) 60
        hr1 = hr + quot

displayDigits :: (Int, Int, Int, Int) -> String
displayDigits (hr, mn, dy, mt) =
    rlz hr ++ rlz mn ++ rlz dy ++ rlz mt
    where rlz = readLeadZero

magic :: String -> Bool
magic s = 
    distinct s
    && prime (segValues s)

generator1 :: [(Int, Int, Int, Int)]
generator1 =
    [ (hr, mn, dy, mt)
    | hr <- [0..23]
    , mn <- [0..59]
    , dy <- [1..31]
    , mt <- [1..12]
    , validMonthDay mt dy
    ]

tester1 :: (Int, Int, Int, Int) -> Bool
tester1 time = 
       magic init
    && magic nday
    && segValues nmin * 2 == segValues init + segValues nday
    where
        init = displayDigits time
        nday = displayDigits (nextDay time)
        nmin = displayDigits ((nextMin . nextDay) time)

main :: IO ()
main
    = print (filter tester1 generator1)
