from pprint import pprint as print

class Combination(object):
    elements = []
    elements_count = 0
    slots = 0
    index_buffer = []
    combinations = []

    def __init__(self, elements: list, slots: int):
        self.elements = elements
        self.elements_count = len(elements)
        self.slots = slots

    def compute_slot(self, slot_index: int, combination_index: int):
        index = (combination_index // (self.elements_count ** slot_index)) % \
               self.elements_count

        prev_index = self.index_buffer[-1] if len(self.index_buffer) > 0 else -1

        if prev_index != [] and prev_index > index:
            raise Exception()

        self.index_buffer.insert(0, index)
        return self.elements[index]

    def compute_combination(self, combination_index: int) -> list:
        slot_range = range(self.slots - 1, -1 ,-1)
        combination = []

        for slot_index in slot_range:
            combination.append(self.compute_slot(slot_index, combination_index))

        self.index_buffer = []

        return combination

    def compute(self):
        index_range = range(0, self.elements_count ** self.slots)

        for combination_index in index_range:
            try:
                self.combinations.append(
                    self.compute_combination(combination_index)
                )
            except:
                self.index_buffer = []

        return self


print(Combination(["a", "b", "c", "d"], 2).compute().combinations)
# Combination(["a", "b", "c", "d", "e"], 3).compute()