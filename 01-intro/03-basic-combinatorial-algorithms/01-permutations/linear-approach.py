class PermutationCalculator(object):
    size = 3
    used = {}
    buffer = {}

    def __init__(self, size: int = 3):
        self.size = size
        self.reset()

    def reset(self):
        for index in range(0, self.size):
            self.used[index] = False

    def print_buffer(self):
        for i in range(0, self.size):
            print(self.buffer[i] + 1, end=" ")
        print("\n")

    def permutate(self, index: int = 0):
        if index >= self.size:
            self.print_buffer()
            return

        for k in range(0, self.size):
            if (not self.used[k]):
                self.used[k] = True
                self.buffer[index] = k
                self.permutate(index + 1)
                self.used[k] = False


if __name__ == "__main__":
    calculator = PermutationCalculator(4)

    calculator.permutate()