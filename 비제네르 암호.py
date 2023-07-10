def encorder(text, key):
    character = ""
    key_length = len(key)

    for i, char in enumerate(text):
        if char.isalpha():
            key_index = i % key_length
            key_char = key[key_index]

            key_char = key_char.upper()
            char = char.upper()

            changed_char = chr((ord(char) + ord(key_char) - 2*ord('A')) % 26 + ord('A'))
            character += changed_char
        
        else:
            character += char
            #알파벳이 아닌 글자가 입력된 경우 바로 문자열에 추가.

    return character
        
text_list = input()
key_list = input()

type_char = encorder(text_list, key_list)
print(type_char)