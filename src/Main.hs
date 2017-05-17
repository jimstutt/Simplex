module Main where

import Data.List
import System.IO
import Simplex
import LPTests

main :: IO ()
main = do
  putStrLn "(1) Maximise x + 2y"
  putStr "m1 x,y,p = "
  print $ reverse $ last $ transpose $ simplex m1
  putStrLn "(2) Maximise x + y"
  putStr "m2 x,y,p = "
  print $ reverse $ last $ transpose $ simplex m2
  putStrLn "(3) Max 3x+y"  
  putStr "m3 x,y,p = 3 vars and unrestricted not yet done! Ignore the rest!"
  print $ reverse $ last $ transpose $ simplex m3
  putStrLn "(4) Max 2x - 3y + 4z"
  putStr "m4 x,y,z,p = "
  print $ reverse $ last $ transpose $ simplex m4
  putStrLn "(5) Max x + 2y - z"
  putStr "m5 p,x,y,z,p = "
  print $ reverse $ last $ transpose $ simplex m5 
  putStrLn "(6) Max. 2x + y"
  putStr "m6 x,y,z,p = "
  print $ reverse $ last $ transpose $ simplex m6
  putStrLn "(7) Max. 2x - 2y + 4z"  
  putStr "m7 x,y,z,p = "
  print $ reverse $ last $ transpose $ simplex m7

{-
7.1.1) Max. 2x - 3y
7.2.1) Max x + y
Ex. 62) Max 4x + y + z
7.3.1) Max. 2x + y
-}

{-x :: forall a. (Num a, Eq a) => [[[a]]] -> [a]
x m
   | length (filter (== 1) ((transpose m)!!0)) > 0 = ((take 1 . drop ((length m)-1)))(m!!0!!((length m)-1))
   | otherwise = 0
   
y m
   | length (filter (== 1) ((transpose m)!!1)) > 0 = ((take 1 . drop ((length m)-1)))(m!!1!!((length m)-1))
   | otherwise = 0

z m
   | length (filter (== 1) ((transpose m)!!2)) > 0 = ((take 1 . drop ((length m)-1)))(m!!2!!((length m)-1))
   | otherwise = 0
-}

{- test t = case t of
     isUnbounded t -> _
     isUnique t -> _
     isMultiple t -> _
     isDegenerate t -> _  
-}

{-
Maximise 2x - y + 4z -- 4 - 7 + 5 = 2 
Subject to:
  3x + 3y + z = 32 -- 6 + 21 + 5 = 32 
   x +  y + z = 14 -- 2 + 7 + 5 = 14
  2x +  y - z = 6  -- 4 + 7 - 5 = 6

x = 2
y = 7
z = 5
p = 
-}


m7 = [[1,-2, 1,-4, 0, 0, 0,  0]
     ,[0, 4, 3, 1, 1, 0, 0, 32]               -- s1  
     ,[0, 1, 1, 1, 0, 1, 0, 14]               -- s2 *
     ,[0, 2, 1,-1, 0, 0, 1, 6]]::[[Rational]] -- s3

