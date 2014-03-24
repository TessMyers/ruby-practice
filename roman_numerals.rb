def convert_to_rmn
num = gets.chomp.to_i
romans = []
hash = {'M'=> 1000, 'D'=> 500, 'C'=> 100, 'L'=> 50, 'X'=> 10, 'V'=> 5, 'I'=> 1}

hash.each do |numeral, value|
  while num != num%value do 
    romans.push(numeral)
    num = num - value
  end
end
print romans.join
end 
convert_to_rmn