# Enter your code here. Read input from STDIN. Print output to STDOUT

N = gets.to_i
str = []
N.times do |i|
    str[i] = gets.strip
end
Q = gets.to_i
qry = []
Q.times do |i|
    qry[i] = gets.strip
end

qry.each do |q|
    puts "qry: #{q} : #{str.select { |s| s==q }.count}"
end