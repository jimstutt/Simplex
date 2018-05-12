module Simplex (simplex,ratios,rows,rids,res) where

import Control.Monad
import Data.List
import Data.Maybe
import Data.Ratio

simplex m = do
  let ris  = [0..(length m - 1)]
      pre  = takeWhile (< pri m) ris
      post = takeWhile (> pri m) $ (drop 1 . dropWhile (< pri m)) ris
      m1   = orderedAdd pre post ris m
  if hasNeg (head m) then simplex m1 else m1

pci m     = fromJust $ elemIndex (minimum (head m)) (head m)
pri m     = fst $ ratios m !!
                   fromJust 
                     (elemIndex ( minimum (filter (>0) (snd <$> ratios m))) 
                       (snd <$> ratios m))
pe m      = m!!pri m !! pci m
scale pe  = 1/toRational pe
npr pr pe = (*(scale pe)) <$> pr
prc m ri  = -fromRational (m!!ri!!(pci m)) / toRational (pe m)
hasNeg r  = not $ null $ filter (< 0) r

ratios m = do
  let rhs = transpose m!!((length (head m)-1))
      pc  = transpose m!!pci m
  i <- [0..(length rhs-1)]
  if (rhs!!i > 0 && pc!!i > 0) then 
    return $ (i, rhs!!i/pc!!i) else return (i,0)

allNeg col = all (< 0) col

orderedAdd pre post ris m
  | pri m == head ris                                 = npr (m!!pri m) (pe m) : (addRow m <$> post)
  | pri m /= head ris && pri m /= ris!!(length ris-1) = (addRow m <$> pre) ++ [npr (m!!pri m) (pe m)] ++ 
                                                                (addRow m <$> post)
  | pri m == ris!!(length ris-1)                      = (addRow m <$> pre) ++ [npr (m!!pri m) (pe m)]

addRow m ri = zipWith (+) (m!!ri) ((prc m ri*) <$> (m!!pri m)) -- (c * pivRow) added to target row

rows m = do
  i <- [0..((length $ transpose m)-1)] -- number of non-basic variables
  return (i, (transpose $ simplex m)!!i)

rids m = sort $ fromJust <$> filter (/= Nothing) (elemIndex 1 <$> 
           (take ((length (head m) `div` 2)) (snd <$> rows m)))

res m = reverse $ (((last $ transpose $ simplex m) !!) <$> rids m)

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) 
  | x <= y  = x:merge xs (y:ys) 
  | otherwise = y:merge (x:xs) ys

mergesort xs = let (a, b) = splitAt (div (length xs) 2) xs
               in merge (mergesort a) (mergesort b)

