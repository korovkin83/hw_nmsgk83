import random
import datetime


def one(key):
    t1 = datetime.datetime.now()
    L = [random.randint(0,key) for i in range (0, key )]
    for i in range(1, len(L)):
        buf = L[i]
        j = i-1
        while j >=0 and L[j] > buf:
            L[j+1] = L[j]
            j = j -1
            L[j+1] = buf
    t2 = datetime.datetime.now()
    return(t2 - t1)

def two(key):
    t1 = datetime.datetime.now()
    l = 0
    L =  [random.randint(0,key) for i in range(0,14)]
    MAXb = len(L)-1
    for ib in range (0, MAXb):
        for jb in range(0,MAXb - ib):
            if L[jb] > L[jb + 1]:
                L[jb], L[jb + 1] = L[jb + 1],L[jb]
    t2 = datetime.datetime.now()
    return(t2 - t1)


print("----------------------------------------------------------------------------")
print("|кол-во           |пузырек                |вставка                     |")
print ("| 1000           ",  one(1000), "       |", two(1000) )
print ("| 2000           ",  one(2000), "       |", two(2000) )
print ("| 4000           ",  one(4000), "       |", two(4000) )
print ("| 8000           ",  one(8000), "       |", two(8000) )
