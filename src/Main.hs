module Main where

import Data.List
import System.IO
import Simplex
import LPTests

main :: IO ()
main = do
  putStrLn "(1) Maximise x + 2y"
  putStr "m1 x,y,p = "
  print $ res m1
  putStrLn "(2) Maximise x + y"
  putStr "m2 x,y,p = "
  print $ res m2
  putStrLn "(3) Max 3x+y"  
  putStr "m3 x,y,p = 3 vars and unrestricted not yet done! Ignore the rest!"
  print $ res m3
  putStrLn "(4) Max 2x - 3y + 4z"
  putStr "m4 x,y,z,p = "
  print $ res m4
  putStrLn "(5) Max x + 2y - z"
  putStr "m5 p,x,y,z,p = "
  print $ res m5 
  putStrLn "(6) Max. 2x + y"
  putStr "m6 x,y,z,p = "
  print $ res m6 
  putStrLn "(7) Max. 2x - 2y + 4z"  
  putStrLn "m7 x,y,z,p = INFEASIBLE?"
--  print $ res m7
  putStrLn "(8) Max. 2x - 3y"
  print $ res m8
  putStrLn "(9) Max. x + y"
  print $ res m9
  putStrLn "(10) Max. 4x + y + z"
  print $ res m10
  putStrLn "(11) Max. 2x + y"
  print $ res m11
  
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


