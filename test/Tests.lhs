> module Tests where

Coastal research deficit : https://plus.google.com/104603011082997519952/posts/YNnfQ2JgUut

(0) Max. x + 2y     -- 14/3 ok
    Subject to:
      2x + 3y <= 7  -- 7 ok
      3x + 4y <= 11 -- 28/3 = 9 1/3 ok

> m0 = [[1,-1,-2,0,0,0]
>      ,[0, 2, 3,1,0,7]
>      ,[0, 3, 4,0,1,11]]::[[Rational]]

pci = 2
pri = 1

m0a = [[1,1/2,0,2/3.0,14/3] -- r0 + r1/2
      ,[0,2/3,1,1/3,0,7/3], -- *r1/3
      ,[0,1/3,0,-1,1,5/3]]              -- r2 - 4r1/3

x = 0
y = 7/3
p = 14/3

rows m1 = [(0,[1,0,0])
          ,(1,[0,3/2,1/2])
          ,(2,[0,0,1])
          ,(3,[0,1,0])
          ,(4,[1.-1/,1/2)
          ,(5,[1,3/2,5/2])]


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
y = 0 (res prints 4 Urggh!)
p = 12

> m3 = [[1,-3,-1,0, 0, 0]
>      ,[0, 2, 1,1, 0, 8]                 -- 8/2 = 4 *
>      ,[0, 2, 3,0, 1, 12]]::[[Rational]] -- 12/2 = 6

pci = 1
pri = 1  
pe = 2  (fst $ head $ ris) : cids (tail ris)

> m3a = [[1,  0, 1/2, 3/2, 0, 12] -- r0 + 3r1/2 -- 12/1/2 = 6
>       ,[0,  1, 1/2, 1/2, 0,  4] -- r*1/2      -- 14/1/2 = 8 
>       ,[0,  0,   2,  -1, 1,  4]]::[[Rational]] -- r2 - r1 -- 4/2 = 2 pr *

(4) Max 2x - 3y + 4z -- y is unrestricted
   Subject to:
     4x - 3y + z <= 3  -- 4*0 - 3*7/4 + 33/4 = 27/2 == 3 ok
      x +  y + z <= 10 --   0 +   7/4 + 33/4 ==  10 ok
     2x +  y - z <= 10 -- 2*0 -   7/4 - 33/4 == -3 ok

2x - 3y + 4z = 111/4
4x - 3y +  z = 3
 x +  y +  z = 10
2x +  y -  z = -13/2

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
>       ,[0, 7/4,0,1, 1/4, 3/4,0,  33/4]  -- r1 + 3r2/4
>       ,[0,-3/4,1,0,-1/4, 1/4,0,   7/4] -- r2/4
>       ,[0, 9/2,0,0, 1/2, 1/2,1,  33/2]]::[[Rational]] -- r3 + r2/2

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

4,5,13

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

(6) Max. 2x + y -- 10 + 8 = 18
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


(7) Max. 2x - 3y -- unbounded as all ratios negative.
       Subject to:
          x - 3y + 2z <= 3
         -x + 2y      >= 2
 
* http://mat.gsia.cmu.edu/classes/QUANT/NOTES/chap7.pdf

> m7 = [[1,-2, 3,0,0, 0,0]
>      ,[0, 1,-3,2,1, 0,3]
>      ,[0, 1,-2,0,0, 1,2]]::[[Rational]] -- pr

fromJust Nothing! Need to add unbounded test to ratios!

> m7b = [[1,0,-1,0,0,2,4] -- r0 + 2r2
>       ,[0,0,-5,2,1,-1,1] -- r1  + r2
>       ,[0,1,-2,0,0,1,2]]::[[Rational]] -- r2 + r1

pci = 2
pri = all ratios negative so unbounded.

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

(10) Max. 2x + y     --  5 ok => degenerate
       Subject to:
         3x + y <= 6 --  6 ok
          x - y <= 2 -- -2 ok
              y <= 3 --  3 ok

* http://mat.gsia.cmu.edu/classes/QUANT/NOTES/chap7.pdf

res => 4,1,5 WRONG!

x = 1
y = 3
p = 5

if the == 1 cells are not in increasing order res scrambles the order.

