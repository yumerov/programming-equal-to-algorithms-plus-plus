from pprint import pprint as print
from sys import argv


class ProductCombinations(object):
    def __init__(self, number: int):
        self.number = number
        self.products = []
        self.buffer = {}
    # def __init__

    def _compute(self, start: int, position: int):
        if start == 1:
            self.products.append(list(self.buffer.values())[1:])
            return
        # if

        for head in range(start, 1, -1):
            self.buffer[position] = head
            lesser_than = (self.buffer[position] <= self.buffer[position - 1])
            is_dividable = ((start % head) == 0)
            if lesser_than and is_dividable:
                self._compute(start // head, position + 1)
            # if
        # for

        return self
    # def _compute

    def compute(self):
        self.buffer[0] = self.number + 1
        self._compute(self.number, 1)

        return self
    # def compute
# class SumCombinations

UPPER_LIMIT = 4 if len(argv) == 1 else (int(argv[1]) + 1)
INIT_INDEX = 1
for i in range(INIT_INDEX, UPPER_LIMIT):
    print({i: ProductCombinations(i).compute().products})
