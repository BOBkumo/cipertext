#def feistal_cipher(text, num_rounds, key):
#    left, right = text[:len(text)//2], text[len(text)//2:]
#
#    for round in range(num_rounds)
#        update_right = xor_strings(left)

def change_to_bit(plain: str):
    return "".join(format(ord(c), "0>8b") for c in plain)
#8b는 2진수의 8

def bit_to_bitarray(plain: str):
    bit = change_to_bit(plain)
    bitarray = bytearray([int(i) for i in bit])
    return bitarray

def bitarray_to_bit(bitarray: bytearray):
    return "".join([str(i) for i in bitarray])

def bitarray_to_plain(bitarray: bytearray):
    bit = bitarray_to_bit(bitarray)
    pass

def init_permutation(text: bytearray):

    length = 64

    IPT = [58, 50, 42, 34, 26, 18, 10, 2,
       60, 52, 44, 36, 28, 20, 12, 4,
       62, 54, 46, 38, 30, 22, 14, 6,
       64, 56, 48, 40, 32, 24, 16, 8,
       57, 49, 41, 33, 25, 17, 9, 1,
       59, 51, 43, 35, 27, 19, 11, 3,
       61, 53, 45, 37, 29, 21, 13, 5,
       63, 55, 47, 39, 31, 23, 15, 7]

    permutated_text = bytearray(length)
    for num in range(len(IPT)):
        point = IPT[num]-1     #IP_table은 1부터 시작하지만 text의 인덱스는 0부터 시작하기때문에 -1 수행
        permutated_text[num] = text[point]

    return permutated_text

text = input("평문을 입력해라.: ")
bitarray = change_to_bit(text)
bytearray1 = bit_to_bitarray(bitarray)

#print(f"bytearray 변경문 출력: {bit_to_bitarray(bitarray)}")
#print("길이: ", len(bytearray1))

ip_work = init_permutation(bytearray1)
result = bitarray_to_bit(ip_work)
print("실행결과: ", result)
print(len(result))
print(type(result))
print(bitarray)