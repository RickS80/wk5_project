require_relative('../models/member')
require_relative('../models/gymclass')
require_relative('../models/bookedclass')
require("pry-byebug")

BookedClass.delete_all
Member.delete_all
GymClass.delete_all

member1 = Member.new({
  "first_name" => "Rick",
  "last_name" => "Symington",
  "age" => 38,
  "gender" => "Male",
  "membership_category" => "Premium"
  })

member2 = Member.new({
  "first_name" => "Midori",
  "last_name" => "Symington",
  "age" => 38,
  "gender" => "Female",
  "membership_category" => "Basic"
  })

member3 = Member.new({
  "first_name" => "Darth",
  "last_name" => "Vadar",
  "age" => 100,
  "gender" => "Female",
  "membership_category" => "Basic"
  })

member1.save()
member2.save()
member3.save()

gymclass1 = GymClass.new({
  "gymclass_name" => "Bodypump",
  "instructor" => "Colin",
  "capacity" => 5,
  "start_time" => "2018-12-20 10:30:00",
  "end_time" => "2018-12-20 11:30:00",
  "member_tier" => "Premium"
  })

gymclass2 = GymClass.new({
  "gymclass_name" => "Spin",
  "instructor" => "Alex",
  "capacity" => 5,
  "start_time" => "2018-12-20 13:30:00",
  "end_time" => "2018-12-20 14:30:00",
  "member_tier" => "Premium"
  })

gymclass3 = GymClass.new({
  "gymclass_name" => "Individual",
  "instructor" => "Del",
  "capacity" => 1,
  "start_time" => "2018-12-20 14:30:00",
  "end_time" => "2018-12-20 15:30:00",
  "member_tier" => "Basic"
  })

gymclass1.save()
gymclass2.save()
gymclass3.save()

bookedclass1 = BookedClass.new({
  "member_id" => member1.id,
  "gymclass_id" => gymclass1.id
  })

bookedclass2 = BookedClass.new({
  "member_id" => member1.id,
  "gymclass_id" => gymclass2.id
  })

bookedclass3 = BookedClass.new({
  "member_id" => member1.id,
  "gymclass_id" => gymclass3.id
  })

bookedclass4 = BookedClass.new({
  "member_id" => member2.id,
  "gymclass_id" => gymclass1.id
  })

bookedclass1.save()
bookedclass2.save()
bookedclass3.save()
bookedclass4.save()

binding.pry
bookedclass1.attendees

nil

# p member1.gymclasses()
# p gymclass1.members
