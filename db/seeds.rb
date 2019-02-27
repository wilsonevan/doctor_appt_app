10.times do
  doctor = Doctor.create(
    name: Faker::Name.last_name,
    practice: Faker::Demographic.demonym,
    profile_pic: Faker::Avatar.image(slug = nil, size = '300x300', format = 'png', set = 'set1', bgset = nil)
  )

  10.times do
    user = User.create(
      first_name: Faker::Movies::StarWars.character,
      last_name: Faker::Superhero.power,
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password"
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
