module DataStructures.Set.SortedSet ( 
    Set
    , empty
    , isEmpty
    , size
    , isElem
    , insert
    , fold
    , union
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
    size (Node x s) = 1 + size s

    isElem :: (Ord a) => a -> Set a -> Bool
    isElem _ Empty = False
    isElem x (Node y s)
        | x < y     = False
        | otherwise = x == y || isElem x s

    insert :: (Ord a) => a -> Set a -> Set a
    insert x Empty = Node x Empty
    insert x (Node y s)
        | x < y  = Node x (Node y s)
        | x == y = Node y s
        | otherwise = Node y (insert x s)

    fold :: (a -> b -> b) -> b -> Set a -> b
    fold f z = fun
        where
            fun Empty = z
            fun (Node x s) = f x (fun s)

    union :: (Ord a) => Set a -> Set a -> Set a
    union s1 Empty = s1
    union Empty s2 = s2
    union s1 s2 = fold insert s1 s2

    remove :: (Ord a) => a -> Set a -> Set a
    remove _ Empty = Empty
    remove x (Node y s)
        | x < y     = Node y s
        | x == y    = s
        | otherwise = Node y (remove x s)

    instance (Show a) => Show (Set a) where
        show s = "Set(" ++ intercalate "," (setToList s) ++ ")"

    setToList :: (Show a) => Set a -> [String]
    setToList Empty       = []
    setToList (Node x s)  = show x : setToList s 

    -- TODO: Implement Set equality