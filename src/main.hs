import qualified DataStructures.Stack.LinearStack as LStack
import qualified DataStructures.Set.LinearSet as LSet

linStack :: LStack.Stack Int
linStack = LStack.push 2 $ LStack.push 3 LStack.empty

linSet :: LSet.Set Int
linSet = LSet.insert 8 $ LSet.insert 4 $ LSet.insert 2 $ LSet.insert 3 LSet.empty