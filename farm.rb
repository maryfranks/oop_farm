class Farm

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
