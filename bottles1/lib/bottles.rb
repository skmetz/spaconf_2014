class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(i)
    "#{quantity(i).capitalize} #{container(i)} of beer on the wall, " +
    "#{quantity(i)} #{container(i)} of beer.\n" +
    "#{action(i)}, " +
    "#{quantity(i-1)} #{container(i-1)} of beer on the wall.\n"
  end

  private
  def container(i)
    if i == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(i)
    if i == 1
      'it'
    else
      'one'
    end
  end

  def quantity(i)
    if i == -1
      99.to_s
    elsif i == 0
      'no more'
    else
      i.to_s
    end
  end

  def action(i)
    if i == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(i)} down and pass it around"
    end
  end

end
