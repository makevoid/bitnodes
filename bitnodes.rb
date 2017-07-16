require "open-uri"
require 'nokogiri'

page = URI.parse("https://blockchain.info/connected-nodes").read

page = Nokogiri::HTML page

# HTML parsing to get the IP rows
tds = page.css "#connected-nodes > tbody > tr > td:nth-child(1)"
ips = tds.map(&:inner_text).map(&:strip)

# remove duplicates
ips.uniq!

# if you plan to use them all then sorting is ok:
ips.sort!

# if you plan to just use some then use sample:
# ips = ips.sample

# some "good" default configs (enable transaction indexing, increase max connection number and size of cache + memory pool)
head = "# bitcoin conf w/ mass forced addnode
maxconnections=400
txindex=1
dbcache=10000
maxmempool=1000

"

count_info = "# #{ips.size} nodes\n"

nodes = ips.map{ |node| "addnode=#{node}" }.join "\n"

File.open("bitnodes.txt", "w") do |file|
  file.write "#{head}#{count_info}#{nodes}"
end
