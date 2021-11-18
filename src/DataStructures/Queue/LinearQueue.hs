module DataStructures.Queue.LinearQueue (
    Queue
    , empty
    , isEmtpy
    , size
    , isElem
    , first
    , enqueue
    , dequeue
    , apply
    , fold
    , sieve
) where

    import Data.List(intercalate)

    data Queue a = Empty | Node a (Queue a)

    empty :: Queue a
    empty = Empty

    isEmtpy :: Queue a -> Bool
    isEmtpy Empty = True
    isEmtpy _ = False

    size :: Queue a -> Integer
    size Empty = 0
    size (Node _ q) = 1 + size q

    isElem :: (Eq a) => a -> Queue a -> Bool
    isElem _ Empty = False
    isElem x (Node y q) = x == y || isElem x q

    first :: Queue a -> a
    first Empty = error "first on empty queue"
    first (Node x _) = x

    enqueue :: a -> Queue a -> Queue a
    enqueue x Empty = Node x Empty
    enqueue x (Node y q) = Node y (enqueue x q)

    dequeue :: Queue a -> Queue a
    dequeue Empty = error "dequeue on empty queue"
    dequeue (Node x q) = q

    apply :: (a -> b) -> Queue a -> Queue b
    apply _ Empty = Empty
    apply f (Node x q) = Node (f x) (apply f q)

    fold :: (a -> b -> b) -> b -> Queue a -> b
    fold _ z Empty = z
    fold f z (Node x q) = f x (fold f z q)

    sieve :: (a -> Bool) -> Queue a -> Queue a
    sieve _ Empty = Empty
    sieve c (Node x q)
        | c x = Node x (sieve c q)
        | otherwise = sieve c q

    instance (Show a) => Show (Queue a) where
        show q = "LinearQueue(" ++ intercalate "," (queueToList q) ++ ")" 

    queueToList :: (Show a) => Queue a -> [String]
    queueToList Empty  = []
    queueToList (Node x q) = show x : queueToList q

    -- TODO: Implement Queue equality