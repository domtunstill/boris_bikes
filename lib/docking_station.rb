require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capactiy

  def initialize (capactiy = DEFAULT_CAPACITY)
    @bikes = []
    @capactiy = capactiy
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.each do |bike|
      if bike.working? == true
        @bikes.pop
        return bike
      end
    end
    raise "No working bikes"
  end

 def dock(bike)
   raise "Docking station is full" if full?
   @bikes << bike
 end

 private
 def full?
   @bikes.count >= @capactiy
 end

 def empty?
   @bikes.count == 0
 end

end
