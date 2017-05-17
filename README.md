# The Simplex method

## Example 1

Maximise:

  p = 2x - 2y + 4z

             *
       p x y z s1 s2 s3 b

> t1 = [[-2,2,-4,0,0,0,0]  -- p

>      ,[4,3,1,1,0,0,3]    -- s1  

>      ,[1,1,1,0,1,0,10]   -- s2 *

>      ,[2,1,-1,0,0,1,10]] -- s3


Select the column with the most negative p as the pivot column:

==> z (column 3).

Select the row with the least positive b/z value:

==> 3/1,10/1,10/-1,0/4

==> s2 (row 2)

So the pivot element is col 3 row 2 == 1.

Clear the pivot column.

This is already in row echelon form.

> t2 = [[2,6,0, 0, 4,0, 1,40]] -- p + 4s2

>      ,[3,2,0, 1,-1,0, 0,-7]  -- s1 - s2

>      ,[1,1,1, 0, 1,0, 0,10]  -- s2 => z

>      ,[3,2,0, 0, 1,1, 0,20]] -- s3 + s2

The columns with only 1 non-zero value (active variables) are:

  z, s1, s3, p

Solution:

  z=10/1, s1=-7/1, s3=20/1, p=40/1

x = 0, y = 0, z = 10, p = 40

Check:

  2*0 - 2*0 + 4*10 = 40 - ok!

## Example 2

Ax = b

   Ax       b

[[2,3]  = [[34]
,[1,5]  = ,[45]
,[1,0]] = ,[15]] 

 x = [x1,x2]

Tableau 1

>   x1 x2 s1 s2 s3  p  b

> s1 2   3 1  0  0  0  34 

> s2 1   5 0  1  0  0  45

> s3 1   0 0  0  1  0  15

> p -2  -1 0  0  0  1  0

Select the pivot column as the most negative value of the p row excluding column b.

So x1 == -2 is the pivot column.

Select the pivot row as the least positive value of b/x.

By inspection:

s3 = 15/1 = 15

and (x1, s3) (col 0, row 2) is the pivot element.

Reduce the tableau to row echelon form in terms of addition and subtraction of the scaled pivot row.

> s2' = s2 -  s3 =  0 5 0 1 -1 0 30

> s1' = s1 - 2s3 = 0 3 1 0 -1 0 4

>                  1 0 0 0  1 0 15

> p'  = p + 2s3' = 0 -1  0 0 2 1 30

Tableau 2

> 0 3  1 0 -1 0 4

> 0 5  0 1 -1 0 30

> 1 0  0 0 1  0 15

> 0 -1 0 0 2  1 30

Select the next negative objective value as the next pivot colum otherwise stop

> pc = col 2

By inspection rhs/entering variable 4/3,30/5=6,15/0=15 so col 2 row 1 is the pivot element.

> 0 0 1 -3/5 -2/5 0 -14   R1-3R2

> 0 1 0 1/5 -1/5 0 6

> 1 1 0 1/5 4/5  0 21 R3+R2

> 0 0 0 1/5  2 14/5 1 36 R4+R2

> x0 = 5

> x1 = 4

> x4 = 8

* SIAM Review, 1995, Vol. 37, No. 2 : pp. 230-234
* A Nonlinear Programming Algorithm for Hospital Management, Frank H. Mathis and Lenora Jane Mathis (doi: 10.1137/1037046)
* http://scicomp.stackexchange.com/questions/772/what-are-the-advantages-disadvantages-of-interior-point-methods-over-simplex-met

## Nelder-Mead simplex method

The problem with the simplex method is it cannot be generalized to nonlinear problems, i.e. the majority of real world problems. – user4061

The main obstacles in primal simplex are making sure that you implement Phase I and Phase II correctly, and also that you implement an anticycling rule correctly. The main obstacles in implementing an interior point method for linear programming tend to be more about implementing the iterative method correctly, and scaling the barrier parameter accordingly.

* http://rads.stackoverflow.com/amzn/click/1886529191

## Bland's rule	

"In the worst case the simplex method may require an exponential number of pivots, although, as mentioned earlier, no naturally occurring problem has ever exhibited such behavior".

## Hirsch conjecture - an algorithm which constructs a solution using m-pivots. This has not been found. 

Based on personal experience, I'd say that simplex methods are marginally easier to understand how to implement than interior point methods, based on personal experience from implementing both primal simplex and a basic interior point method in MATLAB as part of taking a linear programming class. The main obstacles in primal simplex are making sure that you implement Phase I and Phase II correctly, and also that you implement an anticycling rule correctly. The main obstacles in implementing an interior point method for linear programming tend to be more about implementing the iterative method correctly, and scaling the barrier parameter accordingly.

