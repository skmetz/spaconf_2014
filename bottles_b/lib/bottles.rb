class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(verse_number)
    current_bn = verse_number
    next_bn    = next_bottle_number(current_bn)

    "#{quantity(current_bn).capitalize} #{container(current_bn)} of beer on the wall, " +
    "#{quantity(current_bn)} #{container(current_bn)} of beer.\n" +
    "#{action(current_bn)}, " +
    "#{quantity(next_bn)} #{container(next_bn)} of beer on the wall.\n"
  end

  private
  def container(bottle_number)
    if bottle_number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(bottle_number)
    if bottle_number == 1
      'it'
    else
      'one'
    end
  end

  def quantity(bottle_number)
    if bottle_number == 0
      'no more'
    else
      bottle_number.to_s
    end
  end

  def action(bottle_number)
    if bottle_number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(bottle_number)} down and pass it around"
    end
  end

  def next_bottle_number(bottle_number)
    if bottle_number == 0
      99
    else
      bottle_number - 1
    end
  end

end
