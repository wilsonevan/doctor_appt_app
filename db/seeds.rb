10.times do
  doctor = Doctor.create(
    name: Faker::Name.last_name,
    practice: Faker::Superhero.power,
    profile_pic: Faker::Avatar.image(slug = nil, size = '300x300', format = 'png', set = 'set1', bgset = nil)
  )

  10.times do
    user = User.new
    user.first_name = Faker::Movies::StarWars.character
    user.last_name = Faker::Space.galaxy
    user.email = Faker::Internet.email
    user.encrypted_password = '#$taawktljasktlw4aaglj'
    user.password = "valid_password"
    user.password_confirmation = "valid_password"
    user.save!
    

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
