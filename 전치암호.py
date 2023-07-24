import math

def Transposition_Ciper(data, key):
    text_1 = ''
    num_columns = len(key)
    num_rows = (len(data) // num_columns) #키 값이 평문에 접근하는 블록의 크기를 나타냄.
    print(num_columns)
    data_list = list(data)

    #DREAMHACK DRE AMH ACK
    #          

    for i in range(num_columns):
        for j in range(num_rows):
            #DREAMHACK , [3,1,2]일때.
            #i * num_columns 는 j 가 반복되는동안 각 블록의 첫번째 인덱스를 가리킴. 즉, i = 0 일 때, DRE를 전치시킴.
            #index = 0(D) + 3 - 1 = 2. INDEX = 2, data_list[2] = E를 text_1에 넣음.
            #i = 1 일 때, j가 반복되는 동안 두번 째 블록인 AMH를 전치시킴.
            index = i * num_columns + key[j] - 1
            text_1 += data_list[index]
    return text_1, num_rows

input_data = input("평문을 입력해주세요.")
input_key = input("KEY 값을 입력해주세요")
key = [int(x) for x in input_key.split()] #키 값을 공백으로 나누어 입력 받음.
ciper_text, num_row = Transposition_Ciper(input_data, key)

print("암호문: ", ciper_text)
print(num_row)