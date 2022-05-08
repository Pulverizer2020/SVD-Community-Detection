delimiter = "\t"

original_edge_file_name = "./datasets/email-Enron_without_header.txt"
corrected_edge_file_name = "./datasets/email-Enron_without_header_corrected.txt"

# code to change the indeces of edge data from starting at 0 to starting at 1 (thank you Matlab!)
with open(original_edge_file_name, 'r') as f:
    newfilelines = []
    filelines = f.readlines()
    for fileline in filelines:
        lineList = fileline.split(delimiter)
        print(int(lineList[0]) + 1)
        newfilelines.append(f'{int(lineList[0]) + 1} {int(lineList[1]) + 1}\n')

with open(corrected_edge_file_name, "w") as f:
    for line in newfilelines:
        f.write(line)
