framework "CoreLocation"

class WhereAmI
  def initialize(observer)
    @observer = observer
    @location = CLLocationManager.new
    @location.delegate = self
  end

  def locate
    @location.startUpdatingLocation
    NSRunLoop.currentRunLoop.runUntilDate(NSDate.distantFuture)
  end

  private
  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    @observer.didReceiveLocation(newLocation.coordinate.latitude, newLocation.coordinate.longitude)
  end
end
