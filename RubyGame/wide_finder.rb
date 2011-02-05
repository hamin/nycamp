class WideFinder
  
  attr_accessor :filename
  
  def initialize(filename)
    @filename = File.read(filename)
  end

  def results(how_many)
    results = Hash.new(0)
    @filename.each_line do |line|
      url = line.split(' ')[6].split('?').first 
      results[url] += 1
    end
    
    results = results.sort_by{|k,v| v}
    total_num = results.length
    results.slice(total_num - how_many, how_many).reverse.collect{|a| "#{a[1]}: #{a[0]}"}
  end

end
