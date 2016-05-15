class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    #if user of ride doesn't have enough tickets no ride for them
   # self.user
   # self.attraction
    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
      take_the_ride
    elsif self.attraction.tickets >= self.user.tickets && self.attraction.min_height >= self.user.height
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."  
    elsif self.attraction.tickets >= self.user.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif self.attraction.min_height >= self.user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def take_the_ride
    #effects the user's happiness, number of tickets, nausea
    self.user.happiness += self.attraction.happiness_rating
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.save
  end
end
