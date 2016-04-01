module ProcExamples
  # Error class for out of range options
  class OptionRangeError < StandardError
  end

  # Options object
  class Options
    VERSION = '0.0.1'.freeze
    attr_reader :version, :brightness
    def initialize
      @version = VERSION
      @brightness = 100
    end

    def brightness=(num)
      check_range(num, 'Brightness')
      @brightness = num
    end

    private

    def check_range(number, option)
      if number < 0 || number > 100
        raise OptionRangeError, "#{option} out of range"
      end
    end
  end

  # Proc examples
  module CaptureBlock
    # Class that has options that is needs to configure
    class SomeClass
      def self.configure
        options.tap do
          yield options if block_given?
        end
      end

      def self.options
        @options ||= Options.new
      end
    end
  end
end
