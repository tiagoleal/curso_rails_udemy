def saudacao
  if block_given?
    puts yield("Olá",3)
  else
    puts "O bloco não foi passado!"
  end
end

saudacao { |str,num| puts "#{str} Jackson! " * num }
