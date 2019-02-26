10.times do
  doctor = Doctor.create(
    name: Faker::Name.last_name,
    practice: Faker::Demographic.demonym
  )

  10.times do
    user = User.create(
      first_name: Faker::Movies::StarWars.character,
      last_name: Faker::Superhero.power
    )

    Appointment.create(
      # role: roles.sample,
      doctor_id: doctor.id,
      user_id: user.id,
      date: Faker::Time.backward(days = 365, period = :all, format = nil),
      time: Faker::Time.backward(days = 365, period = :all, format = nil)
      # time: Faker::Time(all)
    )
  end
end

puts "Data Seeded."
