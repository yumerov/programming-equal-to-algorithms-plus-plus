class Variation(object):
    elements = ["a", "b",]
    element_count = 2
    slot_count = 5

    def compute_slot(self, index, slot_index):
        return (index // (self.element_count ** slot_index)) % \
               self.element_count

    def compute(self):
        for index in range(0, self.element_count ** self.slot_count):
            slot_range = range(self.slot_count - 1, -1, -1)
            element_indexes = [self.compute_slot(index, slot_index) for \
                    slot_index in \
                    slot_range]

            print([self.elements[index] for index in element_indexes])

if __name__ == "__main__":
    Variation().compute()