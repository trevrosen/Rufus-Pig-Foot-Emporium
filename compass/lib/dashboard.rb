require "redis_cacheable"

class Pig
  attr_reader :mature, :has_chunky, :foot_size

  def initialize(foot_size,mature=false, has_chunky=false)
    @foot_size = foot_size
    @mature, @has_chunky = mature, has_chunky
  end

end

class Dashboard
  attr_accessor :id, :pig_quantity, :pig_list, :avg_pig_foot_size
  include RedisCacheable

  def initialize(id)
    @id = id
  end

  def avg_pig_foot_size
    @avg_pig_foot_size ||= lambda{
      pig_list.map(&:foot_size).inject(:+) / pig_list.size
    }.call
  end

end


d = Dashboard.new(5)

puts "The cache key is #{d.rc_cache_key}" 

d.pig_quantity = 13456
d.pig_list = [Pig.new(5.555, true), Pig.new(6.543, false, true)]

d.rc_write!

f = d.rc_read!



# dumped = d.rc_marshal_dump

# p dumped

# f = d.rc_marshal_load(dumped)

p f.class

p f.avg_pig_foot_size


