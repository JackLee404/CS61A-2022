from operator import truediv


def digit_pos_match(n, k):
    """
    >>> digit_pos_match(980, 0) # .Case 1
    True
    >>> digit_pos_match(980, 2) # .Case 2
    False
    >>> digit_pos_match(98276, 2) # .Case 3
    True
    >>> digit_pos_match(98276, 3) # .Case 4
    False
    """
    "*** YOUR CODE HERE ***"
    str_n = str(n)
    length = len(str_n)
    if length < k:
        return False
    if str_n[-1 - k] == str(k):
        return True
    return False
