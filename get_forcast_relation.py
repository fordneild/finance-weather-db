import os
directory = './individual_stocks_5yr/'
forcastFile = open('forcast-relation.txt', 'w')


file1 = open('date-relation.txt','r')
lines = file1.readlines()
dates ={}
for line_index, line in enumerate(lines):
    [dateId, month, day, year] = line.split(",")
    if(len(month) == 1):
        month = '0' + month
    if(len(day) == 1):
        day = '0' + day
    date = year.strip()+'-'+month+'-'+day
    if date not in dates:
        dates[date] = len(dates) + 1

file2 = open('city_weather.csv')
lines = file2.readlines()
lines.pop(0) #remove head of csv file with attribute names
for line_index, line in enumerate(lines):

    line_split = line.split(",")[3:]
    date = line_split[0][1:-1]
    # print(date)
    if date in dates:
        line_split[0] = dates[date]
        print(line_split)
# print(dates)



    