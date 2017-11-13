# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# utworzenie administratora, w środowisku produkcyjnym zmienić hasło
# Doctor.create(:email => 'admin@admin.pl', :password => 'aaddmmiinn', :password_confirmation => 'aaddmmiinn', :name => 'Administrator', :phone => '101-010-101', :admin => true)
Specialization.create(appellation:'alergologia')
Specialization.create(appellation:'diabetologia')
Specialization.create(appellation:'geriatria')
Specialization.create(appellation:'hematologia')
Specialization.create(appellation:'kardiologia')
Specialization.create(appellation:'medycyna pracy')
