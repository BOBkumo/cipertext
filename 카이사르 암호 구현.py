def caesar_cipher(text, shift):
    result = ""
    for char in text:
        if char.isalpha():
            if char.isupper():
                result += chr((ord(char) - ord("A") + shift) % 26 + ord("A"))
            else:
                result += chr((ord(char) - ord('a') + shift) % 26 + ord('a'))
                
        else:
            result += char
            
    return result

text = "Helloz world"
shift = int(input())

text1 = caesar_cipher(text, shift)
print("암호문", text1)
text2 = caesar_cipher(text1, -shift)
print("원문", text2)

print("ang")