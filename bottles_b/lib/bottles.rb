class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(verse_number)
    current_bn = BottleNumber.new(verse_number)
    next_bn    = BottleNumber.new(current_bn.next)

    "#{current_bn.quantity.capitalize} #{current_bn.container} of beer on the wall, " +
    "#{current_bn.quantity} #{current_bn.container} of beer.\n" +
    "#{current_bn.action}, " +
    "#{next_bn.quantity} #{next_bn.container} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def quantity
    if number == 0
      'no more'
    else
      number.to_s
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def next
    if number == 0
      99
    else
      number - 1
    end
  end

end
