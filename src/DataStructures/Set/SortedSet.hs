module DataStructures.Set.SortedSet ( 
    Set
    , empty
    , isEmpty
    , size
    , isElem
    , insert
    , fold
    , union
    , intersection
    , difference
    , remove
  ) where

    import Data.List(intercalate)

    data Set a = Empty | Node a (Set a)

    empty ::Set a
    empty = Empty

    isEmpty :: Set a -> Bool
    isEmpty Empty   = True
    isEmpty _       = False

    size :: Set a -> Integer
    size Empty      = 0
    size (Node _ s) = 1 + size s

    isElem :: (Ord a) => a -> Set a -> Bool
    isElem _ Empty = False
    isElem x (Node y s)
        | x < y     = False
        | otherwise = x == y || isElem x s

    insert :: (Ord a) => a -> Set a -> Set a
    insert x Empty = Node x Empty
    insert x n@(Node y s)
        | x < y  = Node x n
        | x == y = n
        | otherwise = Node y (insert x s)

    remove :: (Ord a) => a -> Set a -> Set a
    remove _ Empty = Empty
    remove x n@(Node y s)
        | x < y     = n
        | x == y    = s
        | otherwise = Node y (remove x s)

    fold :: (a -> b -> b) -> b -> Set a -> b
    fold f z = fun
        where
            fun Empty = z
            fun (Node x s) = f x (fun s)

    union :: (Ord a) => Set a -> Set a -> Set a
    union s1 Empty = s1
    union Empty s2 = s2
    union n1@(Node x s1) n2@(Node y s2)
        | x == y    = Node x (union s1 s2)
        | x < y     = Node x (union s1 n2)
        | otherwise = Node y (union n1 s2)

    intersection :: (Ord a) => Set a -> Set a -> Set a
    intersection _ Empty = Empty
    intersection Empty _ = Empty
    intersection (Node x s1) s2
        | isElem x s2   = Node x (intersection s1 s2)
        | otherwise     = intersection s1 s2

    difference :: (Ord a) => Set a -> Set a -> Set a
    difference Empty _ = Empty
    difference s Empty = s
    difference (Node x s1) s2
        | isElem x s2 = difference s1 s2
        | otherwise = Node x (difference s1 s2)

    instance (Show a) => Show (Set a) where
        show s = "Set(" ++ intercalate "," (setToList s) ++ ")"

    setToList :: (Show a) => Set a -> [String]
    setToList Empty       = []
    setToList (Node x s)  = show x : setToList s 

    -- TODO: Implement Set equality