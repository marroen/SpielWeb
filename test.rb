require 'rubygems'
require 'gosu'

puts "hello world"
puts "1" + "5"
puts "I am going to become the best Ruby game dev in the world"

class DemoWindow< Gosu::Window

    def initialize
        super(1280, 720, false)
        self.caption="Gosu Demo Window"
    end

    def needs_cursor?
        true
    end

    def draw
        x=640
        y=360
        size=120
        draw_quad(x-size, y-size, 0xff00ffff, x+size, y-size, 0xff00ffff, x-size, y+size, 0xff00ffff, x+size, y+size, 0xff00ffff)
    end

end

DemoWindow.new.show