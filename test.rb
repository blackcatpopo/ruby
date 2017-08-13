a = 0

begin
puts "begin"
a = 1/ 1

rescue ZeroDivisionError => ex
	puts "ensure"
end
