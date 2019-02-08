# n = 種類別の数
# r = 組み合わせの数
#       
# Permutation 順列
# n! = nの階乗
# ex: 6! = 1 * 2 * 3 * 4 * 5 * 6
#
# nPr = n! / (n -r)!
# 120 = 6P3 = 6 * 5 * 4 * 3 * 2 * 1 / (6 -3) * (5 -3) * (4 -3)
def nPr(n, r)
  return n if r <= 1
  return (n - r + 1) * nPr(n, r - 1)
end

# Combination 組合せ
# nCr = n! / (n -r)! r!
# ex: 6C3 = 6 * 5 * 4 / 1 * 2 * 3
def nCr(n, r)
  nPr(n, r) / nPr(r, r)
end

# Combination with repetitions
# nHr = (n+r-1)C(n-1)
def nHr(n, r)
  nCr((n + r - 1), n - 1)
  r == 0 ? 1 : nCr(n + r - 1, r)
end

# Permutation with repetitions
# n^r
def nPIr(n, r)
  n ** r
end


puts nPr(4, 2)
puts nCr(4, 2)
puts nPIr(4, 2)
puts nHr(4, 2)
