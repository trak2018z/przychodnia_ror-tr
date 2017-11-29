# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# utworzenie administratora, w środowisku produkcyjnym zmienić hasło
Doctor.create(:email => 'admin@admin.pl', :password => 'aaddmmiinn', :password_confirmation => 'aaddmmiinn', :name => 'Administrator', :phone => '101-010-101', :admin => true)
# utworzenie lekarzy
# Doctor.create(:email => 'lekarz1@lekarz.pl', :password => '111111', :password_confirmation => '111111', :name => 'Andrzej Dronka', :phone => '101-010-101')
# Doctor.create(:email => 'lekarz2@lekarz.pl', :password => '222222', :password_confirmation => '222222', :name => 'Aneta Lis', :phone => '101-010-101')
# Doctor.create(:email => 'lekarz3@lekarz.pl', :password => '333333', :password_confirmation => '333333', :name => 'Krystian Zalewski', :phone => '101-010-101')
# utworzenie pacjentów
Patient.create(:email => 'pacjent1@pacjent.pl', :password => '111111', :password_confirmation => '111111', :name => 'Zofia Ameba', :age => 37, :pesel => '12345678999', :phone => '101-010-101', :address => 'ul. Pochmurna 4/5, 34-345 Pogórze')
Patient.create(:email => 'pacjent2@pacjent.pl', :password => '222222', :password_confirmation => '222222', :name => 'Horacy Brodny', :age => 17, :pesel => '12345678998', :phone => '101-010-101', :address => 'ul. Słoneczna 4/5, 34-345 Pogórze')
Patient.create(:email => 'pacjent2@pacjent.pl', :password => '333333', :password_confirmation => '333333', :name => 'Fabian Hel', :age => 68, :pesel => '12345678997', :phone => '101-010-101', :address => 'ul. Tęczowa 4/5, 34-345 Pogórze')
# utworzenie listy specjalizacji
specjalizacje = ['alergologia', 'diabetologia', 'geriatria', 'hematologia', 'kardiologia', 'medycyna pracy', 'neuropatologia', 'ortopedia', 'pediatria', 'toksykologia']
specjalizacje.each do |s|
  Specialization.create(appellation: s)
end