> m10 = [[1,-2,-1,0,0,0,0]
>       ,[0, 3, 1,1,0,0,6]
>       ,[0, 1,-1,0,1,0,2]
>       ,[0, 0, 1,0,0,1,3]]::[[Rational]]

(11) Maximise 2x - y + 4z -- 4 - 7 + 5 = 2 
     Subject to:
       3x + 3y + z = 32 -- 54 + 42
        x +  y + z = 14 -- 2 + 7 + 5 = 14
       2x +  y - z = 6  -- 4 + 7 - 5 = 6

x = 20 y
y = 14 z
z = 18 x
p = 26 p

> m11 = [[1,-2, 1,-4, 0, 0, 0,  0]
>       ,[0, 4, 3, 1, 1, 0, 0, 32]               -- s1  
>       ,[0, 1, 1, 1, 0, 1, 0, 14]               -- s2 *
>       ,[0, 2, 1,-1, 0, 0, 1, 6]]::[[Rational]] -- s3

(12) Max. 5x + 3y + z     -- ok
     Subject to:
        x +  y + z <=  6  -- ok
       5x + 3y + z <= 15  -- ok
       x,y,z >= 0

> m12 = [[1,-5,-3,-1,0,0,0]
>       ,[0, 1, 1, 1,1,0, 6]
>       ,[0, 5, 3, 1,0,1,15]]::[[Rational]]

x = 3
p = 15

Pivoting on col y gives an alternate solution, so non-unique:

x = 5
p = 15.


(13) Min. x - y + 3z -- unbounded
  So Max. -x + y
     Subject to:
        x -  y +  z -  q + 0r = 2
       2x - 2y +  z + 0q -  r = 0
       all >= 0

> m13 = [[1, 1,-1, 3, 0, 0,0] 
>       ,[0, 1,-1, 1,-1, 1,2]
>       ,[0, 2, 2, 1, 0,-1,0]]::[[Rational]] -- pr

No positive ratios!

* https://math.stackexchange.com/questions/2255381/simplex-method-optimal-solution-for-a-minimization-problem-given-parameters?rq=1
* http://ocw.nctu.edu.tw/course/lp992/Lecture4.pdf
* https://math.stackexchange.com/questions/61689/choosing-pivot-differently-in-maximization-simplex-and-minimization-simplex-met
* http://www.ms.uky.edu/~rwalker/Class%20Work%20Solutions/class%20work%208%20solutions.pdf

(14) Min. -2x + y
  So Max. 2x - y
        x + 2y <= 6
       3x + 2y <= 12

> m14 = [[1,-2,1,0,0, 0]
>       ,[0, 1,2,1,0, 6]
>       ,[0, 3,2,0,1,12]]::[[Rational]]

[[1,-4,-1/3,0,-2/3,-8] -- r0 - 2r3/3
,[0, 0, 4/3,1,-1/3, 2] -- r1 - r2/3
,[0, 1, 2/3,0, 1/3, 4]] --*1/3

x = 4 res => 2 as 3rd row.
c = -8 = -p for min.

(15) Max. 2x + 3y
     Subject to:
       -x + 2y <= 4
        x +  y <= 6
	x + 3y <= 9

* http://www.universalteacherpublications.com/univ/ebooks/or/Ch3/splcase.htm

x and y are unrestricted in sign, eg. like bought or sold quantities.
So need to test an extra 2 columns for a 2 variable problem.

> m15 = [[1,-2, 2,-3, 3,0,0,0,0]
>       ,[0,-1, 1, 2,-2,1,0,0,4]
>       ,[0, 1,-1, 1,-1,0,1,0,6]
>       ,[0, 1,-1, 3,-3,0,0,1,9]]::[[Rational]]

x   = 9/2 -- ok
y'' = 3/2
p   = 27/2

> m15a = [[1, 7/2,-7/2,0, 0, 4/2,0,0,0]
>        ,[0,-1/2, 1/2,1,-1, 1/2,0,0,2]
>        ,[0, 3/2,-3/2,0, 0,-1/2,0,1,3]
>        ,[0, 5/2,-5/2,0, 0,-3/2,0,1,4]]::[[Rational]]
>

pci = 2
pri = 1

m15b = [[-1,0,7,-7,9/2,0,7/2,7] -- r0 + 7r1/2
       ,[-1,1,2,-2,  1,0,  0,4] -- r1*2
       ,[]
       ,[]]



