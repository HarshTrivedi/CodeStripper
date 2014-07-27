require 'coderay'
class PagesController < ApplicationController
	include PagesHelper
	def new

	end

	def clear_my_code
		code_string = params[:code]
		language = params[:language]
		@cleared_code = clear_code(language , code_string)
		render :js => "$('#cleared_code').html( #{code} ) ; document.body.style.paddingBottom = \"150px\"; document.body.style.background = '#FAFFFF' ; document.body.style.paddingTop = \"100px\";" 

	end

end
