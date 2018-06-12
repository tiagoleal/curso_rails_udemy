def saudacao
  if block_given?
    puts "olá"
    yield
  else
    puts "O bloco não foi passado!"
  end
end

saudacao { puts "Jackson" }
