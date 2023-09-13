#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

typedef uint8_t State[4][4];

void convertStringToHex(const char *input_string, unsigned char *output_hex, size_t max_len) {
    size_t input_length = strlen(input_string);
    size_t hex_length = (input_length + 1) / 2; // 결과 배열의 크기 계산 (+1은 홀수 길이 문자열 처리)

    if (hex_length > max_len) {
        printf("Error: 결과 배열의 크기가 충분하지 않습니다.\n");
        return;
    }

    // 결과 배열 초기화
    memset(output_hex, 0, max_len);

    // 입력 문자열을 16진수로 변환하여 결과 배열에 저장
    unsigned char temp;
    for (size_t i = 0; i < input_length; i++) {
        char c = input_string[i];
        if (c >= '0' && c <= '9') {
            temp = c - '0';
        } else if (c >= 'A' && c <= 'F') {
            temp = c - 'A' + 10;
        } else if (c >= 'a' && c <= 'f') {
            temp = c - 'a' + 10;
        } else {
            printf("Error: 유효하지 않은 문자가 있습니다.\n");
            return;
        }

        // 홀수 길이 문자열의 경우, 두 번째 16진수를 현재 배열 요소와 결합
        if (i % 2 == 0) {
            output_hex[i / 2] = temp << 4;
        } else {
            output_hex[i / 2] |= temp;
        }
    }
}

// 16진수 문자열을 바이트 배열로 변환하는 함수
void hexStringToByteArray(const char* hexString, uint8_t* byteArray, size_t byteArraySize) {
    size_t len = strlen(hexString);
    if (len % 2 != 0 || len / 2 > byteArraySize) {
        printf("Invalid hex string length or byte array size.\n");
        return;
    }

    for (size_t i = 0; i < len; i += 2) {
        sscanf(hexString + i, "%2hhx", &byteArray[i / 2]);
    }
}

int main() {
    const char* Array_text[16];
    

    const char* hexInput = "00112233445566778899aabbccddeeff";  // 128비트 16진수 입력

    State state;  // 4x4 AES 상태 배열 선언

    uint8_t byteArray[16];  // 16바이트 바이트 배열
    hexStringToByteArray(hexInput, byteArray, sizeof(byteArray));

    // 16바이트 바이트 배열을 상태 배열로 복사
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            state[j][i] = byteArray[i * 4 + j];
        }
    }

    // 상태 배열 출력
    printf("AES 상태 배열:\n");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("%02x ", state[j][i]);
        }
        printf("\n");
    }

    return 0;
}