You can find a more complete discussion of the pros and cons of each algorithm in a textbook on linear programming, such as Introduction to Linear Optimization by Bertsimas and Tsitsiklis. (Disclaimer: I learned linear programming from this textbook, and took linear programming at MIT from Bertsimas' wife.) Here are some of the basics:

## Pros of simplex:

* Given n decision variables, usually converges in O(n) operations with O(n) pivots.

* Takes advantage of geometry of problem: visits vertices of feasible set and checks each visited vertex for optimality. (In primal simplex, the
reduced cost can be used for this check.)

* Good for small problems.

## Cons of simplex:

* Given n decision variables, you can always find a problem instance where the algorithm requires O(2n) operations and pivots to arrive at a solution.

* Not so great for large problems, because pivoting operations become expensive. Cutting-plane algorithms or delayed column generation algorithms
like Dantzig-Wolfe can sometimes compensate for this shortcoming.

## Pros of interior point methods:

* Have polynomial time asymptotic complexity of:

  O(n 3.5 L 2 logL log log L)

where

  L is the number of bits of input to the algorithm.

* Better for large, sparse problems because the linear algebra required for the algorithm is faster.

## Cons of interior point methods:

* It's not as intuitively satisfying because you're right, these methods don't visit vertices. They wander through the interior region, converging on a solution when successful.

* For small problems, simplex will probably be faster. (You can construct pathological cases, like the Klee-Minty cube.)

...

A good summary. Klee-Minty in fact seems to be designed to confound simplex LP methods... – J. M. Jan 15 '12 at 5:15	 
	
@J. M. Yes, that's exactly the point of it -- it is an explicit construction to show that simplex methods are not polynomial (although there are variants that make interior point methods cry, too). – Christian Clason

The answer is easy. They both (simplex and interior point methods) are a mature field from an algorithmic point of view. They both work very well in practice. The good reputation of I.P.M. (interior point methods) is due to its polynomial complexity in the worst case. That is not the case for simplex which has combinatorial complexity. Nevertheless, combinatorial linear programs almost never happen in practice. For very large scale problems, I.P. seems to be a bit faster, but is not necessary the rule. In my opinion I.P. can be easy to understand and implement, but for sure, someone else can disagree, and that is fine. Now, in L.P, if the solution is unique, it is definitely be in a vertex, (both I.P. and Simplex do well here as well). The solution also can be on a face of the polyhedron or on an edge in which case, the adjacent vertex is (or vertices are) also a solution (again, both I.P. and simplex do well). So they are pretty much the same.

http://www.hec.ca/en/cam/help/topics/The_steps_of_the_simplex_algorithm.pdf
http://www.ams.org/notices/200703/fea-gale.pdf
http://math.uww.edu/~mcfarlat/s-prob.htm
http://web.stanford.edu/~yyye/SimplexMDP3.pdf

## Tests

(1) Maximise:

> x + 2y

Subject to:

> 2x + y <= 4 -- 5/2 < 4   ok

> x + 2y <= 5 -- 2*5/2 = 5 ok

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

(2) Maximise:

> x + y -- 7/3

Subject to:

> 2x + y <= 4  -- 2*5/3 + 2/3 = 12/3 = 4 ok
 
>  x + 2y <= 3  -- 5/3 + 2*2/3 = 9/3 = 3 ok

> m2 =[[-1,-1,0,0,1, 0]

>      ,[ 2, 1,1,0,0, 4]  -- 4/2 = 2*

>      ,[ 1, 2,0,1,0, 3]]::[[Rational]]

pci = 0
pri = 1
prc = 2
pe = 2

x = 5/3 ok
y = 2/3 ok
p = 7/3 ok

> m2a = [[0,-1/2, 1/2, 0, 1, 2] -- r0 + r1

>      ,[1, 1/2, 1/2, 0, 0, 2] -- pr

>      ,[0, 3/2,-1/2, 1, 0, 1]]::[[Rational]] -- r2 - r1

pci = 1
pri = 2

> m2b = [[0,   0, 1/3, 1/3, 1, 7/3] -- r0 + r2/2

>       ,[1,   0, 1/3,   0, 0, 5/3] -- r1 - r2/2

>       ,[0,   1,-1/3,   0, 0, 2/3]]-- pr * 2/3

x = 5/3 ok
y = 2/3 ok
p = 7/3 ok

> m2c = [[0,  3/2, -1/2, 1, 0, 1]

>       ,[0, -1/2, -1/2, 0, 1, -2]   -- r2 + r0

>       ,[1,  1/2, 1/2,  0, 0, 2]]::[[Rational]]

> m2d = [[2,  3, 0, 1, 0, 12]

>       ,[-3,-1, 0, 0, 1, 0]

>       ,[2,  1, 1, 0, 0, 8]]::[[Rational]]

(3) Max 3x+y      -- p = 11 not 14 NO!
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
     4x - 3y + z <= 3  -- 4*0 - 3*0 + 3 ==  3 ok
      x +  y + z <= 10 --   0 +   0 + 3 ==  3 ok
     2x +  y - z <= 10 -- 2*0 -   0 - 3 == -3 ok

x = 0
y = 7/4
z = 0
p = 111/4

x = 0
y = 0
z = 3
p = 12

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

(5) Max x+2y-z
   Subject to:
     2x+y+z=14    2*5 + 4  - 0    = 14 ok
     4x+2y+3z=28  4*5 + 2*4 + 3*0 = 28 ok
     2x+5y+5z=30  2*5 + 5*4 + 5*0 = 30 ok 
 
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

pci = 0
pri = 3
prcoeff = 1/3

> m6a = [[0,-1/3,0,0, 2/3,1,76/3] -- r0 + 2r3

>        ,[0, 7/3,1,0,-1/3,0,56/3] -- r1 - 2r3

>        ,[0,14/3,0,1,-1/3,0,112/3] -- r2 - r3

>        ,[1, 1/3,0,0, 1/3,0,23/3]]::[[Rational]]-- r3 * 1/3 pr

(30+46)/3 = 76/3 -- r1 
(102 - 46)/3 = 56/3 -- r2
(135 - 23)/3 = 112/3 -- r3

pci = 1
pri = 2
prcoeff = 3/14

24*3/7  = 72/7 = 10 2/7
30*3/14 = 45/7 = 6 3/7
5*3/1   = 15

loop m6 : x = 5, y = 8, p = 18

> m6b = [[0,0,0,-1/6,125/42,1,7] -- r0 + r2/3

>        ,[0,0,1,-1/2,   1/6,0,9] -- r1 - 7r2/3 

>        ,[0,1,0,3/14, -1/14,0,45/7] -- r2 * 3/14

>        ,[1,0,0,1/14, 17/42,0,7/3]]::[[Rational]] -- r3 - r2/3

pci = 3
pri = 3

> m6c = [[0,0,0, 1/14, 9/14,1,18]

>       ,[0,0,1, -1/2, -1/2,0,0]

>       ,[0,1,0, 3/14,-1/14,0,8]

>       ,[1,0,0,-1/14, 5/14,0,5]]::[[Rational]]

7.1.1) Max. 2x - 3y
Subject to:
  x - 3y + 2z = <= 3
 -x + 2y >= 2
 
