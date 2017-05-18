module Main where

import Control.Monad
import Data.List
import Data.Maybe
import System.IO
import Simplex (simplex)
import LPTests

main :: IO ()
main = do
  putStrLn "(1) Maximise x + 2y => ok"
  putStr "m1 x,y,p = "
  print $ res m1
  putStrLn "(2) Maximise x + y => ok"
  putStr "m2 x,y,p = "
  print $ res m2
  putStrLn "(3) Max 3x+y => WRONG!"  
  putStr "m3 x,y,p = "
  print $ res m3
  putStrLn "(4) Max 2x - 3y + 4z => WRONG!"
  putStrLn "m4 x,y,z,p = "
  
--  print $ res3 m4
  putStrLn "(5) Max x + 2y - z => ok"
  putStr "m5 p,x,y,z,p = "
  print $ res m5 
  putStrLn "(6) Max. 2x + y => ok"
  putStr "m6 x,y,z,p = "
  print $ res m6 
  putStrLn "(7) Max. 2x - 2y + 4z"  
  putStrLn "m7 x,y,z,p = INFEASIBLE?"
--  print $ res m7
  putStrLn "(8) Max. 2x - 3y => ok"
  print $ res m8
  putStrLn "(9) Max. x + y => ok"
  print $ res m9
  putStrLn "(10) Max. 4x + y + z => ok"
  print $ res m10
  putStrLn "(11) Max. 2x + y => WRONG!"
  print $ res m11

res m = filter (>0) (reverse $ last $ transpose $ simplex m)

{- test t = case t of
     isUnbounded t -> _
     isUnique t -> _
     isMultiple t -> _
     isDegenerate t -> _  
-}


