class Farm

  def initialize(name)
    puts "This is the #{name} Farm"
    @name = name
    self.main_menu
  end

  def print_main_menu
    puts "pick one of the following options"
    puts "[1] Harvest"
    puts "[2] Relax"
    puts "[3] Get Field Status"
    puts "[4] Add New Field"
    puts "[5] Exit"
  end

end

class Field

  @@fields = []

  def initialize(size)
    @size = size
  end

  def self.create(field_type) # ==== this is my starting point =====
    if field_type == Corn
      @@fields << Corn.new
      return @@fields.last
    elsif field_type == Wheat
      @@fields << Wheat.new
      return @@fields.last
    end
  end

  def self.all_fields
    @@fields
  end

  def relax

  end

  def field_status

  end

end

class Corn < Field

  def initialize
    @output = 20
  end

end

class Wheat < Field

  def initialize
    @@output = 40
  end

end
