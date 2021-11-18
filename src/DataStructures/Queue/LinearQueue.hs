module DataStructures.Queue.LinearQueue (
    Queue
    , empty
    , isEmtpy
    , size
    , isElem
    , first
    , enqueue
    , dequeue
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

    instance (Show a) => Show (Queue a) where
        show q = "LinearQueue(" ++ intercalate "," (queueToList q) ++ ")" 

    queueToList :: (Show a) => Queue a -> [String]
    queueToList Empty  = []
    queueToList (Node x q) = show x : queueToList q

    -- TODO: Implement Queue equality
    -- TODO: Implement map
    -- TODO: Implement reduce
    -- TODO: Implement filter