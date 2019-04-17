require_relative 'base'

module Whois
  module Scanners

    class WhoisNicIr < Base

      self.tokenizers += [
          :skip_empty_line,
          :skip_comment,
          :scan_key_value
      ]
      tokenizer :skip_comment do
        @input.skip(/^%.*\n/)
      end

      tokenizer :scan_key_value do
        if @input.scan(/(.+?):\t\t?(.*?)\n/)
          key, value = @input[1].strip, @input[2].strip
          target = @tmp['_section'] ? (@ast[@tmp['_section']] ||= {}) : @ast

          if target[key].nil?
            target[key] = value
          else
            target[key] = Array.wrap(target[key])
            target[key] << value
          end
        end
      end

    end
  end
end
