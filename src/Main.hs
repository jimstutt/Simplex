module Main where

import Data.List
import System.IO
import SimplexLib
import LPTests

main :: IO ()
main = do
  r1 <- res2 m1
  putStr "m1 x = "
  print $ fst $ fst r1
  putStr "m1 y = "
  print $ snd $ fst r1
  putStr "m1 p = "
  print $ snd r1
  r2 <- res2 $ simplex m2
  putStr "m2 x = "
  print $ fst $ fst r2
  putStr "m2 y = "
  print $ snd $ fst r2
  putStr "m2 p = "
  print $ snd r2
  r2a <- res2 $ simplex m2a
  putStr "m2a x = "
  print $ fst $ fst r2a
  putStr "m2a y = "
  print $ snd $ fst r2a
  putStr "m2a p = "
  print $ snd r2a
  r3 <- res2 $ simplex m3
  putStr "m3 x = "
  print $ fst $ fst r3
  putStr "m3 y = "
  print $ snd $ fst r3
  putStr "m3 p = "
  print $ snd r3
  r4 <- res3 $ simplex m4
  putStr "m4 x = "
  print $ fst $ fst r4
  putStr "m4 y = "
  print $ snd $ fst r4
  putStr "m4 z = "
  print $ snd $ fst r4
  putStr "m4 p = "
  print $ snd r4
  r5 <- res3 $ simplex m5
  putStr "m5 x = "
  print $ fst $ fst r5
  putStr "m5 y = "
  print $ snd $ fst r5
  putStr "m5 z = "
  print $ snd $ fst r5
  putStr "m5 p = "
  print $ snd r5
  r5a <- res3 $ simplex m5a
  putStr "m5a x = "
  print $ fst $ fst r5a
  putStr "m5a y = "
  print $ snd $ fst r5a
  putStr "m5a z = "
  print $ snd $ fst r5a
  putStr "m5a p = "
  print $ snd r5a
  r6 <- res3 $ simplex m6
  putStr "m6 x = "
  print $ fst $ fst r6
  putStr "m6 y = "
  print $ snd $ fst r6
  putStr "m6 z = "
  print $ snd $ fst r6
  putStr "m6 p = "
  print $ snd r6

res2 :: (Monad m, Eq a, Num a) => [[a]] -> m (([a],[a]),[a])
res2 m = do
  let hasX = not (null (filter (==1) ((transpose m)!!0))) -- x col has a 1 at pos n
      x = (take 1 . drop ((length (m!!0))-1)) (m!!1) 
      hasY = not (null (filter (==1) ((transpose m)!!1))) -- y col has a 1 at pos m
      y = (take 1 . drop ((length (m!!0))-1)) (m!!2)
      p = m!!0!!((length (m!!0)-1))
  return ((x,y),[p])

res3 :: (Monad m, Eq a, Num a) => [[a]] -> m ((([a],[a]),[a]),[a])
res3 m = do
  let hasX = not (null (filter (==1) ((transpose m)!!0))) -- x col has a 1 at pos p
      x = ((take 1 . drop ((length m)-1))) (m!!1)
      hasY = not (null (filter (==1) ((transpose m)!!1))) -- y col has a 1 at pos 1
      y =  ((take 1 . drop ((length m)-1))) (m!!2)
      hasZ = not (null (filter (==1) ((transpose m)!!2)))  -- z col has a 1 at pos r
      z =  ((take 1 . drop ((length m)-1))) (m!!3)
      p = m!!0!!((length (m!!0)-1)) -- s
  return (((x,y),z),[p])

-- res3 m = (x m, y m, z m)

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

t1 = [[1,-2, 2,-4, 0, 0, 0,  0]
      ,[0, 4, 3, 1, 1, 0, 0,  3]                -- s1  
      ,[0, 1, 1, 1, 0, 1, 0, 10]                -- s2 *
      ,[0, 2, 1,-1, 0, 0, 1, 10]]::[[Rational]] -- s3
