require 'gosu'
require './backdrop'
require './player'

class Game < Gosu::Window
    def initialize
        super(768, 480, false)
        self.caption="Dreamwave"

        @backdrop = Backdrop.new("bg.png")

        @dude = Player.new("sw0rd.png")

        @dude.move_to 450
    end

    def needs_cursor?
        true
    end

    def draw
        ##@backdrop.draw 0, 0, 0
        @backdrop.draw
        ##@dude.draw(100, 100, 1, 3, 3)
        @dude.draw
    end

    def update
        if button_down? char_to_button_id("a")
            @dude.move_left
        elsif button_down? char_to_button_id("d")
            @dude.move_right
        elsif button_down? char_to_button_id("w")
            @dude.move_up
        elsif button_down? char_to_button_id("s")
            @dude.move_down
        end
    end

end

Game.new.show