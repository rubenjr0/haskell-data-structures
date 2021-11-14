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

### Usage
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

### Supported operations
| Operation  | Description                                     | Time complexity |
| ---------- | ----------------------------------------------- | --------------- |
| `isEmpty`  | Checks whether if the set is empty or not       | `O(1)`          |
| `size`     | Returns the number of elements in the set       | `O(n)`          |
| `contains` | Chekcs if the set contains a certain element    | `O(n)`          |
| `insert`   | Inserts an element in the set                   | `O(1)`          |
| `remove`   | Removes an element from the set if it's present | `O(n)`          |

### Usage
```hs
s :: Set Integer
s = insert 3 $ push 2 $ push 1 empty

size s          -- 3
isEmpty (pop s) -- False
contains s 2    -- True
insert 4 s      -- LinearSet(4,3,2,1)
remove 3 s      -- LinearStack(1,2,4); The set is reversed
```
