class Contact

  attr_accessor :first_name, :last_name
  attr_reader :id

  @@all = []
  @@counter = 1

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = @@counter
    @@all << self
    @@counter += 1
  end

  def self.all
    @@all
  end

  def self.find(id)
    contact = @@all.find{|contact| contact.id == id}
  end

end