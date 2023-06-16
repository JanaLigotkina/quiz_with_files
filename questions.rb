# Напишите программу, которая считывает все вопросы из файлов и задает пользователю в консоли 3 случайных вопроса в случайном порядке.
# Задав вопрос, программа ждет ответа пользователя в консоли. А затем сравнивает с правильным ответом и сообщает, правильно ответил 
# пользователь, или нет.
# Если ответ неверный, программа сообщает какой ответ правильный. В конце сообщает результат — сколько было дано правильных ответов.

massive_files = Dir["data/*"]
questions = []
answers = []
counter = 0
correct = 0

puts "Сыграем в игру? Ответьте на вопросы."

massive_files.each do |item|
	file = File.open(item,'r:UTF-8') # открываем файл
	lines = file.readlines  # разбиваем на массив строк
	questions << lines[0] # добавляем вопросы в новый массив
	answers << lines[1] # добавляем ответы в новый массив 
	file.close
end	

while counter <= 2 do
	index = rand(questions.size) # рандомный индекс 
	puts questions[index]  # выводим элемент с этим рандомным индексом 
	answer = STDIN.gets.chomp

	if answer == answers[index]
		correct += 1
		puts "Верный ответ!"
	else 
		puts "Неправильно. Правильный ответ: #{answers[index]}"	
	end
		
	counter += 1
end 


puts "Правильных ответов: #{correct} из 3"