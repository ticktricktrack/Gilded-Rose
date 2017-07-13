class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    return normal_item if @name == 'Normal Item'
    return aged_brie   if @name == 'Aged Brie'
    return sulfuras    if @name == 'Sulfuras, Hand of Ragnaros'
    return backstage   if @name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def normal_item
    if @days_remaining < 1
      @quality -= 2
    else
      @quality -= 1
    end
    @quality = [0, @quality].max
    @days_remaining -= 1
  end

  def aged_brie
    if @days_remaining < 1
      @quality += 2
    else
      @quality += 1
    end
    @quality = [50, @quality].min
    @days_remaining -= 1
  end

  def sulfuras
  end

  def backstage
    if @days_remaining < 1
      @quality = 0
    elsif @days_remaining < 6
      @quality += 3
    elsif @days_remaining < 11
      @quality += 2
    else
      @quality += 1
    end
    @quality = [50, @quality].min
    @days_remaining -= 1
  end
end
