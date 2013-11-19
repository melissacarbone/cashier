# USER STORIES
# 1. As a cashier
# I want to display items in a menu
# So that I can make checkout faster

# 2. As a cashier
# I want to be prompted to choose an item from the menu
# So that speed up the checkout process

# 3.As a cashier
# I want to be prompted to enter the quantity of bags being purchased
# So that I can calculate the total price

# 4.As a cashier
# I want to have the subtotals and quantities displayed for each item
# So that the customer has an itemized list

# 5.As a cashier
# I want to have the option to complete the sale
# So that I know the total amount owed

# 6.As a cashier
#I want to be prompted to continue entering items until sale is complete
#So that I can calculate the total price of all items in the sale

# ACCEPTANCE CRITERIA
# 1. Menu should be displayed with items and prices
# 2. Menu should include a selection for completing the sale
# 3. Cashier should be prompted to enter an item from the menu
# 4. Cashier should be prompted to enter the quantity of items purchased
# 5. Subtotals and quantities for each item must be displayed when completing the sale
# 6. Cashier should be continually prompted to enter items until sale is complete


require 'time'

puts "Welcome to James's Coffee Emporium!\n"
puts "1) Add item - $5.00 - Light Bag"
puts "2) Add item - $7.50 - Medium Bag"
puts "3) Add item - $9.75 - Bold Bag"
puts "4) Complete Sale"

prices = []
amount_due = 0
light_bag_q = 0
medium_bag_q = 0
bold_bag_q = 0

while true
  puts "Make a Selection: "
  selection = gets.chomp

  if selection == "1"
    puts "How many bags?"
    quantity = gets.chomp
    light_bag_q += quantity.to_i
    subtotal_l = light_bag_q * 5.0
    puts "Your subtotal light bags is #{subtotal_l}"
  elsif selection == "2"
    puts "How many bags?"
    quantity = gets.chomp
    medium_bag_q += quantity.to_i
    subtotal_m = medium_bag_q * 7.5
    puts "Your subtotal medium bags is #{subtotal_m}"
  elsif selection == "3"
    puts "How many bags?"
    quantity = gets.chomp
    bold_bag_q += quantity.to_i
    subtotal_b = bold_bag_q * 9.75
    puts "Your subtotal for bold bags is #{subtotal_b}"
  elsif selection == "4"
    puts "====Sale Complete===="
    break
  elsif selection.match(/\A[1-4]?\z/) == nil
    puts "Input invalid."
    next
  end
end
puts "$ #{subtotal_l} - Light #{light_bag_q}"
puts "$ #{subtotal_m} - Medium #{medium_bag_q}"
puts "$ #{subtotal_b} - Bold  #{bold_bag_q}"
total = subtotal_l.to_f + subtotal_m.to_f + subtotal_b.to_f
puts "Total: $#{total}"

puts "What is the amount tendered?"
tender = gets.chomp

if tender.match(/^\d+(\.\d{2})?$/) == nil
  puts "Warning! Invalid currency detected! Exiting..."
else

      change = (tender.to_f - total.to_f).round(2)
      if change > 0
        puts "====THANK YOU!======= \nThe total change due is $#{change}\n#{Time.now.asctime}\n==================="
      elsif change < 0
        puts "Customer still owes #{change.abs}"
      else
        puts "No change due"
      end

end









