module PagesHelper


	def clear_code(language , code_string)
		return clear_javalike_code(code_string) if language.eql?("java") || language.eql?("c") || language.eql?("cpp") || language.eql?("scala") || language.eql?("java_script") || language.eql?("go")
		return clear_rubylike_code(code_string) if language.include?("ruby")
		return clear_clojurelike_code(code_string) if language.eql?("clojure")
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

	def clear_clojurelike_code(code_string)
		complete_string = ""
		code_string.split(/[\r]/).each do |line|
				puts line
		        line = line.gsub(/;.*/, "")
				ap line
		        complete_string = complete_string + line if not line.strip.chomp.empty?
		end
		return complete_string
	end

end
