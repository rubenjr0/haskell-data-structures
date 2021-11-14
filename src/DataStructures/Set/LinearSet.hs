module DataStructures.Set.LinearSet ( 
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

    empty :: Set a
    empty = Empty

    isEmpty :: Set a -> Bool
    isEmpty Empty   = True
    isEmpty _       = False

    size :: Set a -> Integer
    size Empty = 0
    size (Node x s) = 1 + size s

    contains :: (Eq a) => Set a -> a -> Bool
    contains Empty _ 		= False
    contains (Node y s) x 	= x == y || contains s x 

    insert :: (Eq a) => a -> Set a -> Set a
    insert x s
        | contains s x 	= s
        | otherwise 	= Node x s

    join :: (Eq a) => Set a -> Set a -> Set a
    join s1 Empty = s1
    join Empty s2 = s2
    join s1 s2 = mix s1 s2 Empty
        where
            mix Empty Empty saux = saux
            mix (Node x s1') Empty saux         = mix s1' Empty (insert x saux)
            mix Empty (Node y s2') saux         = mix Empty s2' (insert y saux)
            mix (Node x s1') (Node y s2') saux  = mix s1' s2' (insert x $ insert y saux)

    remove :: (Eq a) => a -> Set a -> Set a
    remove _ Empty = error "remove on empty set"
    remove x s
        | not(contains s x) = s
        | otherwise 	    = del x s Empty
        where
            del x (Node y s) saux
                | x /= y 	= del x s (insert y saux)
                | x == y 	= join s saux

    instance (Show a) => Show (Set a) where
        show s = "Set(" ++ intercalate "," (setToList s) ++ ")"

    setToList :: (Show a) => Set a -> [String]
    setToList Empty       = []
    setToList (Node x s)  = show x : setToList s 

    -- TODO: Implement Set equality