# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "User1", email: "user1@gmail.com", mobile_no: "91101000",
            password: "91101000", password_confirmation: "91101000", admin: true)

2.upto(10) do |i|
  User.create!(name: "User#{i}", email: "user#{i}@gmail.com", mobile_no: "9#{(103 + i).to_s(2)}", password: "9#{(103 + i).to_s(2)}", password_confirmation: "9#{(103 + i).to_s(2)}")
end

Brand.create!(name: "Dettol", manufacturer: "Reckitt Benckiser", manufacturer_email: "indiahelp@rb.com", manufacturer_office: "AJC Bose Road, Kolkata - 700017.")
Brand.create!(name: "Saffola", manufacturer: "Marico", manufacturer_email: "investor@marico.com", manufacturer_office: "Saltlake Sector 5, Kolkata - 700091.")
Brand.create!(name: "Brooke Bond", manufacturer: "Hindustan Unilever Limited", manufacturer_email: "levercare.customer@unilever.com", manufacturer_office: "Shakespeare sarani, Kolkata - 700071.")
Brand.create!(name: "Lakme", manufacturer: "Hindustan Unilever Limited", manufacturer_email: "levercare.customer@unilever.com", manufacturer_office: "Shakespeare sarani, Kolkata - 700071.")

Category.create!(name: "Personal Care", description: "Items related with personal hygine and beautification.")
Category.create!(name: "Health", description: "Items related with health and well being.")
Category.create!(name: "Food and edibles", description: "Items related to food and food making.")
Category.create!(name: "Cosmetics", description: "Items related to imporving appearance.")
Category.create!(name: "Snacks and Beverages", description: "Items related to snacks.")

Item.create!(name: "Antiseptic Liquid", brand_id: 1, category_id: 2, price: 260.00, minimum_required_stock: 40, procurement_time_in_weeks: 4, quantity: "1ltr", total_stock: 120, in_stock: 90)
Item.create!(name: "Total Pro Heart Conscious Edible Oil", brand_id: 2, category_id: 3, price: 315.00, minimum_required_stock: 25, procurement_time_in_weeks: 5, quantity: "2ltr", total_stock: 50, in_stock: 40)
Item.create!(name: "Original Bathing Bar Soap", brand_id: 1, category_id: 1, price: 46.00, minimum_required_stock: 60, procurement_time_in_weeks: 3, quantity: "125g", total_stock: 150, in_stock: 150)
Item.create!(name: "Peach Milk Soft Creme Moisturizer", brand_id: 4, category_id: 4, price: 90.00, minimum_required_stock: 40, procurement_time_in_weeks: 4, quantity: "50g", total_stock: 100, in_stock: 50)
Item.create!(name: "9 to 5 Long Wear Nail Color (Red Boss)", brand_id: 4, category_id: 4, price: 198.00, minimum_required_stock: 20, procurement_time_in_weeks: 3, quantity: "9ml", total_stock: 80, in_stock: 30)
Item.create!(name: "Red Label Tea", brand_id: 3, category_id: 5, price: 185.00, minimum_required_stock: 60, procurement_time_in_weeks: 4, quantity: "500g", total_stock: 150, in_stock: 150)

Allotment.create!(user_id: 2, item_id: 1, allotment_quantity: 30)
Allotment.create!(user_id: 3, item_id: 2, allotment_quantity: 10)
Allotment.create!(user_id: 4, item_id: 4, allotment_quantity: 50)
Allotment.create!(user_id: 4, item_id: 5, allotment_quantity: 30)

Issue.create!(user_id: 3, item_id: 2, issue_description: "Oil quality has degraded. Samples are often found adultured with mineral oils.")
Issue.create!(user_id: 4, item_id: 4, issue_description: "Bottle caps are broken. Brushes are of low quality.")
