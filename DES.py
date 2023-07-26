#def feistal_cipher(text, num_rounds, key):
#    left, right = text[:len(text)//2], text[len(text)//2:]
#
#    for round in range(num_rounds)
#        update_right = xor_strings(left)

IPT = [58, 50, 42, 34, 26, 18, 10, 2,
       60, 52, 44, 36, 28, 20, 12, 4,
       62, 54, 46, 38, 30, 22, 14, 6,
       64, 56, 48, 40, 32, 24, 16, 8,
       57, 49, 41, 33, 25, 17, 9, 1,
       59, 51, 43, 35, 27, 19, 11, 3,
       61, 53, 45, 37, 29, 21, 13, 5,
       63, 55, 47, 39, 31, 23, 15, 7]

PBDT = [57, 49, 41, 33, 25, 17, 9,
        1, 58, 50, 42, 34, 26, 18,
        10, 2, 59, 51, 43, 35, 27,
        19, 11, 3, 60, 52, 44, 36,
        63, 55, 47, 39, 31, 23, 15,
        7, 62, 54, 46, 38, 30, 22,
        14, 6, 61, 53, 45, 37, 29,
        21, 13, 5, 28, 20, 12, 4]

CPBT = [14, 17, 11, 24, 1, 5, 3, 28,
        15, 6, 21, 10, 23, 19, 12, 4,
        26, 8, 16, 7, 27, 20, 13, 2,
        41, 52, 31, 37, 47, 55, 30, 40,
        51, 45, 33, 48, 44, 49, 39, 56,
        34, 53, 46, 42, 50, 36, 29, 32]


def change_to_bit(plain: str):
    bit2 = ''
    count = 0
    for d in plain:
        bit = bin(ord(d))[2:]
        for c in bit2:
            if c == 1:
                count += 1
            else:
                continue
        if (count % 2) == 0:
            bit1 = bit + str(0)
        
        else:
            bit1 = bit + str(1)
        bit2 += bit1
    
    return bit2

'''
11행 입력받은 문자열을 이진수로 변환
12행 for문은 각 이진수의 문자를 보고 1일 경우 카운트업
17행 카운트값이 짝수일 경우, 7자리 이진수 값에 0을 추가
     카운트값이 홀수일 경우, 7자리 이진수 값에 1을 추가
     패리티비트를 추가한 코드.(짝수 패리티비트)
'''

def bit_to_bitarray(plain: str):
    bit = change_to_bit(plain)
    bitarray = bytearray([int(i) for i in bit])
    return bitarray

def bitarray_to_bit(bitarray: bytearray):
    return "".join([str(i) for i in bitarray])

def bitarray_to_plain(bitarray: bytearray):
    bit = bitarray_to_bit(bitarray)
    pass

def init_permutation(text: bytearray, table: list[int], length: int):
    permutated_text = bytearray(length)

    for num in range(len(table)):
        point = table[num]-1     #IP_table은 1부터 시작하지만 text의 인덱스는 0부터 시작하기때문에 -1 수행
        permutated_text[num] = text[point]

    return permutated_text


def key_made(key: bytearray):

    round_key = []

    #순열을 시켜 패리티비트 제거
    pc_1_table = init_permutation(key, PBDT, 56)
    left = pc_1_table[:28]
    right = pc_1_table[28:]

    #shift 작업
    shift_1 = [0,1,8,15]                           #1씩 shift 시킴.(1,2,9,16라운드에)
    
    for i in range(16):
        if i in shift_1:
            left = left[1:] + left[0:1]
            right = right[1:] + right[0:1]

        else:
            left = left[2:] + left[0:2]
            right = right[2:] + right[0:2]
        round_key.append(init_permutation(left+right, CPBT, 48))

    return round_key

key = input("key 값을 입력해라. : ")
key_bitarray = change_to_bit(key)
key_bitarray1 = bit_to_bitarray(key_bitarray)
round_key = key_made(key_bitarray1)
round_key_to_bit = bitarray_to_bit(round_key)
print(round_key_to_bit)
print(type(round_key_to_bit))

text = input("평문을 입력해라. : ")
bitarray = change_to_bit(text)
bytearray1 = bit_to_bitarray(bitarray)
'''
print(f"bytearray 변경문 출력: {bit_to_bitarray(bitarray)}")
print("길이: ", len(bytearray1))
'''
ip_work = init_permutation(bytearray1, IPT, 64)
result = bitarray_to_bit(ip_work)
print("실행결과: ", result)
print(len(result))
print(type(result))
print(bitarray)