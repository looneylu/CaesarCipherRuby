def caesar_cipher(string, shift_factor)
    downcase_char_array = 'a'.upto('z').to_a
    upcase_char_array = 'A'.upto('Z').to_a
    spec_char_array = ('!'..'?').to_a

    word_chars_arr = string.split("")
    ciphered_string = ""
    word_chars_arr.each {|char|
        char_helper = char
        char_helper = char_helper.downcase if upcase_char_array.include? char_helper
        char_index = downcase_char_array.index(char_helper)
        ciphered_char = '';
        
        cipher_proc = Proc.new {
            if char_index != nil && char_index-shift_factor >= 0
                ciphered_char = downcase_char_array[char_index - shift_factor]
            elsif char_index != nil && char_index-shift_factor < 0
                ciphered_char = downcase_char_array[25-((char_index-shift_factor).abs - 1)]
            else
                ciphered_char = " "
            end        
        }
        
        if spec_char_array.include? char
            ciphered_char = char
        elsif upcase_char_array.include? char
            cipher_proc.call
            ciphered_char = ciphered_char.upcase
        else
            cipher_proc.call
        end
    
        ciphered_string += ciphered_char
    }
    puts ciphered_string
end

caesar_cipher("This is my sample string with a LOT OF CAPS!", 3)
