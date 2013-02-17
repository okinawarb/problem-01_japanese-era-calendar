#!/Users/siman/.rbenv/shims/ruby
# encoding: utf-8

require 'date'

class Problem
  def initialize(year_str)
    @date = Date.parse year_str

    @date_set = {:meiji =>  ["明治", Date.parse("1868-01-01"), Date.parse("1912-07-29")],
             :taisho => ["大正", Date.parse("1912-07-30"), Date.parse("1926-12-24")],
             :showa =>  ["昭和", Date.parse("1926-12-25"), Date.parse("1989-01-07")],
             :heisei => ["平成", Date.parse("1989-01-08"), Date.parse("2013-02-13")]
    }
  end

  def checker
    case @date
    when @date_set[:meiji][1]..@date_set[:meiji][2]
      convert(:meiji)
    when @date_set[:taisho][1]..@date_set[:taisho][2]
      convert(:taisho)
    when @date_set[:showa][1]..@date_set[:showa][2]
      convert(:showa)
    when @date_set[:heisei][1]..@date_set[:heisei][2]
      convert(:heisei)
    else
      puts "考慮していません"
    end
  end

  def convert(name)
    num = @date.year - @date_set[name][1].year + 1
    puts "#{@date_set[name][0]}#{num}年#{@date.month}月#{@date.day}日"
  end
end

p = Problem.new(ARGV[0])
p.checker
