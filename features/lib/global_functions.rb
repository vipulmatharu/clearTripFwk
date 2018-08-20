require 'capybara'

include Capybara::DSL

class GlobalFunctions
  class << self
    def waitFor(time=0)
      sleep(time)
    end

    def dropDownExist(param)
      future = Time.new + 30
      while Time.new < future do
        if all("#ui-id-#{param} li").size > 0
          all("#ui-id-#{param} li")[0].click
          break
        end
      end
    end
  end
end
