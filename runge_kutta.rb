require 'dentaku'

class RungeKutta
  attr_reader :results

  def initialize(func, t_value, y0_value, step, borders)
    @func = func
    @t_value = t_value.to_f
    @y0_value = y0_value.to_f
    @step = step.to_f
    @btm_border = borders[0].to_i
    @high_border = borders[-1].to_i
    @results = find_runge_kutta
  end

  private

  def evaluate(t_value, y_value)
    evaluator = Dentaku::Calculator.new
    evaluator.evaluate(@func, t: t_value, y: y_value)
  end

  def find_runge_kutta
    y = @y0_value
    until @t_value + @step >= @high_border

      k1 = @step * evaluate(@t_value, y).to_f
      k2 = @step * evaluate(@t_value + 0.5 * @step, y + 0.5 * k1).to_f
      k3 = @step * evaluate(@t_value + 0.5 * @step, y + 0.5 * k2).to_f
      k4 = @step * evaluate(@t_value + @step, y + k3).to_f

      y += (1.0 / 6.0) * (k1 + 2 * k2 + 2 * k3 + k4).to_f
      puts y

      @t_value += @step
    end
  end
end

def test
  func = 'y + 3 * t - t ^ 2'
  y_value = 1
  step = 0.1
  borders = [0, 5]
  t_value = borders[0]

  expression = RungeKutta.new(func, t_value, y_value, step, borders)
  expression.results
end

#test

puts 'Enter your formula :'
func = gets.chomp
puts 'Enter y value :'
y_value = gets.chomp
puts 'Enter step :'
step = gets.chomp
puts 'Enter bottom border :'
bottom_border = gets.chomp
puts 'Enter high border :'
high_border = gets.chomp
borders = [bottom_border.to_i, high_border.to_i]
t_value = borders[0]

puts 'Your results :'
expression = RungeKutta.new(func, t_value, y_value, step, borders)
expression.results
