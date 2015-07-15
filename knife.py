import csv,  string, os, sys, time

reader = csv.reader(open('values.csv', 'rU'), dialect=csv.excel_tab)

for row in reader:
    temp = row[0].split(',')
    tempCommand = "knife exec -E  \"nodes.find(:name => '"+ temp[0]  +"') { |node|  node['node_data']['source_repo'] = '"+ temp[1]  +"'; node.save; }\""
    print os.popen(tempCommand).read()
    time.sleep(2)
