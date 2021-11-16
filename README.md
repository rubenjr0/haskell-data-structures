# Haskell Data Structures
Different data structures implemented in Haskell

```console
$ ghci -isrc src/main.hs
```

# Data structures

## Stack
An stack is a LIFO (Last In First Out) linear data structure.

### Supported operations
| Operation | Description                                 | Time complexity |
| --------- | ------------------------------------------- | --------------- |
| `isEmpty` | Checks whether if the stack is empty or not | `O(1)`          |
| `size`    | Returns the number of elements in the stack | `O(n)`          |
| `top`     | Returns the element on top of the stack     | `O(1)`          |
| `push`    | Pushes an element onto the stack            | `O(1)`          |
| `pop`     | Pops the element on top of the stack        | `O(1)`          |

### Example usage
```hs
s :: Stack Integer
s = push 3 (push 2 (push 1 empty))

size s          -- 3
isEmpty (pop s) -- False
top s           -- 3
push 4 s        -- LinearStack(4,3,2,1)
pop s           -- LinearStack(3,2,1)
```
---

## Set
A set contains elements without repetition. For this purpose the elements must be comparable.

#### Supported operations
| Operation  | Description                                     | Time complexity |
| ---------- | ----------------------------------------------- | --------------- |
| `isEmpty`  | Checks whether if the set is empty or not       | `O(1)`          |
| `size`     | Returns the number of elements in the set       | `O(n)`          |
| `isElem`   | Chekcs if an element is contained in a set      | `O(n)`          |
| `insert`   | Inserts an element in the set                   | `O(n)`          |
| `fold`     | Reduces a set by applying a function and a default value | `O(n)`          |
| `union`    | Returns the union of two sets                   | `O(n^2)`        |
| `remove`   | Removes an element from the set if it's present | `O(n)`          |

### Implementations

#### Linear set
The elements aren't stored in any particular order, making the `contains` operation `O(n)`. Since the `insert` operation depends on the `contains` operation it is also `O(n)`.

#### Sorted set
The elements are stored in increasing order, making the `contains` operation faster in some cases, but it will still be `O(n)`.

### Example usage with SortedSet
```hs
s1 :: Set Integer
s1 = insert 1 $ insert 2 empty -- SortedSet(1,2)

s2 :: Set Integer
s2 = insert 4 $ insert 3 empty -- SortedSet(3,4)

s3 = union s1 s2 -- SortedSet(1,2,3,4)

size s3         -- 4
isEmpty s3      -- False
isElem 4 s3     -- True
insert 5 s3     -- SortedSet(1,2,3,4,5)
remove 3 s3     -- SortedSet(1,2,4,5)
fold (+) 0 s3   -- 0 + 1 + 2 + 3 + 4 = 10
```
> Note: The `remove` operation reverses the set when performed on a LinearSet.