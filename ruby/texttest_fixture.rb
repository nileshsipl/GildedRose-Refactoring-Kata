#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'gilded_rose')

puts "Hello"
items = [
  Item.new(name: "Aged Brie", sell_in: 10, quality: 20),
  Item.new(name: "Backstage passes", sell_in: 15, quality: 20),
  Item.new(name: "Backstage passes", sell_in: 10, quality: 49),
  Item.new(name: "Backstage passes", sell_in: 5, quality: 49),
  Item.new(name: "Sulfuras", sell_in: 0, quality: 80),
  Item.new(name: "Conjured", sell_in: 3, quality: 6),
  Item.new(name: "Normal Item", sell_in: 0, quality: 2),
]

days = 2
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
