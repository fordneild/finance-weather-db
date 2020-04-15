file1 = open('constituents_csv.csv', 'r')
file2 = open('security-relation.txt', 'w') 
Lines = file1.readlines()
sectors = {}
count = 0
cleanedLines= [None] * len(Lines)
for line_index, line in enumerate(Lines): 
    line_split = line.split(",")
    sector = line_split[-1].strip()
    if sector not in sectors:
        sectors[sector] = len(sectors.keys())+1
    # if sector not in sectors:
    #     sectors.append(sector)
    cleanedLines[line_index] = line_split[0] + ',' + line_split[1] + ',' + str(sectors[sector]) + '\n'

file2.writelines(cleanedLines)