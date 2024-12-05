require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'content-type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        env['REQUEST_URI'] = '/quotes/a_quote' 
        env['PATH_INFO'] = '/quotes/a_quote' 
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
        [200, {'content-type' => 'text.html'},
        [text]]
      rescue
      end
    end
  end
end
