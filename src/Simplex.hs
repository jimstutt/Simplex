module Simplex (simplex,ratios,rows,rids,res) where

-- http://www.arabiafoundation.org/analysis-15

import Control.Monad
import Data.List
import Data.Maybe
import Data.Ratio

simplex m = do
  let ris  = [0..((length m) - 1)]
      pre  = takeWhile (< (pri m)) ris
      post = takeWhile (> (pri m)) $ (drop 1 . dropWhile (< (pri m))) ris
      m1   = orderedAdd pre post ris m
  if (hasNeg (m1!!0))
    then simplex m1
    else m1

pci m     = fromJust $ elemIndex (minimum (m!!0)) (m!!0)
pri m     = fst $ (ratios m)!!fromJust (elemIndex ( minimum (filter (>0) (snd <$> ratios m))) (snd <$> ratios m))
pe m      = m!!(pri m)!!(pci m)
scale pe  = 1/(toRational pe)
npr pr pe = (*(scale pe)) <$> pr
prc m ri  = -fromRational (m!!ri!!(pci m)) / toRational (pe m)
hasNeg r  = not $ null $ filter (< 0) r

-- (>0) prevents unbounded solutions : excludes negative values in pivot column cells. What happens with all zeroes? TBD. 
ratios m = do
  let rhs = (transpose m)!!((length (m!!0)-1))
      pc  = (transpose m)!!(pci m)
  i <- [0..((length $ rhs)-1)]
--  rat (rhs!!i) (pc!!i) i
  if (((rhs!!i) > 0) && ((pc!!i) > 0))
    then return $ (i, (rhs!!i)/(pc!!i))
    else return (i,0)

{- fail if unbounded
rat :: Rational -> Rational -> Int -> Either String (Int,[Rational])
rat 0    0 i = Left "error: rhs and pc = 0."
rat rhs  0 i = Left "error: pc = 0"
rat 0   pc i = Left "error: rhs = 0"
rat rhs pc i = Right (i, (rhs!!i)/(pc!!i))
-}


allNeg col = all (< 0) col

orderedAdd pre post ris m
  | (pri m) == (ris!!0)                                       = (npr (m!!(pri m)) (pe m)) : (addRow m <$> post)
  | (pri m) /= (ris!!0) && (pri m) /= (ris!!((length ris)-1)) = (addRow m <$> pre) ++ [npr (m!!(pri m)) (pe m)] ++ (addRow m <$> post)
  | (pri m) == (ris!!((length ris)-1))                        = (addRow m <$> pre) ++ [npr (m!!(pri m)) (pe m)]

addRow m ri = zipWith (+) (m!!ri) (((prc m ri)*) <$> (m!!(pri m)))       -- (c * pivRow) added to target row

-- indexed result rows
rows m = do
  i <- [0..((length $ transpose m)-1)]       -- number of non-basic variables ie. (((length m - 1)/2)-1) ie. not obj. (cost func.) col.
  return $ (i, ((transpose $ simplex m)!!i))

-- result rows do not occur in col order so need to be sorted by the column order of their leftmost 1 valued cell corresponding to a rhs result value.

-- Mallory Factor : Oxon Trumpite
-- cycle detection

rids m = sort $ fromJust <$> filter (/= Nothing) (elemIndex 1 <$> (take (((length (m!!0))) `div` 2)(snd <$> rows m)))

res m = reverse $ ((((last $ transpose $ simplex m))!!) <$> (rids m))

-- morae

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) 
  | (x <= y)  = x:(merge xs (y:ys)) 
  | otherwise = y:(merge (x:xs) ys)

-- jlavelle : https://gist.github.com/morae/8494016

mergesort xs = let (a, b) = splitAt (div (length xs) 2) xs
               in merge (mergesort a) (mergesort b)

-- BUG: takes result in row order; shd be col order.


{- test t = case t of
     isUnbounded t -> _
     isUnique t -> _
     isMultiple t -> _
     isDegenerate t -> _  
-}

