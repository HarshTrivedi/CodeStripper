require 'coderay'
class PagesController < ApplicationController
	include PagesHelper
	def new

	end

	def clear_my_code
		code_string = params[:code]
		language = params[:language]
		@cleared_code = clear_code(language , code_string)
		@pretty_code = CodeRay.scan(@cleared_code, language).page.inspect
		render :js => "$('#cleared_code').html(" + @pretty_code  + ");" + "document.body.style.paddingBottom = '150px';" + "document.body.style.paddingBottom = '150px';" + "document.body.style.background = '#EBFAF9' ;" + "document.body.style.paddingTop = '45px';$('#spin_icon').removeClass('fa-spin');"
	end

end
