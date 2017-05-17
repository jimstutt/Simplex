> module LPTests where

Test tableau 0

(1) Maximise x + 2y
   Subject to:
     2x + y <= 4 -- 5/2 < 4   ok
     x + 2y <= 5 -- 2*5/2 = 5 ok

x = 0 
y = 5/2
p = 5

> m1 = [[1,-1,-2, 0, 0, 0] -- obj row
>      ,[0, 2, 1, 1, 0, 4]
>      ,[0, 1, 2, 0, 1, 5]]::[[Rational]]

pci = 2
pri = 2
prcoeff = 1/2

> m1a = [[1,  0, 0, 2,  1,    5] -- r0 + 2r2
>       ,[0,3/2, 0, 1,-1/2, 3/2] -- r1 - r2
>       ,[0,1/2, 1, 0, 1/2, 5/2]]::[[Rational]] -- r2*1/2

x = 0
y = 5/2
p = 5

(2) Maximise x + y -- 7/3
   Subject to:
     2x + y <= 4  -- 2*5/3 + 2/3 = 12/3 = 4 ok
      x + 2y <= 3  -- 5/3 + 2*2/3 = 9/3 = 3 ok

> m2 = [[-1,-1,0,0,1, 0]
>      ,[ 2, 1,1,0,0, 4]  -- 4/2 = 2*
>      ,[ 1, 2,0,1,0, 3]]::[[Rational]]

pci = 0
pri = 1
prc = 2
pe  = 2

x = 5/3 ok
y = 2/3 ok
p = 7/3 ok

> m2a = [[0,-1/2, 1/2, 0, 1, 2] -- r0 + r1
>      ,[1, 1/2, 1/2, 0, 0, 2] -- pr
>      ,[0, 3/2,-1/2, 1, 0, 1]]::[[Rational]] -- r2 - r1

pci = 1
pri = 2

  m2b = [[0,   0, 1/3, 1/3, 1, 7/3] -- r0 + r2/2
       ,[1,   0, 1/3,   0, 0, 5/3] -- r1 - r2/2
       ,[0,   1,-1/3,   0, 0, 2/3]]-- pr * 2/3

x = 5/3 ok
y = 2/3 ok
p = 7/3 ok

(3) Max 3x+y       -- 3*4 +   0 = 12 ok
   Subject to:
     2x + y  <=  8 -- 2*4 +   0 =  8 ok
     2x + 3y <= 12 -- 2*4 + 3*0 <= 12 ok

x = 4
y = 0
p = 12

> m3 = [[1,-3,-1,0, 0, 0]
>      ,[0, 2, 1,1, 0, 8]                 -- 8/2 = 4 *
>      ,[0, 2, 3,0, 1, 12]]::[[Rational]] -- 12/2 = 6

pci = 1
pri = 1  
pe = 2

> m3a = [[1,  0, 1/2, 3/2, 0, 12] -- r0 + 3r1/2 -- 12/1/2 = 6
>       ,[0,  1, 1/2, 1/2, 0,  4] -- r*1/2      -- 14/1/2 = 8 
>       ,[0,  0,   2,  -1, 1,  4]]::[[Rational]] -- r2 - r1 -- 4/2 = 2 pr *

(4) Max 2x - 3y + 4z
   Subject to:
     4x - 3y + z <= 3  -- 4*0 - 3*7/4 + 33/4 = 54/4 == 13 1/2 WRONG!
      x +  y + z <= 10 --   0 +   0 + 3 ==  3 ok
     2x +  y - z <= 10 -- 2*0 -   0 - 3 == -3 ok

x = 0
y = 7/4
z = 33/4
p = 111/4

            *

> m4 = [[1,-2, 3,-4,0,0,0, 0]
>      ,[0, 4,-3, 1,1,0,0, 3] -- r1 * 1 = pr
>      ,[0, 1, 1, 1,0,1,0,10]
>      ,[0, 2, 1,-1,0,0,1,10]]::[[Rational]]

pci = 3
pri = 1

> m4a = [[1,14,-9,0, 4,0,0,12]                -- r0 + 4r1  : 12/-9
>       ,[0, 4,-3,1, 1,0,0, 3]                -- pr == r1  :  3/-3
>       ,[0,-3, 4,0,-1,1,0, 7]                -- r2 - r1   :  7/4 pr *
>       ,[0, 6,-2,0, 1,0,1,13]]::[[Rational]] -- r3 + r1   : 13/-2

pci = 2
pri = 2

> m4b = [[1,29/4,0,0, 5/4, 9/4,0, 111/4]  -- r0 + 9r2/4
>       ,[0,  7/4,0,1, 1/4, 3/4,0,  33/4]  -- r1 + 3r2/4
>       ,[0, -3/4,1,0,-1/4, 1/4,0,   7/4] -- r2/4
>       ,[0,  9/2,0,0, 1/2, 1/2,1,  33/2]]::[[Rational]] -- r3 + r2/2

x = 0
y = 7/4
z = 33/4
p = 111/4

(5) Max x + 2y - z -- 5 + 2*4 - 0     = 13 ok 
   Subject to:
     2x+y+z=14     -- 2*5 + 4  - 0    = 14 ok
     4x+2y+3z=28   -- 4*5 + 2*4 + 3*0 = 28 ok
     2x+5y+5z=30   -- 2*5 + 5*4 + 5*0 = 30 ok 
 
> m5 = [[-1,-2,1,0,0,0,1,0]
>       ,[ 2, 1,1,1,0,0,0,14]
>       ,[ 4, 2,3,0,1,0,0,28]
>       ,[ 2, 5,5,0,0,1,0,30]]::[[Rational]]

