require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available" while @bikes.empty?
    @bikes.pop
  end

 def dock_bike(bike)
   raise "Docking station is full" if @bikes.count >= 20
   @bikes << bike
 end

end
