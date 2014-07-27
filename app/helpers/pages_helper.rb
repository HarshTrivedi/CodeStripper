module PagesHelper


	def clear_code(language , code_string)
		return clear_javalike_code(code_string) if language.include?("java") || language.include?("c") || language.include?("cpp")
		return clear_rubylike_code(code_string) if language.include?("ruby")
	end

	def clear_javalike_code(code_string)
		complete_string = ""
		code_string.split(/[\r]/).each do |line|
				ap line
		        line = line.gsub(/(\/\/[\S \t]*$)/m , "")
		        complete_string = complete_string + line if not line.strip.chomp.empty?
		end
		complete_string.gsub(/\/\*[\s\S]*\*\//m, "\r")
	end

	def clear_rubylike_code( code_string)
		complete_string = ""
		code_string.split(/[\r]/).each do |line|
				ap line
				puts (/#/).match(line).inspect
				puts (/["'].*#.*["']/).match(line).inspect
				if (not (/#/).match(line).nil?) and ((/["'].*#.*["']/).match(line).nil? )
					line = line.gsub(/(#.*)/ , "")
				end
		        complete_string = complete_string + line if not line.strip.chomp.empty?
		end
		complete_string.gsub(/(^=begin[\s\S]*^=end)/, "\r")
	end

end
