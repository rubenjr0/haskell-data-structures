module DataStructures.Set.SortedSet ( 
    Set
    , empty
    , isEmpty
    , size
    , contains
    , insert
    , join
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

    contains :: (Ord a, Eq a) => Set a -> a -> Bool
    contains Empty _ = False
    contains (Node y s) x
        | x < y     = False
        | otherwise = x == y || contains s x

    insert :: (Ord a, Eq a) => a -> Set a -> Set a
    insert x Empty = Node x Empty
    insert x (Node y s)
        | x < y  = Node x (Node y s)
        | x == y = Node y s
        | otherwise = Node y (insert x s)

    join :: (Ord a, Eq a) => Set a -> Set a -> Set a
    join s1 Empty = s1
    join Empty s2 = s2
    join s1 s2 = mix s1 s2 Empty
        where
            mix Empty Empty saux                = saux
            mix (Node x s1') Empty saux         = mix s1' Empty (insert x saux)
            mix Empty (Node y s2') saux         = mix Empty s2' (insert y saux)
            mix (Node x s1') (Node y s2') saux  = mix s1' s2' (insert x $ insert y saux)

    remove :: (Ord a, Eq a) => a -> Set a -> Set a
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