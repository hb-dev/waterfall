require 'open-uri'

class Newsfeed < ActiveRecord::Base
	belongs_to :account

	validates :name, :api_key, :channel, presence: true
	validates :material_limit, numericality: { only_integer: true, less_than_or_equal_to: 100 }, allow_blank: true
	
	def self.material_types
		%w[pressreleases news blog_posts events images videos documents contact_people]
	end

	def self.material_order_types
		%w[published updated created]
	end

	def request_list_url
		request_params = {
			type_of_media: material_type,
			order: material_order,
			limit: material_limit,
			start_at: material_start_at,
			end_at: material_end_at
		}.delete_if { |key, value| value.blank? }
		request_url = "http://www.mynewsdesk.com/partner/api/1_0/#{api_key}/channel/#{channel}/material/list?#{request_params.to_query}"
	end

	def request_pressroom_url(pressroom_id)
		request_url = "http://www.mynewsdesk.com/partner/api/1_0/#{api_key}/channel/#{channel}/pressroom/view/?pressroom_id=#{pressroom_id}"
	end

	def get_items
		items = []

		response = Nokogiri::XML(open(request_list_url))
		source_items = response.xpath("//item")
		source_items.each do |source_item|
			item = {
				id: source_item.xpath("id").text,
				pressroom_id: source_item.xpath("pressroom_id").text,
				header: source_item.xpath("header").text,
				url: source_item.xpath("url").text,
				type_of_media: source_item.xpath("type_of_media").text,
				published_at: source_item.xpath("published_at").text,
				summary: source_item.xpath("summary").text,
				image_thumbnail_medium: source_item.xpath('image_thumbnail_medium').text
			}
			pressroom_image = get_pressroom_image(item[:pressroom_id])
			item.merge!(pressroom_image: pressroom_image)
			items.push(item)
		end
		items
	end

	def get_pressroom_image(pressroom_id)
		request = Rails.cache.fetch(pressroom_id, :expires_in => 1.day) do
  		open(request_pressroom_url(pressroom_id)).read
		end		
		response = Nokogiri::XML(request)
		pressroom_image = response.xpath("//logotype/image[@size='small']").text
	end
	
end
