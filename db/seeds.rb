# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CRIANDO USUÁRIO PADRÃO...'
User.create!(
  email: 'admin@admin',
  password: '123456',
  password_confirmation: '123456',
  name: 'admin'
)
puts 'CRIANDO USUÁRIO PADRÃO... [OK]'

puts 'CRIANDO LIGAÇÕES PADRÃO DO CASO DE USO...'
Connection.create!(name: "Associação")
Connection.create!(name: "Inclusão")
Connection.create!(name: "Generalização")
puts 'CRIANDO LIGAÇÕES PADRÃO DO CASO DE USO... [OK]'

puts "CRIANDO TIPOS DE ELEMENTOS NO MÁQUINA DE ESTADO..."
Type.create!(name: "Estado")
Type.create!(name: "Nota")
Type.create!(name: "Envio")
Type.create!(name: "Recebimento")
puts "CRIANDO TIPOS DE ELEMENTOS NO MÁQUINA DE ESTADO... [OK]"

puts "CRIANDO MOLDES DE ELEMENTOS NO CASO DE USO..."
Mold.create!(name: "Ator")
Mold.create!(name: "Caso")
Mold.create!(name: "Nota")
puts "CRIANDO MOLDES DE ELEMENTOS NO CASO DE USO... [OK]"
