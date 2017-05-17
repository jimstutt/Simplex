module Simplex where

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
pri m     = fst $ (ratios m)!!fromJust (elemIndex ( minimum (snd <$> ratios m)) (snd <$> ratios m))
pe m      = m!!(pri m)!!(pci m)
scale pe  = 1/(toRational pe)
npr pr pe = (*(scale pe)) <$> pr
prc m ri  = -fromRational (m!!ri!!(pci m)) / toRational (pe m)
hasNeg r  = not $ null $ filter (< 0) r

ratios m = do
  let rhs = (transpose m)!!((length (m!!0)-1))
      pc  = (transpose m)!!(pci m)
  i <- [0..((length $ rhs)-1)]
  guard (((rhs!!i) > 0) && ((pc!!i) > 0)) 
  return $ (i, ((rhs!!i) / (pc!!i)))

orderedAdd pre post ris m
  | (pri m) == (ris!!0)                                       = (npr (m!!(pri m)) (pe m)) : (addRow m <$> post)
  | (pri m) /= (ris!!0) && (pri m) /= (ris!!((length ris)-1)) = (addRow m <$> pre) ++ [npr (m!!(pri m)) (pe m)] ++ (addRow m <$> post)
  | (pri m) == (ris!!((length ris)-1))                        = (addRow m <$> pre) ++ [npr (m!!(pri m)) (pe m)]

addRow m ri = zipWith (+) (m!!ri) (((prc m ri)*) <$> (m!!(pri m)))       -- (c * pivRow) added to target row
