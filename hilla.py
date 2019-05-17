from re import findall
key = [[4,8],[6,2]]
text_in = tuple("ЙФЯЦЫЧУВСКАМЕПИНРТГОЬШЛБЩДЮЗЖХЭЪ")
Message = input("Введите текст: ").upper()

def encrypt(text, matrix, sum = 0, final = "", matLen = 2):
    for double in range(len(text)):
        for string in range(matLen):
            for column in range(matLen):
                sum += matrix[string][column] * text_in.index(text[double][column])
            final += text_in[(sum)%26]; sum = 0
    return final

otv = r"[А-Я]{"+str(2)+"}"
otv = encrypt(findall(otv, Message), key)
print ('Ответ: ', otv)
