#roman numeral converter, based on the older and simpler system. 
def convert_to_rmn
num = gets.chomp.to_i
romans = []
  
  while num != num%1000 do 
    romans.push("M")
    num = num - 1000
  end
  
  while num != num%500 do 
    romans.push("D")
    num = num - 500
  end 
  
  while num != num%100 do 
    romans.push("C")
    num = num - 100
  end 
  
  while num != num%50 do 
    romans.push("L")
    num = num - 50
  end 
  
  while num != num%10 do 
    romans.push("X")
    num = num - 10
  end 
  
  while num != num%5 do 
    romans.push("V")
    num = num - 5
  end 
  
  while num != num%1 do 
    romans.push("I")
    num = num - 1
  end 
  
 print romans.join
end
convert_to_rmn