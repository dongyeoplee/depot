# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'active_record/fixtures'

# Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "products")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "products")
Product.create(title: 'Programming Ruby 1.9', description: 'Ruby is the fastest growing and most exciting dynamic language out there. If you need to get working programs delivered fast, you should add Ruby to your toolbox.', image_url: 'ruby.jpg', price: 49.95)

PaymentType.create(name: "Check")
PaymentType.create(name: "Credit Card")
PaymentType.create(name: "Purchase order")