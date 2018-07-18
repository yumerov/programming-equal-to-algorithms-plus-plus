class Combination(object):
    elements = []
    elements_count = 0
    slots = 0
    buffer = {}
    combinations = []

    def __init__(self, elements: list, slots: int):
        self.elements = elements
        self.elements_count = len(elements)
        self.slots = slots

    def compute(self, slot_index = 1, after = 0):
        if slot_index > self.slots:
            return

        for next_slot_index in range(after, self.elements_count):
            self.buffer[slot_index - 1] = self.elements[next_slot_index]
            if slot_index == self.slots:
                print(list(self.buffer.values()))
            self.compute(slot_index + 1, next_slot_index + 1)

# Combination(["a", "b", "c", "d"], 2).compute()
Combination(["a", "b", "c", "d", "e"], 3).compute()