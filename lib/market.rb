require 'pry'
class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors.push(vendor)
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors_that_sell= []
    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(item)
        vendors_that_sell << vendor
      end
    end
    vendors_that_sell
  end

  def sorted_item_list
    sorted_list = []
    @vendors.each do |vendor|
      sorted_list << vendor.inventory.keys
    end
    sorted_list.flatten.sort.uniq
  end

  def total_inventory
    market_inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        market_inventory[item] += quantity
      end
    end
    market_inventory
  end

  def sell(item_to_sell, quantity_to_sell)
    @quantity_to_sell  = quantity_to_sell
    if self.total_inventory[item_to_sell] < quantity_to_sell
      return false
    else
      until @quantity_to_sell == 0
      self.vendors.each do |vendor|
          if vendor.inventory[item_to_sell] > 0
            vendor.inventory[item_to_sell] -= 1
            @quantity_to_sell -= 1
          end
          # binding.pry
        end
      end
    end
    true
  end

end
