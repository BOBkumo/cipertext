import math

def Transposition_Ciper(data, key):
    text_1 = ''
    num_columns = len(key)
    num_rows = (len(data) // num_columns)
    print(num_columns)
    data_list = list(data)

    #DREAMHACK DRE AMH ACK
    #          

    for i in range(num_rows):
        for j in range(num_columns):
            index = i * num_columns + key[j] - 1
            text_1 += data_list[index]

    return text_1, num_rows

input_data = input("평문을 입력해주세요.")
input_key = input("KEY 값을 입력해주세요")
key = [int(x) for x in input_key.split()] #키 값을 공백으로 나누어 입력 받음.
ciper_text, num_row = Transposition_Ciper(input_data, key)

print("암호문: ", ciper_text)
print(num_row)