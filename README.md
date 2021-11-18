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

## Queue
A queue is a FIFO (First In First Out) linear data structure.

### Supported operations
| Operation | Description                                              | Time complexity |
| --------- | -------------------------------------------------------- | --------------- |
| `isEmpty` | Checks whether if the queue is empty or not              | `O(1)`          |
| `size`    | Returns the length of the queue                          | `O(n)`          |
| `first`   | Returns the first element on the queue                   | `O(1)`          |
| `enqueue` | Puts the element at the end of the queue                 | `O(n)`          |
| `dequeue` | Removes the first element of the queue                   | `O(1)`          |
| `apply`   | Applies a function to all the elements in the queue      | `O(n * O(f))`   |
| `fold`    | Reduces the queue by applying a function to its elements | `O(n * O(f))`   |
| `sieve`   | Filters the elements that don't satisfy a condition      | `O(n * O(f))`   |

---

## Set
A set contains elements without repetition. For this purpose the elements must be comparable.

#### Supported operations
| Operation      | Description                                              | Time complexity |
| -------------- | -------------------------------------------------------- | --------------- |
| `isEmpty`      | Checks whether if the set is empty or not                | `O(1)`          |
| `size`         | Returns the number of elements in the set                | `O(n)`          |
| `isElem`       | Chekcs if an element is contained in a set               | `O(n)`          |
| `insert`       | Inserts an element in the set                            | `O(n)`          |
| `fold`         | Reduces a set by applying a function and a default value | `O(n * O(f))`   |
| `union`        | Returns the union of two sets (sizes `n` and `m`)        | `O(n+m)`        |
| `intersection` | Returns the intersection of two sets (sizes `n` and `m`) | `O(n+m)`        |
| `difference`   | Returns the difference of two sets (sizes `n` and `m`)   | `O(n+m)`        |
| `remove`       | Removes an element from the set if it's present          | `O(n)`          |

### Implementations

#### Linear set
The elements aren't stored in any particular order, making the `contains` operation `O(n)`. Since the `insert` operation depends on the `contains` operation it is also `O(n)`.
> Note: The `remove` operation reverses the set when performed on a LinearSet.


#### Sorted set
The elements are stored in increasing order, making the `contains` operation faster in some cases, but it will still be `O(n)`.