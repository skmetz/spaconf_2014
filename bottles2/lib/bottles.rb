class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(verse_number)
    "#{quantity(verse_number).capitalize} #{container(verse_number)} of beer on the wall, " +
    "#{quantity(verse_number)} #{container(verse_number)} of beer.\n" +
    "#{action(verse_number)}, " +
    "#{quantity(verse_number-1)} #{container(verse_number-1)} of beer on the wall.\n"
  end

  private
  def container(verse_number)
    if verse_number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(verse_number)
    if verse_number == 1
      'it'
    else
      'one'
    end
  end

  def quantity(verse_number)
    if verse_number == -1
      99.to_s
    elsif verse_number == 0
      'no more'
    else
      verse_number.to_s
    end
  end

  def action(verse_number)
    if verse_number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(verse_number)} down and pass it around"
    end
  end

end
