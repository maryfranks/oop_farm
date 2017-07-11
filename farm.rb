require 'pry'

class Farm

  def initialize(name)
    puts "This is the #{name} Farm"
    @name = name
    self.main_menu
  end

  def main_menu
    while true
      print_main_menu
      menu_item_selected = gets.chomp
      selected_function(menu_item_selected.to_i)
    end
  end

  def print_main_menu
    puts "pick one of the following options"
    puts "[1] Harvest"
    puts "[2] Relax"
    puts "[3] Get Field Status"
    puts "[4] Add New Field"
    puts "[5] Exit"
  end

  def selected_function(menu_item_selected)
    case menu_item_selected
    when 1 then harvest_all_fields
    when 2 then relax
    when 3 then get_field_status
    when 4 then add_new_field
    when 5 then exit
    end
  end

  def harvest_all_fields
    Field.harvest 
  end

  def relax
    puts "It's such a lovely day on your farm!"
  end

  def get_field_status
    # binding.pry
    Field.all_fields.each do |field|
    puts "Your #{field.class} field is #{field.size} hectares."
    end
    puts "Your farm has harvested #{Field.field_status} food so far"
  end

  def add_new_field
    puts "What type of field would you like to create?"
    field_type = gets.chomp
    puts "How many hectares is your new field?"
    field_size = gets.chomp
    Field.create(field_type.capitalize, field_size.to_i)
  end

end

class Field

  attr_reader :size

  @@fields = []
  @@total_harvested = 0

  def initialize(size)
    @size = size
  end

  def self.create(field_type, size) # ==== this is my starting point =====
    if field_type == 'Corn'
      @@fields << Corn.new(size)
      return @@fields.last
    elsif field_type == 'Wheat'
      @@fields << Wheat.new(size)
      return @@fields.last
    end
  end

  def self.all_fields
    @@fields
  end

  def self.harvest
    harvest = 0
    @@fields.each do |field|
      total_harvested = field.output * field.size
      harvest += total_harvested
    end
    @@total_harvested = harvest
    return harvest
  end

  def self.field_status
    @@total_harvested
  end

end

class Corn < Field

  attr_reader :output

  def initialize(size)
    super(size)
    @output = 20
  end

end

class Wheat < Field

  attr_reader :output

  def initialize(size)
    super(size)
    @output = 40
  end

end
