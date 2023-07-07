class Person
  def initialize(params)
    if !params.is_a?(Hash) || params.empty?
      raise ArgumentError, "Zero arguments given to initialize"
    end
    params.each do |key, value|
      self.class.attr_accessor(key)
      self.send("#{key}=", value)
    end
  end
end
donvine_params = {
  name: "Avi",
  birthday: "01/29/1984",
  hair_color: "brown",
  eye_color: "brown",
  height: "short",
  weight: "good",
  handed: "lefty",
  complexion: "decent",
  t_shirt_size: "medium"
}
donvine = Person.new(donvine_params)

def donvine.greet # defining methods outside the class
 puts "hello world"
end
donvine.greet
class << Person
  def flirt #how can we make this method accessible to instances?
    puts "hey cutie!"
  end
end
puts Person.flirt
#meta_classes
Person.class_eval do
  def socialize #this adds a socialize method to each instance of the class, that way we can add functionality to defined classess
    puts "hello guys, my name #{self.name}"
  end
end
puts donvine.socialize