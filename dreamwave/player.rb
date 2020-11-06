class Player
    # any variables

    def initialize(file)
        @image = Gosu::Image.new("assets/#{file}", false)
        @pos_x = 0
        @pos_y = 100
    end

    def move_to(x)
        @pos_x = x
    end

    def move_left
        @pos_x -= 1
    end

    def move_right
        @pos_x += 1
    end

    def move_up
        @pos_y -= 1
    end

    def move_down
        @pos_y += 1
    end

    def draw
        @image.draw(@pos_x, @pos_y, 1, 3, 3)
    end
    
end
