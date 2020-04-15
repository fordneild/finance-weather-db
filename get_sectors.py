file1 = open('constituents_csv.csv', 'r')
file2 = open('sectors.txt', 'w') 
Lines = file1.readlines()
sectors = []
count = 0
# Strips the newline character 
for line_index, line in enumerate(Lines): 
    sector = line.split(",")[-1]
    if sector not in sectors:
        sectors.append(sector)
    
file2.writelines(sectors)