pci = 1
pri = 2

x = 5
y = 4
z = 0
p = 13

> m5a = [[1,-1/5, 0,3,0,0,  2/5,12] -- r0 + 2r2'
>        ,[0, 8/5, 0,0,1,0,-1/5, 8] -- r1 - r2'   8/8/5 = 5*
>        ,[0,16/5, 0,1,0,1,-2/5,16] -- r1 - 2r2' 16/16/5 = 5
>        ,[0, 2/5, 1,1,0,0, 1/5, 6]]::[[Rational]] --r2 * 1/5    6/2/5 = 15

pci = 0
pri = 1
prcoeff = 5/8

> m5b = [[1,0,0,3, 1/8,   0, 3/8,13] -- r0 + r1/5 -- 16-1 /40
>       ,[0,1,0,0, 5/8,   0,-1/8,5] --pr ok
>       ,[0,0,0,1,-1/8,-1/5,   0,0] -- r2 - 16r1/5 
>       ,[0,0,1,1,-1/4,   0,-1/4,4]]::[[Rational]] -- r3 - 2r1/5 -- 6 - 10/5

x = 5
y = 4
z = 0
p = 13

(6) Max. 2x + y
   Subject to:
     2x + 3y = 34 -- 2*5 + 3*8 = 34 ok
      x + 5y = 45 --   5 + 5*8 = 45 ok
     3x + y  = 23 -- 3*5 +   8 = 23 ok

x = 5
y = 8
p = 18

> m6 = [[1,-2,-1, 0, 0, 0, 0]
>       ,[0,2, 3, 1, 0, 0, 34] -- 34/2 = 17 
>       ,[0,1, 5, 0, 1, 0, 45] -- 45/1
>       ,[0,3, 1, 0, 0, 1, 23]]::[[Rational]] -- 23/3


(7) Max. 2x - 3y
       Subject to:
          x - 3y + 2z <= 3
         -x + 2y      >= 2
 
* http://mat.gsia.cmu.edu/classes/QUANT/NOTES/chap7.pdf

> m7 = [[1,-2, 3,0,0, 0,0]
>        ,[0, 1,-3,2,1, 0,3] -- r * 1
>        ,[0,-1, 2,0,0, 1,2]]::[[Rational]]

pci = 1
pri = 1

Need to split the "unrestricted variable" x into x = x' - x''.

> m7a = [[1,-2, 2, 3,0,0, 0, 0]
>         ,[0, 1,-1,-3,2,1, 0, 3] -- pr *
>         ,[0,-1, 1, 2,0,0, 1, 2]]::[[Rational]]

pci = 1
pri = 1

fromJust Nothing!

> m7b = [[1,0, 0,-3,4,2,0,6] -- r0 + 2r1
>         ,[0,1,-1,-3,2,1,0,3] -- r1 * 1
>         ,[0,0, 0,-1,2,1,1,5]]::[[Rational]] -- r2 + r1

pci = 3
pri = NOOOO! TBD!

(8) Max. x + y    -- 5/3 + 2/3 = 7/3 ok
    Subject to:
      2x + y  = 4 -- 2*5/3 +  2/3 = 12/3 = 4 ok
       x + 2y = 3 --   5/3 + 2*2/3 = 9/3 = 3 ok

> m8 = [[1,-1,-1,0,0,0]
>        ,[0, 2, 1,1,0,4]
>        ,[0, 1, 2,0,1,3]]::[[Rational]]

p = 7/3 ok
x = 5/3 ok
y = 2/3 ok

(9) Max 4x + y + z          -- = 12 + 0 + 0 = 12 ok
        Subject to:
           x + 3z <= 6      -- = 1*3 + 0*0 + 3*0 = 3 <= 6 ok
          3x + y + 3z <= 9  -- = 3*3 + 0*0 + 3*0 = 9 == 0 ok

x = 3
y = 0
z = 0
p = 12

> m9 = [[1,-4,-1,1,0,0,0]
>       ,[0, 1, 0,3,1,0,6]
>       ,[0, 3, 1,3,0,1,9]]::[[Rational]]

(10) Max. 2x + y     -- 2*1 + 3   =  5 ok
       Subject to:
         3x + y <= 6 -- 3*1 + 1*3 =  6 <= 6 ok
          x - y <= 2 -- 1*1 - 1*3 = -2 <= 2 ok
              y <= 3 -- 1*3       =  3 <= 3 ok

x = 1
y = 3
p = 5

> m10 = [[1,-2,-1,0,0,0,0]
>        ,[0, 3, 1,1,0,0,6]
>        ,[0, 1,-1,0,1,0,2]
>        ,[0, 0, 1,0,0,1,3]]::[[Rational]]

(11) Maximise 2x - y + 4z -- 4 - 7 + 5 = 2 
Subject to:
  3x + 3y + z = 32 -- 6 + 21 + 5 = 32 
   x +  y + z = 14 -- 2 + 7 + 5 = 14
  2x +  y - z = 6  -- 4 + 7 - 5 = 6

x = 2
y = 7
z = 5
p = 2

> m11 = [[1,-2, 1,-4, 0, 0, 0,  0]
>       ,[0, 4, 3, 1, 1, 0, 0, 32]               -- s1  
>       ,[0, 1, 1, 1, 0, 1, 0, 14]               -- s2 *
>       ,[0, 2, 1,-1, 0, 0, 1, 6]]::[[Rational]] -- s3
