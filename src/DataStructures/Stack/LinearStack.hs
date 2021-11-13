module DataStructures.Stack.LinearStack (
    Stack
    , empty
    , isEmpty
    , size
    , top
    , push
    , pop
) where

    import Data.List(intercalate)

    data Stack a = Empty | Node a (Stack a)

    empty :: Stack a
    empty = Empty

    isEmpty :: Stack a -> Bool
    isEmpty Empty   = True
    isEmpty _       = False

    size :: Stack a -> Integer
    size Empty      = 0
    size (Node x s) = 1 + size s

    top :: Stack a -> a
    top Empty       = error "top on empty stack"
    top (Node x s)  = x

    push :: a -> Stack a -> Stack a
    push x Empty        = Node x Empty
    push x (Node y s)   = Node x (Node y s)

    pop :: Stack a -> Stack a
    pop Empty       = error "pop on empty stack"
    pop (Node x s)  = s

    instance (Show a) => Show (Stack a) where
        show s = "LinearStack(" ++ intercalate ", " (stackToList s) ++ ")"

    stackToList :: (Show a) => Stack a -> [String]
    stackToList Empty       = []
    stackToList (Node x s)  = show x : stackToList s 

    instance (Eq a) => Eq (Stack a) where
        Empty       == Empty        = True
        Node x s    == Node x' s'   = x == x' && s == s'
        _           == _            = False