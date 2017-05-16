 module Main where
 import Data.List
 import System.IO
 import SimplexLib
 import LPTests
 main :: IO ()
 main = do
   r1 <- result2 m1
   putStr "m1 x = "
   print $ fst $ fst r1
   putStr "m1 y = "
   print $ snd $ fst r1
   putStr "m1 p = "
   print $ snd r1
   r2 <- result2 $ loop m2
   putStr "m2 x = "
   print $ fst $ fst r2
   putStr "m2 y = "
   print $ snd $ fst r2
   putStr "m2 p = "
   r2a <- result2 $ loop m2a
   print $ snd r2a
   putStr "m2a x = "
   print $ fst $ fst r2a
   putStr "m2a y = "
   print $ snd $ fst r2a
   putStr "m2a p = "
   print $ snd r2a
   r3 <- rsult2 $ loop m3
   print $ snd r3
   putStr "m3 x = "
   print $ fst $ fst r3
   putStr "m3 y = "
   print $ snd $ fst r3
   putStr "m3 p = "
   print $ snd r3
   r4 <- result2 $ loop m4
   putStr "m4 x = "
   print $ fst $ fst r4
   putStr "m4 y = "
   print $ snd $ fst r4
   putStr "m4 p = "
   print $ snd r4
   r5 <- result2 $ loop m5
   print $ snd r5
   putStr "m5 x = "
   print $ fst $ fst r5
   putStr "m5 y = "
   print $ snd $ fst r5
   putStr "m5 p = "
   print $ snd r5
   r5a <- result2 $ loop m5a
   putStr "m5a x = "
   print $ fst $ fst r5a
   putStr "m5a y = "
   print $ snd $ fst r5a
   putStr "m5a p = "
   print $ snd r5a
   r6 <- result2 $ loop m6
   print $ snd r6
   putStr "m6 x = "
   print $ fst $ fst r6
   putStr "m6 y = "
   print $ snd $ fst r6
   putStr "m6 p = "
   print $ snd r6

 result2 :: Monad m => [[Rational]] -> m (([Rational],[Rational]),[Rational])
 result2 m0 = do
   let hasX = not (null (filter (==1) ((transpose m0)!!0))) -- x col has a 1 at pos n
       x = (take 1 . drop ((length (m0!!0))-1)) (m0!!1) 
       hasY = not (null (filter (==1) ((transpose m0)!!1))) -- y col has a 1 at pos m
       y = (take 1 . drop ((length (m0!!0))-1)) (m0!!2)
       p = m0!!0!!((length (m0!!0)-1))
   return ((x,y),[p])

{- result3 :: [[Rational]] -> (Rational,Rational,Rational)
 result3 m0 = do
   if (filter (==) ((colMaj m0)!!0)) == 1
     then do
       let x = ((take 1 . drop ((length m0)-1)))(m0!!0!!((length m0)-1))
     else do
       let x = 0
   if (filter (==) ((colMaj m0)!!1)) == 1
     then do
       let y =  ((take 1 . drop ((length m0)-1)))(m0!!1!!((length m0)-1))
     else do
       let y = 0
   if (filter (==1) ((colMaj m0)!!2)) == 1
     then do
       let z =  ((take 1 . drop ((length m0)-1)))(m0!!2!!((length m0)-1))
     else do
       let z = 0
   return (x,y,z)
-}

-- res3 m = (x m, y m, z m)

{- x m
   | len (filter (== 1) ((transpose m)!!0)) > 0 = ((take 1 . drop ((length m)-1)))(m!!0!!((length m)-1))
   | otherwise = 0  

 y m
   | len (filter (== 1) ((transpose m)!!1)) > 0 = ((take 1 . drop ((length m)-1)))(m!!1!!((length m)-1))
   | otherwise = 0

 z m
   | len (filter (== 1) ((transpose m)!!2)) > 0 = ((take 1 . drop ((length m)-1)))(m!!2!!((length m)-1))

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
 t1a = [[3,2,0, 1,-1,0, 0,-7]  -- r0 - r2
       ,[1,1,1, 0, 1,0, 0,10]  -- r1 => z
       ,[3,2,0, 0, 1,1, 0,20]  -- r2 + r2
       ,[2,6,0, 0, 4,0, 1,40]]::[[Rational]] -- r2 + 4s2
-- t2 = [[1,]
--      ,[0,]
--      ,[0,]
--      ,[0,]]::[[Rational]]
