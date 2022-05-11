# from itertools import Predicate
# from lib2to3.pygram import python_grammar_no_print_statement
# from tkinter import N


def neighbor_digits(num, prev_digit=-1):
    """
    Returns the number of digits in num that have the same digit to its right
    or left.
    >>> neighbor_digits(111)
    3
    >>> neighbor_digits(123)
    0
    >>> neighbor_digits(112)
    2
    >>> neighbor_digits(1122)
    4
    """
    "*** YOUR CODE HERE ***"
    if num == 0:
        return 0

    if num % 10 == (num // 10) % 10:
        sums = 1
        prev_digit = 1
    elif prev_digit == 1:
        sums = 1
        prev_digit = 0
    else:
        sums = 0

    return sums + neighbor_digits(num // 10, prev_digit)



