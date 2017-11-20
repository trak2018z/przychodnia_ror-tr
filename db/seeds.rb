# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# utworzenie administratora, w środowisku produkcyjnym zmienić hasło
# Doctor.create(:email => 'admin@admin.pl', :password => 'aaddmmiinn', :password_confirmation => 'aaddmmiinn', :name => 'Administrator', :phone => '101-010-101', :admin => true)
# utworzenie listy specjalizacji
specjalizacje = ['alergologia', 'diabetologia', 'geriatria', 'hematologia', 'kardiologia', 'medycyna pracy']
specjalizacje.each do |s|
  Specialization.create(appellation: s)
end
