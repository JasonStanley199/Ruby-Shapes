require 'rubygems'
require 'gosu'
require './circle'

# The screen has layers: Background, middle, top
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow < Gosu::Window
  def initialize
    super(640, 400, false)
  end

  def draw
    draw_quad(0, 0, 0xff_ffffff, 640, 0, 0xff_ffffff, 0, 400, 0xff_ffffff, 640, 400, 0xff_ffffff, ZOrder::BACKGROUND)
    # see www.rubydoc.info/github/gosu/gosu/Gosu/Color for colours
    draw_triangle(300, 50, Gosu::Color::RED, 200, 150, Gosu::Color::RED, 400, 150, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
    draw_quad(200, 150, Gosu::Color::AQUA, 200, 350, Gosu::Color::AQUA, 400, 150, Gosu::Color::AQUA, 400, 350, Gosu::Color::AQUA, ZOrder::MIDDLE)
    draw_quad(275, 250, Gosu::Color::WHITE, 275, 350, Gosu::Color::WHITE, 325, 250, Gosu::Color::WHITE, 325, 350, Gosu::Color::WHITE, ZOrder::MIDDLE)
    draw_quad(500, 250, Gosu::Color::GRAY, 525, 250, Gosu::Color::GRAY, 500, 350, Gosu::Color::GRAY, 525, 350, Gosu::Color::GRAY, ZOrder::MIDDLE)
    draw_quad(0, 0, 0xff_ffff00, 640, 0, 0xff_ffff00, 0, 400, 0xff_ffff00, 640, 400, 0xff_ffff00, ZOrder::BACKGROUND)

    img2 = Gosu::Image.new(Circle.new(50))
    img2.draw(442.5, 200, ZOrder::TOP, 1.5, 0.5, Gosu::Color::GREEN)
    img2.draw(457, 175, ZOrder::TOP, 1.25, 0.5, Gosu::Color::GREEN)
    img2.draw(480, 150, ZOrder::TOP, 0.75, 0.5, Gosu::Color::GREEN)
  end
end

DemoWindow.new.show