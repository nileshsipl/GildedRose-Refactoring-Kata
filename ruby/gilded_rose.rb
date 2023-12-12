class GildedRose

  def initialize(items)
    @items = items
  end
  
  def update_quality()
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        aged_brie(item)
      when 'Backstage passes'
        backstage_passes(item)
      when 'Sulfuras'
        # Sulfuras is a legendary item and does not change
      when 'Conjured'
        conjured(item)
      else
        normal_item(item)
      end
    end
  end

  private

  def aged_brie(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
    item.quality += 1 if item.sell_in < 0 && item.quality < 50
  end

  def backstage_passes(item)
    item.sell_in -= 1
    if item.sell_in < 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in <= 10
      item.quality += 2
    else
      item.quality += 1
    end
    item.quality = 50 if item.quality > 50

  end

  def conjured(item)
    item.sell_in -= 1
    item.quality -= 2 if item.quality > 0
    item.quality -= 2 if item.sell_in < 0 && item.quality > 0
  end
  

  def normal_item(item)
    item.sell_in -= 1
    item.quality -= 1 if item.quality > 0
    item.quality -= 1 if item.sell_in < 0 && item.quality > 0
    item.quality = [item.quality, 0].max
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name:, sell_in:, quality:)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  
  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