http://mat.gsia.cmu.edu/classes/QUANT/NOTES/chap7.pdf

> m711 = [[1,2, 3,0,0, 0,0]
>        ,[0, -1,-3,2,1, 0,3] -- r * 1
>        ,[0,1, 2,0,0, 1,2]]::[[Rational]]

pci = 1
pri = 1

Need to split the "unrestricted variable" x into x = x' - x''.

> m711a = [[1,-2, 2, 3,0,0, 0, 0]

>         ,[0, 1,-1,-3,2,1, 0, 3] -- pr *

>         ,[0,-1, 1, 2,0,0, 1, 2]]::[[Rational]]

> m711b = [[1,0, 0,-3,4,2,0,6] -- r0 + 2r1

>         ,[0,1,-1,-3,2,1,0,3] -- r1 * 1

>         ,[0,0, 0,-1,2,1,1,5]]::[[Rational]] -- r2 + r1

pci = 3
pri = NOO1212

7.2.1) Max x + y CORRECT
Subject to:
 2x + y  = 4
  x + 2y = 3

> m721 = [[1,-1,-1,0,0,0]

>        ,[0, 2, 1,1,0,4]

>        ,[0, 1, 2,0,1,3]]::[[Rational]]

p = 7/3 ok
x = 5/3 ok
y = 2/3 ok

pci = 1
pri = 1

> m721a = [[1,0,-1/2,-1/2,0,2] -- r0 + r1' WRONG

>         ,[0,1, 1/2, 1/2,0,2] -- r1*1/2

>         ,[0,0, 3/2,-1/2,1,1]]::[[Rational]] -- r3 - r1'

p = 4
x = 3/2

Ex. 62) Max 4x + y + z
Subject to:
  x + 3z <= 6
 3x + y + 3z <= 9

> m62 = [[1,-4,-1,1,0,0,0]

>       ,[0, 1, 0,3,1,0,6]

>       ,[0, 3, 1,3,0,1,9]]::[[Rational]]

pci = 1
pri = 2

[[1,0, 1/3,3,0, 4/3,12]

,[0,0,-1/3,2,1,-1/3, 3] -- r1 - r2

,[0,1, 1/3,1,0, 1/3, 3]] -- r2*1/3

p = 12
x = 3

7.3.1) Max. 2x + y

Subject to:

  3x + y <= 6
   x - y <= 2
       y <= 3

> m731 = [[1,-2,-1,0,0,0,0]

>        ,[0, 3, 1,1,0,0,6]

>        ,[0, 1,-1,0,1,0,2]

>        ,[0, 0, 1,0,0,1,3]]::[[Rational]]

By hand:

pci = 1
pri = 1 -- could be 2 as tied.

> m731a = [[1,0,-1/3, 2/3,0,4] -- r0 + 2r1'

>         ,[0,1, 1/3, 1/3,0,2] -- r1'

>         ,[0,0,-4/3,-1/3,1,0] -- r2 - r1'

>         ,[0,0,   1,   0,1,3]]::[[Rational]] -- r3 

pci = 2
pri = 3

> m731b = [[0,1,0,   1,1/3, 5] -- r0 + r3''*1/3

>         ,[0,1,0, 1/3, -1,-1] -- r1 - r3

>         ,[0,0,0,-1/3,7/3,12] -- r2 + 4r3''/3

>         ,[0,0,1,   0,  1, 3]]::[[Rational]]

p = 5
y = 3
