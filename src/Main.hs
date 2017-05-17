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
  print $ res m6 -- reverse $ last $ transpose $ simplex m6
  putStrLn "(7) Max. 2x - 2y + 4z"  
  putStrLn "m7 x,y,z,p = UNFEASIBLE?"
--  print $ reverse $ last $ transpose $ simplex m7
  putStr "(8) Max. 2x - 3y"
  print $5
  putStrLn "(9) Max. x + y"
  putStrLn "(10) Max. 4x + y + z"
  putStrLn "(11) Max. 2x + y"

res = reverse . last . transpose . simplex

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


