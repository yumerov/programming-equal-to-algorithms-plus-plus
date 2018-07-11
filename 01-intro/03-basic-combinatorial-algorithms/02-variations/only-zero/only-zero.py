class OnlyZero(object):
    elements = []
    elements_count = 0
    base = 2
    ops = [lambda x: x, lambda x: -x]

    def __init__(self, elements: list):
        self.elements = elements
        self.elements_count = len(elements)

    def compute_slot(self, index, slot_index):
        op = (index // (self.base ** slot_index)) % self.base
        return self.ops[op](self.elements[slot_index])

    def format_variation(self, variation):
        output = ""

        for element in variation:
            if element > 0: output += " +{}".format(element)
            else: output += " {}".format(element)

        output += " = 0"

        return output

    def compute(self):
        valid_variations = []
        for index in range(0, self.base ** self.elements_count):
            slot_range = range(0, self.elements_count)
            elements = [self.compute_slot(index, slot_index) for slot_index in slot_range]

            if sum(elements) == 0:
                valid_variations.append(elements)

        return [self.format_variation(variation) for variation in \
                valid_variations]


print(OnlyZero([1, 2, 3, 4, 5, 6, 7, 8]).compute())
