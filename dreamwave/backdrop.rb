class Backdrop < Gosu::Image

    def initialize(file)
        super("assets/#{file}", false)
    end

    def draw
        super 0, 0, 0
    end
    
end