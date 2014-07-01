class Fixnum
  def to_bottle_number
    begin
      Object.const_get("BottleNumber#{self}")
    rescue NameError
      BottleNumber
    end.new(self)
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(verse_number)
    current_bn = verse_number.to_bottle_number
    next_bn    = current_bn.next

    "#{current_bn} of beer on the wall, ".capitalize +
    "#{current_bn} of beer.\n" +
    "#{current_bn.action}, " +
    "#{next_bn} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    'bottles'
  end

  def pronoun
    'one'
  end

  def quantity
    number.to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def next
    (number - 1).to_bottle_number
  end

  def to_s
    "#{quantity} #{container}"
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    'no more'
  end

  def action
    "Go to the store and buy some more"
  end

  def next
    99.to_bottle_number
  end
end

class BottleNumber1 < BottleNumber
  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end

class BottleNumber6 < BottleNumber
  def container
    '6-pack'
  end

  def quantity
    1.to_s
  end
end
