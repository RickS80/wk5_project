require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/bookedclass.rb' )
require_relative( '../models/gymclass.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )


get '/bookedclasses' do
  @bookedclasses = BookedClass.all()
  @members = Member.all()
  @gymclasses = GymClass.all()
  erb ( :"bookedclasses/index" )
end

get '/bookedclasses/new' do
  @members = Member.all()
  @gymclasses = GymClass.all()
  erb(:"bookedclasses/new")
end

post '/bookedclasses' do # create

  @bookedclasses = BookedClass.all()
  @newclass = BookedClass.new( params )
  # binding.pry
    if @newclass.check_membership_tier && @newclass.check_availability && !@newclass.double_booking
      @newclass.save()
      redirect to '/bookedclasses'
    elsif @newclass.check_membership_tier && @newclass.check_availability && @newclass.double_booking
      erb(:"bookedclasses/double_booking")
    elsif @newclass.check_membership_tier && !@newclass.check_availability && !@newclass.double_booking
      erb(:"bookedclasses/insufficient_space")
    else
      erb(:"bookedclasses/tier_mismatch")
  end
end

post '/bookedclasses/:id/delete' do
  booking = BookedClass.find(params['id'])
  booking.delete
  redirect to '/bookedclasses'
end
