# binarysearch.io '123 number flip'
def solve(self, n):
    variations = []
    n_string = str(n)
    i = 0
    while i < len(n_string):
        variations.append(int(n_string[0:i] + '3' + n_string[i+1:len(n_string)]))
        i += 1

    variations.sort()
    return variations[-1]

solve(123) # 323
