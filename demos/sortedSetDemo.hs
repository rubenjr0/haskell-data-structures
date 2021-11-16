import DataStructures.Set.SortedSet

s1 = insert 1 $ insert 2 $ insert 3 $ insert 4 empty
s2 = insert 4 $ insert 5 $ insert 6 $ insert 7 empty

s3 = union s1 s2

sumS1 = fold (+) 0 s1
sumS2 = fold (+) 0 s2

s4 = remove 1 $ remove 3 $ remove 5 $ remove 7 s3

s5 = intersection s1 s2