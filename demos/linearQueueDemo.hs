import DataStructures.Queue.LinearQueue

q1 :: Queue Int
q1 = foldr enqueue empty [2,1..(-4)]

q2 = apply abs $ apply (+2) q1

q3 = sieve even q2