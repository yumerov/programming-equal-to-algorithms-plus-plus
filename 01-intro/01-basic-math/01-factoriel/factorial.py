def factorial(n: int) -> int:
    if n in [0, 1]:
        return 1

    f = 1
    for i in range(2, n + 1):
        f *= i

    return f

print(factorial(10))