class Stylesheet < ActiveRecord::Base
	belongs_to :account

	validates :color, :color_header, :border_color, css_hex_color: true, allow_blank: true

	def self.font_families
		["Andale Mono", "Arial", "Arial Black", "Arial Narrow", "Arial Rounded MT Bold", "Avant Garde", "Baskerville", "Big Caslon", "Bodoni MT", "Book Antiqua", "Brush Script MT", "Calibri", "Calisto MT", "Cambrio", "Candara", "Century Gothic", "Consolas", "Copperplate", "Courier New", "Didot", "Franklin Gothic Medium", "Futura", "Garamond", "Geneva", "Georgia", "Gill Sans", "Goudy Old Style", "Helvetica", "Hoefler Text", "Impact", "Lucida Bright", "Lucida Console", "Lucida Sans Typewriter", "Lucida Grande", "Monaco", "Optima", "Palatino", "Papyrus", "Perpetua", "Rockwell", "Rockwell Extra Bold", "Segoe UI", "Tahoma", "Times New Roman", "Trebuchet MS", "Verdana"]
	end

end
