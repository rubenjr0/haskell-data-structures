module DataStructures.Set.LinearSet ( 
    Set
    , empty
    , isEmpty
    , size
    , contains
    , insert
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

    remove :: (Eq a) => a -> Set a -> Set a
    remove _ Empty = error "remove on empty set"
    remove x s
        | contains s x 	= del s x Empty
        | otherwise 	= s
        where
            del (Node y s) x s'
                | isEmpty s = insert y s'
                | x /= y 	= del s x (insert y s')
                | x == y 	= del s x s'

    instance (Show a) => Show (Set a) where
        show s = "Set(" ++ intercalate "," (setToList s) ++ ")"

    setToList :: (Show a) => Set a -> [String]
    setToList Empty       = []
    setToList (Node x s)  = show x : setToList s 

    -- TODO: Implement Set equality