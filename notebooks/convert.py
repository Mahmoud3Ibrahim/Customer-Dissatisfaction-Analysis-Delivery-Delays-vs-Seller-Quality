import csv

input_file = "olist_orders_dataset.csv"
output_file = "olist_orders_dataset_comma.csv"

with open(input_file, "r", encoding="utf-8") as infile, \
     open(output_file, "w", encoding="utf-8", newline="") as outfile:
    
    reader = csv.reader(infile, delimiter="\t")
    writer = csv.writer(outfile, delimiter=",")
    
    for row in reader:
        writer.writerow(row)

print("✅ File converted successfully to comma-delimited CSV")