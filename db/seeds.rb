# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

account = Account.create!(email: 'email@example.com', password: '12345678', password_confirmation: '12345678')
Newsfeed.create(account_id: account.id, name: 'ad:tech London (seed)', api_key: 'LY6eZJ5rZDqDuzBQWBHbVA', channel: 607)
Newsfeed.create(account_id: account.id, name: 'ad:tech London, filtered (seed)', api_key: 'LY6eZJ5rZDqDuzBQWBHbVA', channel: 607, material_type: 'pressreleases')
Newsfeed.create(account_id: account.id, name: 'IBM Deutschland GmbH (seed)', api_key: 'cba6cdea6c4b63e1ee25c0501bdfb0e4', channel: 624)
Newsfeed.create(account_id: account.id, name: 'IBM Deutschland GmbH filtered (seed)', api_key: 'cba6cdea6c4b63e1ee25c0501bdfb0e4', channel: 624, material_type: 'blog_posts')