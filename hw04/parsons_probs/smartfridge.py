class SmartFridge:
    """"
    >>> fridgey = SmartFridge()
    >>> fridgey.add_item('Mayo', 1)
    'I now have 1 Mayo'
    >>> fridgey.add_item('Mayo', 2)
    'I now have 3 Mayo'
    >>> fridgey.use_item('Mayo', 2.5)
    'I have 0.5 Mayo left'
    >>> fridgey.use_item('Mayo', 0.5)
    'Uh oh, buy more Mayo!'
    """

    def __init__(self):
        self.items = {}

    def add_item(self, item, quantity):
        "*** YOUR CODE HERE ***"
        if item in self.items:
            self.items[item] += quantity
        else:
            self.items.setdefault(item, quantity)
        return 'I now have {} {}'.format(self.items[item], item)


    def use_item(self, item, quantity):
        "*** YOUR CODE HERE ***"
        if self.items[item] < quantity:
            self.items[item] = 0
        else:
            self.items[item] -= quantity
        if self.items[item] == 0:
            return 'Uh oh, buy more {}!'.format(item)
        else:
            return 'I have {} {} left'.format(self.items[item], item)
            
