def saudacao
  puts "olá"
  yield
  puts "seja bem-vindo!"
end

saudacao { puts "Jackson" }
