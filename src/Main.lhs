> module Main where

> import Control.Monad 
> import Data.List 
> import Data.Maybe 
> import Data.Ratio 
> import System.IO 
> import Simplex (simplex,res,rows,ratios)

> main = do
>   let rx = simplex m58
>   print $ res m58

> m58 = [[-750,-1000,1 ,0, 0, 0]
>       ,[1  ,1     ,0 ,1, 0, 10000]
>       ,[1  ,2     ,0 ,0 ,1, 15000]]::[[Rational]]

> m59 = [[-750,-1000,1 ,0 ,0,0  ,0]
>       ,[1   ,1    ,0 ,1 ,0,0,10000]
>       ,[1   ,2    ,0 ,0 ,1,0,15000]
>       ,[4   ,3    ,0 ,0 ,0,1,25000]]::[[Rational]]

