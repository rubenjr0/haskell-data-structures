import DataStructures.Set.SortedSet

s1 = foldr insert empty [1..4]
s2 = foldr insert empty [4..7]

s3 = union s1 s2

sumS1 = fold (+) 0 s1
sumS2 = fold (+) 0 s2

s4 = foldr remove s3 [1,3,5,7]

s5 = intersection s2 s4
s6 = difference s3 s4