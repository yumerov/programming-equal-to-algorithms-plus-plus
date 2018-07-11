class VariationWithoutRepetition(object):
    elements = []
    element_count = None
    slot_count = None

    def __init__(self, elements: list, slot_count: int):
        if slot_count > len(elements):
            raise Exception("slots cannot be more than elements")

        self.elements = elements
        self.element_count = len(elements)
        self.slot_count = slot_count

    def compute_slot(self, index, slot_index):
        return (index // (self.element_count ** slot_index)) % \
               self.element_count

    def compute(self):
        for index in range(0, self.element_count ** self.slot_count):
            slot_range = range(self.slot_count - 1, -1, -1)
            element_indexes = []
            for slot_index in slot_range:
                slot = self.compute_slot(index, slot_index)
                if slot in element_indexes:
                    element_indexes = []
                    break
                element_indexes.append(slot)

            if element_indexes:
                print([self.elements[index] for index in element_indexes])

if __name__ == "__main__":
    VariationWithoutRepetition(["a", "b", "c"], 2).compute()